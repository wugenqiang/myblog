title: 自动备份Hexo博客源文件
tags:
  - Hexo
urlname: auto_backup_blog_source_files
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-09 18:15:46
updated: 2019-04-09 18:15:46
---
# 一、前言
自从接触了Hexo+NexT之后，发现离不开了，以后有能力的时候一定重新架构一下，使得更加个性化，最大程度的满足我们对于软件的需求，大家都知道，如果写东西在本地的话，最怕的应该就是更换电脑，还要重新搭建博客了，所以备份对于我们来说特别重要！备份博客就是本篇博客文章的主旨了，一定要攻下这座城堡。
我曾经看过Git备份Hexo博客源文件的方式，这种方式虽然能够备份Hexo博客的源文件，但是对于我这种懒人，每次更新博文都需要输入两三行重复的Git命令真是一件麻烦的事情。况且指不定哪天就搞忘push到github上了。你说是不是，所以这篇文章出现了……

<!--more-->
# 二、原理
通过监听Hexo的事件来完成自动执行Git命令进行自动备份，查阅[Hexo文档](https://hexo.io/zh-cn/api/events.html)，找到了Hexo的主要事件，见下表：

事件名|事件发生时间
:---:|:---:
deployBefore|在部署完成前发布
deployAfter|在部署成功后发布
exit|在 Hexo 结束前发布
generateBefore|在静态文件生成前发布
generateAfter|在静态文件生成后发布
new|在文章文件建立后发布

于是我们就可以通过监听Hexo的`deployAfter`事件，待上传完成之后自动运行Git备份命令，从而达到自动备份的目的。
# 三、实现
## 1.将Hexo目录加入Git仓库
本脚本需要提前将Hexo加入Git仓库并与Github或者Gitee远程仓库绑定之后，才能正常工作。如果你不知道怎么操作，请参考这篇博文：
* [Git命令手动备份Hexo博客源文件](https://notes.doublemine.me/2015-04-06-%E5%A4%87%E4%BB%BDHexo%E5%8D%9A%E5%AE%A2%E6%BA%90%E6%96%87%E4%BB%B6.html)

<center>[原文链接，尊重原作者产权](https://anson2416.github.io/posts/c4d910e6/)</center>

