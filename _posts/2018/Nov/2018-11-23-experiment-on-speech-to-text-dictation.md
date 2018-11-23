---
title: 语音听写单词 app，为什么所有智能音箱都没做呢？
---
# 语音听写单词 app，为什么所有智能音箱都没做呢？

想给三年级的娃做一个语音背单词app，场景很简单：app通过tts念出单词中英文，用stt将娃说的字母和原词对比，看是否一致，全程语音完成，不用看手机，保护视力——这么杀手级的应用，为什么所有智能音箱都没做呢？

我试用了如下工具和库：
- voixen-vad
- iOS Speech Framework(react-native-voice)
- Pocketsphinx.js

```
app: “请背单词星期一，Monday”
娃: “M O N D A Y”
app: “您说的是MNDEY，请重试”
娃: “...”
```


正确率最好的(iOS)也不过六七成正确率左右，这里是每个字母的听写正确率，几个字母连一块能否认对基本就看脸了。
——请注意，这里的“M O N D A Y”为了使用体验，必须进行整体识别。如果加个按钮，按一下识别一个字母倒是可以把正确率提高到99%以上——但这样做app还有人愿意用吗？

说白了iOS的近场语音识别还是面向正常会话和整句逻辑建模，拿来背单词显然不合适，不过因此发现了一个[听写的各种用法合集](https://www.oreilly.com/library/view/iphone-the-missing/9781449372781/ch04.html)，通过各种预定义annotation来实现特种输入，Apple也不容易......

目前能想到的唯一方案，这哥们[做过类似的](https://github.com/JohannesBuchner/spoken-command-recognition)，就是把常用1500单词列出来，让娃从头到尾拼写一遍，我录音、手动标注之后用TF调参训练，再导入CoreML，听起来很有爱，但只对一个娃有效......

——谨献给认为AI即将统治世界的人们
