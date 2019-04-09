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

Git提交正确步骤：
（1）git init //初始化仓库
（2）git add .(文件name) //添加文件到本地仓库
（3）git commit -m “first commit” //添加文件描述信息
（4）git remote add origin + 远程仓库地址 //链接远程仓库，创建主分支
（5）git pull --rebase origin master // 把本地仓库的变化连接到远程仓库主分支
（6）git push -u origin master //把本地仓库的文件推送到远程仓库

考虑了很多方面，觉得还是进行托管最符合我们的需求。

# 三、实现
当然可以直接通过IDEA进行上传到Github或者Gitee上，为了熟悉一下git操作，在这里使用一下git基础命令来完成上传任务。

## 1.新建repository
在Github下创建一个新的repository，取名为`myblog`。(与本地的Hexo源码文件夹同名即可)
创建的时候`最好为空`，最好`不要勾选创建README.md`,否则后面会有小问题，不过我会提供解决办法。

## 2.创建仓库
进入本地的Hexo文件夹(E:\work\myblog)，在这个地方使用`git Bash here`执行以下命令创建仓库:
```
git init
```
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409192241.png)

## 3.修改.gitignore文件

如果没有请手动创建一个，在里面加入`*.log` 和 `public/` 以及`.deploy*/`。因为每次执行`hexo g`命令时，上述目录都会被重写更新。因此忽略这两个目录下的文件更新，加快push速度。
注：如果文件中有`*.log` 和 `public/` 以及`.deploy*/`这些的时候，直接进行下一步：

## 4.提交Hexo源码
执行以下命令，完成Hexo源码在本地的提交：
```
git add .
git commit -m "添加hexo源码文件作为备份"
```

## 5.设置远程仓库地址
```
git remote add origin https://github.com/wugenqiang/myblog.git
```
### 5.1 fatal: remote origin already exists
如果遇到如图所示问题：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409194211.png)

解决办法如下：
（1）先删除远程 Git 仓库
```
git remote rm origin
```
（2）再添加远程 Git 仓库
```
git remote add origin https://github.com/wugenqiang/myblog.git
```
发现问题成功解决

    如果在GitHub上创建远程仓库时，勾选了 Initialize this repository with a README这项，导致远程仓库不为空，为了不出现Bug，请先执行第4步，若远程仓库为空，则忽略第4步，直接进行第5步操作！
## 6.远程仓库合并到本地
```
git pull --rebase origin master
```
我就属于创建README.md的一群人，真的是习惯造成的，执行这一步效果如下：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409202006.png)

## 7.更新远程仓库
```
git push -u origin master
```
效果如下：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409202215.png)

如果创建仓库不为空而且不执行第4步直接执行第5步则会出现：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409202447.png)



<center>[原文链接，尊重原作者产权](https://notes.doublemine.me/2015-04-06-%E5%A4%87%E4%BB%BDHexo%E5%8D%9A%E5%AE%A2%E6%BA%90%E6%96%87%E4%BB%B6.html)</center>

