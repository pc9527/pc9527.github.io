---
title: 看RSS为什么选ReadCog？
---
## 看RSS为什么选ReadCog？

### ReadCog是什么？

太长不看：和小伙伴互相评论对方订阅RSS信息流的web应用。
目标用户：维护自己的阅读列表，且有意愿向小伙伴们就日常信息流表达看法。

部署在阿里云青岛机房，速度可以保证(当然，连通性就...)

### 首先要有一个RSS阅读器

当作Feedly免费版(lite)看吧，写了分别基于Buefy和Element UI的移动和桌面版本，和运营多年的Feedly比肯定多有bug和UI/UX的问题(一直在修正，欢迎提交)，目前提供如下功能：

- Github OAuth和Microsoft登录
- 同步未读消息数
- 信息流没有30天的限制，可以一直往前刷直到源刚添加那一天
- 支持OPML导入
- 国内常用（好吧是我自己常用）的若干源（20多个？）一键订阅
- 手机号+临时验证码有登录，但没开注册，特别想用手机号注册的请联系站长

计划中功能：

- 搜索（阿里云要70块钱一天，好贵）
- 基于NLP/LSI的推荐系统(这个已经在开发机写完可以Beta调参了然而部署上去还是好贵啊细吧）
- ...

上面这俩未上线主要是不属于核心工具属性逻辑且运营费用太高，等站长存点钱或者找到赞助了可以秒上。


### 在闺蜜/兄弟眼里，你就是大V！

“独学而无友，则孤陋寡闻”——有见解还是要和小伙伴互相交换一下意见——ReadCog的评论流是仿照m.weibo.cn整的，但和微博有UGC审核员所以可以公共发布不同，在ReadCog只能在你邀请加入的小伙伴中进行小范围（上限5人）发布，嗯.....你懂的。

目前能公共发布的只有自我审查的站长......哪位看官有足够的觉悟和热情，想上公共时间线，欢迎联系站长。

作为一个不需要靠带流量卖电动牙刷和冰棍儿的“小大V”，只想就“运用自如”或者“毙鼠山庄”说两个段子，朝5人小组发布其实足够了，本意是模拟中午和组里同事吃饭时吹牛的场景。

### 话题呢？

中午饭桌上大家一般先低头刷一下手机，找到了谈资才抬头发言。在ReadCog，RSS信息流的作用就是集中提供话题，而且还是自己选定的。请务必找到能谈得来的基友，否则只能像公共时间线上的站长一样自言自语自high了...

### 来了？

最后列出url，同时说明一下，ReadCog是我做给自己用来代替Feedly的阅读器，只要我还看RSS（已经看十几年了），就会继续运营下去——包括自言自语自high自审查公共时间线——有文章开头类似需求的小（老）伙伴们，来吧！

[移动版](https://m.readcog.cn/)

[桌面版](https://www.readcog.cn/)

[slack技术支持群](https://join.slack.com/t/readcog/shared_invite/enQtNzE4MzcxNTYxNTUzLTFlZjVkY2Y4ZWQ2YWM1NjBmYjdmYzRjYzQwZTljYzE5MjNhYTA3MTBmYWEwODdkYjI5OTMyZGZjODQ4ZDQ4YjQ)
