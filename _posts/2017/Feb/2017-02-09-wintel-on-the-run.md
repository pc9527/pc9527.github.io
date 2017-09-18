---
title: 变本加厉的Wintel联盟
---
# 变本加厉的Wintel联盟

昨天我运行Windows 10的台式机网卡出了问题：想断一会儿网，于是禁用本地连接，再双击启用，死机了；尝试安装驱动程序，显示注册表数据库已经损坏。分别试了官网驱动、驱动精灵、卸载驱动、安全模式，无效。

以前吐槽过自从印度人当上大佬之后，微软的产品质量一年不如一年，但总认为Windows作为微软的基本盘，还是靠得住的。没想到一个在Windows 7上操作了几百上千次的简单操作，在Windows 10上居然会让系统直接死机，而且还会导致驱动程序都装不上，也卸载不了。

Host系统挂了，上面安装的平常工作用的虚拟机也随之无法访问，这对生产力的影响就太大了啊！然而，想回退到Windows 7？没那么容易！且不说Intel 100系的芯片组把EHCI主控替换成了XHCI主控，等于间接砍掉了对没有XHCI主控的驱动的Windows 7的支持。

想装Windows7？先去看看主板厂商有没有提供XHCI驱动的patch吧。就算良心厂商提供了驱动，还得劳烦老板您自己给ISO打补丁，什么，您不是专业装机人士？那还不赶紧升级Windows 10？看看微软是怎么解释的：

> “Windows 7 was designed nearly 10 years ago before any x86/x64 SOCs existed. For Windows 7 to run on any modern silicon, device drivers and firmware need to emulate Windows 7’s expectations for interrupt processing, bus support, and power states, which is challenging for WiFi, graphics, security, and more. As partners make customizations to legacy device drivers, services, and firmware settings, customers are likely to see regressions with Windows 7 ongoing servicing.”

简言之，微软认为：Windows 7是10年前设计的，面对现在Intel和各家硬件厂商出品的牛x核心配件和外设，需要用模拟老式的系统终断、总线支持、电源状态管理的方法来达成兼容，继续让Windows 7服役，对用户体验是一种倒退。

在Dos年代，虽然Wintel早已勾搭到了一块，但好歹只是通过增加软件功能让旧硬件显得性能不济来引诱用户升级电脑，获得更好地体验；而今天明明技术上并没有鸿沟，却人为设置障碍，说得还好像是为了用户着想一样。

看看苹果的macOS，当年从Power PC转Intel之后，第一代Intel CPU的mac运行今天的El Captain版本操作系统毫无问题，换个ssd硬盘还能跑得飞快；而Linux各发行版从来不挑硬件，512M内存+单核CPU照跑不误。macOS和Linux不用支持老硬件？Wintel这种作为，只能让人评论：无耻啊！无耻啊！

当然这跟潮流是有关的，Wintel的基本盘PC市场已经多年没有增长，要想继续获取利润只能在现有用户里挖潜，于是“挤牙膏”和“不兼容”这两个商业手段就摆上台面了。

好在市场不是垄断的，生活娱乐类需求，有更方便快捷的iOS+Android，需要生产力的环境，还可以用mac，至不济我折腾一下Linux桌面。Windows你要是再不争点气连我这个30年老粉丝都要弃暗投明的话，那就真没戏了。
