---
title: React Native新入坑问题速查
---
# React Native新入坑问题速查

本文写于2018-11-20 12:16:55，对应的版本是:

```
"react": "16.6.1",
"react-native": "0.57.5",
```
iOS 12.1
XCode 10.1

Android版要适配的太多，还不如Kotlin或者Flutter走起......

## Typescript支持

1. react-native init AwesomeProject

2. follow [https://facebook.github.io/react-native/blog/2018/05/07/using-typescript-with-react-native](official way)

3. tsconfig.json配置：

```
  "lib": [
      "dom",
      "es2017"
  ],
  "skipLibCheck": true,
  "moduleResolution": "node", 
```

### 曲高和寡

当前，用于React Native的官方导航库react-native-navigation已经更新到了3.x，遗憾的是并没有自带type definition，好在社区有标注，@types/react-native-navigation——但是——只标到了2.x的版本！

如果不是Angular那样直接Typescript第一的库，这就是一个通常情况：最新版本的库没有type definition，要么用老版本，要么自己标注——或者实在懒得标，可以这样蒙混过关：


```
declare module 'react-native-voice' {
    const Voice: any;
    export = Voice;
}
```


## 运行后xcode log不停输出nw_socket_handle_socket_event [C181.1:1] Socket SO_ERROR [61: Connection refused]

[official issue](https://github.com/facebook/react-native/issues/21030)

Edit Scheme => Run => Environment Variables => Add OS_ACTIVITY_MODE:disable

## whatwg-fetch require cycle

0.57版开箱即用的warning，除非去patch lib，否则只能用这种猥琐的方式关掉：

```
import { YellowBox } from 'react-native';
YellowBox.ignoreWarnings(['Require cycle:']);
```

[官方issue](https://github.com/facebook/metro/issues/287)
