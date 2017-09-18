---
title: twitter钱都花哪儿了
---
# twitter钱都花哪儿了

> Twitter发布的最新财报显示，2016财年第四季度收入7.17亿美元，同比增长1％，净亏损1.67亿美元，而上年同期为净亏损9000万美元。

> 整个2016财年，Twitter收入25亿美元(约合人民币171.6亿元)，同比增长14％，净亏损4.57亿美元

> 微博2016年第三季度非美国通用会计准则净营收2.723亿美元，较上年同期增长22%，运营利润3630万美元，较上年同期增长147%

看体量，微博市值115.10亿，大概能和Twitter市值114.60亿等量齐观，但别忘了，微博从上市第一天就处在微信的阴影下，股价也在十几美刀徘徊了很久。“微博要不行了”的判断比比皆是。直到阿里入股，给微博带来了含金量高出以往的流量，同时借移动互联网的东风，直播和短视频业务也蓬勃发展，作为网红的最佳自我展示平台，有这些优势支持，战略对头，2016年开始才又红火了起来。

作为被微博Copy To China的原型twitter，收入比微博多好几倍，但为啥到头来还是亏了？看看这张2013年的统计图：

![source: bloomberg](http://upload-images.jianshu.io/upload_images/185376-b291ee9dea0b1a8f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
其中研发+运营成本占到了绝大部分,twitter的2013年第三季度财报现实，52%的同期收入(revenue)花在了研发上。对比同期其他科技公司：Google是15%,Facebook上市前是14%,上市后飙升到25%——但人家小扎在赚钱啊喂！

## 研发成本

先说说研发这块，看看twitter的技术栈演化，根据2013年[Evolution of The Twitter Stack](http://www.slideshare.net/caniszczyk/twitter-opensourcestacklinuxcon2013)：

> 2006
> Ruby on Rails
> MySQL
> 
> 2008+
> Ruby on Rails
> MySQL  (TweetStore, Flock)
> Redis, Memcache
> 
> 2010+
> Netty (reverse proxy)
> JVM (java, scala)
> MySQL (TweetStore, Flock, etc)
> Redis, Memcache


2016年当然又加入了Hadoop/Docker/Mesos等生产力相关的工具。和facebook一同作为西方“自由世界”的网络基础设施，twitter的技术难点只有一个：稳定。当年表示系统服务崩溃的大鲸鱼错误页面最近几年已经基本消失不见了，说明Twitter的工程师们干得不错。

在[他们的博客](https://blog.twitter.com/engineering)上经常有一些真知灼见，比如这一篇[Omnisearch Index Formats](https://blog.twitter.com/2016/omnisearch-index-formats)，作者姓赵，估计是从清华北大去斯坦福MIT再湾区就业那批精英程序员。文章讲了如何给复杂内容（图文、视频、投票）做索引，能又省空间，搜索得又快。联想到微博改了未读池算法以后的bug频出，如漏掉未读条目和时间线错乱——两边请的主力工程师估计价格要差个10倍——主力：每天干活，处理实际问题，而不是写在BP里“前twitter技术团队大牛”来拉投资用的程序员。

## 运营成本

为了让页面加载更稳更快，twitter干了这三样事:

1. 根据世界地理区域，自建DNS服务器
2. 根据1里DNS解析出的IP，建立对应的CDN内容分发网络
3. CDN后面，自建了和亚马逊S3类似的存储服务Origin

哪里访问不够稳定、不够快？我们去那里建个机房！非洲大草原没有电？建个电厂！不环保？去中国买最好的太阳能发电设备！一句话概括：都是钱啊！

twitter这种规模的投入，才有了在世界各个角落“直播世界”的故事发生。而微博把国内做好就不愁吃穿了，要啥自行车啊？

## 社会投资

twitter的投资人就都是傻逼吗？当然不是。twitter种种不计成本的研发投入，即便公司挂了，也不会成为沉没成本：有价值的项目会以开源形式在github上继续保持活跃；服务3亿日活用户的工程经验，也会被工程部的工程师们作为职业经验带走，像种子一样，在湾区随时发芽。投资人也没吃亏，起码试错了一把，知道了“此路不通”，下次再有傻小子吹牛逼，呵呵。


- Evolution of The Twitter Stack： http://www.slideshare.net/caniszczyk/twitter-opensourcestacklinuxcon2013
- 他们的博客： https://blog.twitter.com/engineering
- Omnisearch Index Formats： https://blog.twitter.com/2016/omnisearch-index-formats
