---
title: 在2019年用Rails和Python做一款RSS阅读器+小圈子社交（的服务端）
---
# 在2019年用Rails和Python做一款RSS阅读器+小圈子社交（的服务端）


作为一个20年Ruby老粉，这篇文章主要分享一下~~我一开始觉得4周就能搞定的项目，是如何拖延到4个月的~~一些经验和教训。如果对产品有兴趣，请看文末的链接。

## 美好的规划

系统分析时，后端分Web Server和爬虫两块，作为RSS服务，对标Feedly free plan无可挑剔；社交部分对标weibo，那就包括了：

数据model如下：

- 用户
- 源
- 集
- 评论
- tag
- 主题
- 若干HABTM关联

Web Server这块也就是这些model的CRUD嘛，对于一个CRUD老男孩来说这有何难？

爬虫这几年积累了好几种，分别是：

- 使用Python/feedparser对应RSS
- 基于Headless Chrome的Puppeteer，用JavaScript来对付使用JavaScript进行数据加载的xx新闻类网站
- 对于成名新闻网站直接扒的newspaper3K
- 基于Huginn的监视一般index/detail类型的新闻网站更新

逻辑就是爬完了用统一的http post发到Web Server的接收api就齐活儿。

## 问题来了：

### 诸多异构爬虫的糟糕数据结构

Python/JavaScript/Ruby的爬虫都使用JSON进行数据汇总，基本的参数比如title/created_at/content/html/summary/author都没什么问题，一旦Web Server端进行了migration——比如Atom和RSS格式有用published_at的，newspaper3K也有支持，表示文章的原始发布时间，更多爬来的文章没有这一项，会fallback到created_at上。published_at这column本来没有，可以migrate一下吧？

Migrate之后，发现要去4个爬虫进行修改，还是语言异构的——简直求生不得——直到某天一位爬虫界高人一语点醒：不应该使用任何Headless Chrome类的工具，如果是无需登录的资源，必然可以通过分析页面，而获得爬取方法。

### 干掉Headless Chrome
 
我尝试了一下，某些要先下载js执行后再渲染的网站，手工进行requests.get和parse也很方便，这一步还可以数据化，在配置文件里写一段代码进行邪恶的eval（配置文件里的代码都是自己准备的，不会有被黑的风险，没那么邪恶...吧）

关键是：省内存啊！为了无脑进行DOM生成和渲染需要加载Headless Chrome的V8引擎，连带这网站上所有的广告——最多我见过消耗300M内存的Chrome进程，而且如果不进行超时限制，4G内存的豪华服务器也会被几个僵尸worker消耗到崩溃；设了超时吧，有些内容又加载不上——好吧，又得到人生一课：Headless Chrome就不是拿来做生产爬虫用的。

### 干掉Huginn

我的Huginn是跑在Docker里，只负责监视URL，有动静了就按照预定义的规则扒下来post出去——用Python改造一下也可以嘛！那些Huginn自带的DOM操作，Python用selectolax.parser也可以做。干掉Huginn之后，省了不少装Docker Image的硬盘空间。

### 因为要NLP所以终于同构了

每篇文章都要生成summary和tags，原来的Ruby和JavaScript爬虫不能做，得靠crontab从Web Server里拿出来进行二次处理(蛋疼到无以复加），把异构的爬虫重构以后，现在同构了，都遵循如下步骤：

1. 从网站配置文件找index-detail
2. 看是否爬过了（使用本地的sqlite3存已经post成功的url和title）
3. 爬取文章本身
4. 就地NLP
5. 连summary/tags一起post到Web Server，一次成功

### 好像也不需要那么久啊？

只考虑API only的Rails服务和上述爬虫的确如此，但涉及到洗爬来的数据和反复重构，理论上的活儿也不少——还没到实战呢：

基本功能上线后，先拿V2EX月经贴：“诸位大佬平时写博客吗”里收集来的博客地址进行测试。

### 实战开始

为了易用性，可以直接输入博客的首页HTML地址而不是RSS URL添加源，这就需要在Rails里用Ruby对HTML/RSS进行预处理，一百多个博客录入下来：有超时的，有没提供RSS/Atom的，有拒绝除了Webkit之外Agent的（那你干嘛还出RSS?），还有输出RSS格式不对的......还好Feedjira和Nokogiri够给力！

### 那也不到4个月吧？

作为全（hen）周（cha）期（qian）开发者，锅当然推到前端的Vue/Element UI/Buefy一家三口身上了！不过那就是另一个故事了...

## 成品

阅读器已经做好上线了，产品逻辑在[这篇文章](https://www.v2ex.com/t/591634#reply19)里说了，有兴趣可以去体验一下:

[移动版](https://m.readcog.cn/)

[桌面版](https://www.readcog.cn/)
