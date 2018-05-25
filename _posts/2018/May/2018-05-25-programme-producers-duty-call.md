---
title: 程序员当制片（野生)
---
# 程序员当制片（野生)

最近制作了俩视频，同时担任制片/编剧/画外音/导演/摄像/场记/道具/主演/剪辑/推广，和写代码比起来，是不一样的体验，干这两行的有空可以互相感受一下：

## 介绍工序

第一步当然是确定制作什么。和写程序的高度确定性不同，“拍什么”可以来自于一个念头，也可以是一个再创作——昆汀塔伦蒂诺的一系列灵感来源，很多发自70/80年代港片，BTW我是80/90年代的。

然后就是写脚本，作为短片，没有复杂到剧本的程度，但必须知道哪里开始哪里结束，片长就在这时控制。

下面就是制作了，内容除了传统的摄像设备拍摄，技术类的还可以来源于录屏，后期配音，这一步相当花时间，导演/摄像/场记/道具/主演这五个角色需要轮流切换，想一步到位那是不可能的：“一条过”==“无bug”

剪片子之前先心中拜一拜麦子善大神，面对杂乱无章的同期声、配音、视频、音乐素材和专业的软件界面，只能多练了。

## 工具选择

创意期间，都不知道会在什么场合——如果在梦里别忘了就行。

写脚本时当然是最顺手的文本编辑器(Emacs)，写完了可以放屏幕上或者平板上，拍摄的时候看着。

录屏MacOS上QuickTime，Windows 10上Win+G，都不用装软件。

如果实地要拍摄footage的，那么摄像设备必不可少，最省钱的当然是一部手机搞定，当然要想效果好点，三脚架+松下微单是性价比之选——3000以内搞定，再往上RED啥的那就没边了。

剪片子的硬件需要一台牛逼电脑，SSD那是必须的，否则会卡到崩溃；CPU我用Intel i3 6300，编译程序还凑合，但出片的时候会后悔没买i7；显卡反正是要玩游戏的，选能买得起的最好的吧，CUDA/OpenCL/Metal都支持的只有N卡了。

剪辑软件和电脑硬件一样都是丰俭由人，我第一个片子用iMovie在低配MBP mid 2014上剪的，期间风扇轰鸣，cpu温度一直在70以上，这些都可以忍，但是因为标榜自己专业所以要加字幕，iMovie只能手动，结果64段字幕加了8小时，无料很好，但时间无价啊！一定要买专业的可以自动导入字幕的：

专业软件里居然是苹果的Final Cut Pro X最便宜，1999一次性买断，然而在我的Hackintosh上居然会崩溃到session logout到登陆界面，一查发现因为最新版用了很多Metal API，N卡的土制web驱动兼容性有问题——本来都快付钱了，幸好试用了30天。

而Adobe Premiere CC 2018没问题，用的引擎是Mercury OpenCL，导出速度比FCPX快一倍。但价钱实在相当坑爹：国行3999一套，还不能升级；cloud版的日区正在做活动相当便宜：700一年，但需要填写信用卡地址——有朋友在国外的可以去麻烦他们。

其他的如Edius/Vegas因为社区和教程不是特别丰富，基本就不考虑了，就在准备下血本买Pr美区一年服务的时候，发现了神器Davinci Resolve。

本来Resolve是用来给视频调色的——在业余制作里，就没有调色这一道工序啊喂——但到了15版之后剪辑功能也一应俱全，最关键的是：public beta版是免费的！要啥自行车啊就你了。

## 感想

视频是线性的，决定要消费之后，就必须一直看下去直到点赞或者关闭，10秒/1分/15分长度给人的心理压力是不一样的，能讲完事情，越短越好。

随着技术进步，软硬件基础设施功能越来越强，x音等短视频app只需要有idea和一部手机就可以制作出万人景仰的作品来，制作视频再也不是高高在上的阳春白雪，而是可以和亲朋好友分享生活的有力工具——玩玩吧!