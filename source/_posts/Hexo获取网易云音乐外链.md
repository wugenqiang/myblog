title: Hexo获取网易云音乐外链
urlname: hexo-do-music-link
tags:
  - Hexo
categories:
  - Hexo
author: WuGenQiang
date: 2019-03-17 14:50:29
updated: 2019-03-17 14:50:29
---

# Hexo获取网易云音乐外链

网易云音乐MP3外链真实地址获取方法，可用于各种背景音乐、直链播放…

## 一、进入网易云音乐官网

打开[网易云音乐](https://music.163.com/)，找到喜欢的歌，复制网址的ID，

例如：

![网易云音乐外链7.png](https://i.loli.net/2019/03/17/5c8def694f412.png)

地址为：https://music.163.com/#/song?id=350909

id就是350909

那么，这首歌的MP3外链地址就是：https://music.163.com/song/media/outer/url?id=350909.mp3

是不是很简单呢，咱们来播放一下

![网易云音乐外链8.png](https://i.loli.net/2019/03/17/5c8defddbac24.png)

## 二、放入Hexo中播放

使用下面的格式，插在你希望的地方就可以啦：

```
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/song/media/outer/url?id=350909.mp3"></iframe>
```
![网易云音乐外链9.png](https://i.loli.net/2019/03/17/5c8df101905c1.png)

可以自己到我的技术博客那个音乐吧浏览，底部哦

这是地址，比小心心~~ [我是地址点我点我哟](https://wugenqiang.github.io/laboratory/music/index.html)

其实这个还有一个好处就是可以下载，唯一的小缺憾就是不美观耶，不过耳朵舒服呢
