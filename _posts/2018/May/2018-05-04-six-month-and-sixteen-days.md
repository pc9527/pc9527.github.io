---
title: React Native诚意不够的三点
---
# React Native诚意不够的三点

## 缺点

### Learn Once, write everywhere

选择React Native的开发者，“性价比”肯定是主要原因。选型时发现虽然分了iOS和android两个视图，但ListView/Navigation啥的似乎都是通用的嘛！跑demo也没啥问题，看来写一遍代码就可以适配俩平台了，赶紧入坑吧！

“一入侯门深似海”真是放之四海而皆准，一旦进入具体功能开发，需要用到各控件比如toast/picker/segment/FAB的时候，发现还真没有跨平台的，能用的就文档首页列出来那几个。而且我就需要一个统一通用布局的

```
<Container>
  <Header />

  <Content />
  
  <Footer />
</Container>

```
也没有。

这时“社区活跃”的优点就体现出来了，github上俩最高star的react-native-elements和nativebase都是为了让开发者只写一遍视图代码而生的工具。经过试用，前者偏重于小而美的UI，比如按钮/search bar；后者则提供了整体页面布局的容器如上面提到的Container/Header/Content和基于flexbox的Grid/Row/Col等等，这俩结合起来基本够用。

nativebase是一个印度软件外包服务商的产品，因为facebook团队迭代太快，所以不太能跟得上节奏，虽然nativebase的更新在社区里已经很算活跃了，但还是落后React Native主版本3个月以上。体现在工程上，就是基于nativebase写一遍能用于iOS和android的代码，不能第一时间获得React Native的bugfix和性能提升以及新功能，怎么取舍看需求了。

Facebook那么有钱，能不能像Flutter那样把UI层给趟成一条道啊？

### 运行时性能

Facebook出的产品，精神上都继承了那句“Move fast and break things”，move fast是好的，只是不知道break了谁的things——一般都是用户的，毕竟move fast的总占上风。所以要想不被带到沟里，得比facebook团队还要快。

虽然facebook对React Native的更新很快，但更新的内容并不一定符合我的需求：新功能开发走向和roadmap制定源于社区投票和facebook第一方应用的需求，根据0.55版以前的changelog来看，更新的重点在于：适配更多的新设备，支持更多的原生功能，使React Native本身更易用。对于至今还没发布1.0版的开发工具来说，这个发展策略很正确，1.0发布时肯定是很好很强大的产品。

但性能优化就靠后了，很难想象经历了40多个版本的发布直到0.43版才推出新的FlatList，代替会渲染全部元素的ListView控件。而且即便是基于虚拟渲染窗口VirtualizedList的FlatList和SectionList，性能依然不能令人满意，估计facebook的测试数据不到1000条？后来几经调试，改小了windowSize才勉强把主UI线程跑到了50帧以上。

这里推荐一下react-native-largelist，采用lazy渲染，但凡是不太需要频繁刷新的超长列表（比如外卖菜单，每个section和section里的element起码一个工作日里不太可能会增减），perf monitor里双60帧毫无压力。

就iOS版的React Native来说，从js context映射到main queue是一条不可逾越的性能沟壑。但现在最新的0.55已经开始Animated tracking已经可以useNativeDriver来驱动，即便js线程停了，ui还是丝滑得很。希望这种做法早日能扩展到其他控件上——参见把鼠标驱动放到系统ring0层的Windows——就算死机了，我的鼠标指针还能动！

### Restricted Freedom

React Native本身的功能很简单纯粹，就是一个虚拟dom渲染引擎，把代码里的<View>等标签映射到虚拟dom树之后，再转换成UIView等native的控件（同理react是把jsx里的div渲染成浏览器里的div）。但开发一个app需要的远不止于此：需要进行数据状态管理，导航控制，表单处理，数据持久化......

React Native对功能整合的做法是典型的Unix方式：由每个工具提供功能和接口，用户把所有工具串联起来完成业务逻辑。当初弃了Angular入坑React Native的最后一根稻草就是这很Unix很自由，和我这后端出身的太衬了！

充分行使了React Native给予的自由之后，才发现是有代价的。比如数据状态管理，官方的方案是flux，社区最流行redux，mobx最酷炫，选择相对最安全的redux了吧，还跟immutable.js不兼容（在做网页版dashboard的时候，redux和导航用的react-router还有3.x - 4.x的破坏性版本更新，用最新的吧，版本还是alpha的，说多了都是泪）。

到了action管理，又有thunk和saga让你左右为难：thunk简单明了，但不停dispatch失之繁琐；saga一个异步函数收工，但需要精心设计......

都是成熟的工具库，完成本领域的工作毫无压力，但在开发者整体认知能力一定的情况下，把这些集成起来配合工作不出幺蛾子的可能性可以忽略不计——而且各个组件的文档通常是很少会出现和其他库集成的例子——api变得太快，我自己的还可以控制，引用别人的回头改了这sample就不能跑了啊喂！

加上我又是Anders三十年老粉，Typescript是一定要用的，但我能说微软github上那个react的starter涵盖了一个app的30%日常功能都不到吗？这是逼着人举一反三哪！

有些库（对就是你nativebase）的功能代码js更新了，但是对应的Typescript definition还是旧的，编辑器很尽责地告诉你这里type不对，不能assign，还好Typescript的开放式interface声明估计就是为这个而生的，可解燃眉之急（其实是强迫症，见不得报错）。

x轴是待开发Feature，y轴是各个开源库，z轴是Typescript/ES6/Flow，所幸编辑器Visual Source Code很好使，不然这一团混沌连个抓手的都没有啊！

## 优点

### hot reloading

作为前端开发者，有什么比改完详细页里按钮颜色还要重新编译代码，再从索引页点进去才能看到效果更影响开发速度的呢？

所以用Ionic 1/AngularJS的时候能改完js就快速刷新已经很幸福了，React Native更进了一步：app的state都不变，只刷新刚改的那个组件。这个特性在调整UI阶段节省了我大量时间——当然要是改了dataStore相关的reducer函数还是会要求整体刷新。

相信这个特性也是很多开发者不愿放弃React Native的主要原因。

### 社区活跃

虽然会碰上各种问题，但只要社区够大够活跃，总能提供解决方案——上述所有问题，都有人踩过坑，所以SO和github上都有解法。

至于没人碰到过的问题——恭喜你，已经进入研发的前沿领域了！
