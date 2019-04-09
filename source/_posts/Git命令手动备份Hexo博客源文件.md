title: Git命令手动备份Hexo博客源文件
tags:
  - Hexo
  - Git
urlname: manual_backup_blog_source_files
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-09 19:04:19
updated: 2019-04-09 19:04:19
---

# 一、前言
自从接触了Hexo+NexT之后，发现离不开了，以后有能力的时候一定重新架构一下，使得更加个性化，最大程度的满足我们对于软件的需求，大家都知道，如果写东西在本地的话，最怕的应该就是更换电脑，还要重新搭建博客了，所以备份对于我们来说特别重要！备份博客就是本篇博客文章的主旨了，一定要攻下这座城堡。
我曾经看过Git备份Hexo博客源文件的方式，所以在这里记录一下……

<!--more-->
# 二、方案
想到的解决办法无非是:

* 直接U盘拷贝
* 博客文件托管在Github或者Gitee上

考虑了很多方面，觉得还是进行托管最符合我们的需求。

# 三、实现
当然可以直接通过IDEA进行上传到Github或者Gitee上，为了熟悉一下git操作，在这里使用一下git基础命令来完成上传任务。

## 1.新建repository
在Github下创建一个新的repository，取名为myblog。(与本地的Hexo源码文件夹同名即可)

## 2.创建仓库
进入本地的Hexo文件夹(E:\work\myblog)，在这个地方使用`git Bash here`执行以下命令创建仓库:
```
git init
```
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409192241.png)

## 3.设置远程仓库地址并更新
```
git remote add origin https://github.com/wugenqiang/myblog.git
git push -u origin master
```
## 4.修改.gitignore文件

如果没有请手动创建一个，在里面加入`*.log` 和 `public/` 以及`.deploy*/`。因为每次执行`hexo g`命令时，上述目录都会被重写更新。因此忽略这两个目录下的文件更新，加快push速度。
注：如果文件中有`*.log` 和 `public/` 以及`.deploy*/`这些的时候，直接进行下一步：
## 5.提交Hexo源码
执行以下命令，完成Hexo源码在本地的提交：
```
git add .
git commit -m "添加hexo源码文件作为备份"
```



<center>[原文链接，尊重原作者产权](https://notes.doublemine.me/2015-04-06-%E5%A4%87%E4%BB%BDHexo%E5%8D%9A%E5%AE%A2%E6%BA%90%E6%96%87%E4%BB%B6.html)</center>

