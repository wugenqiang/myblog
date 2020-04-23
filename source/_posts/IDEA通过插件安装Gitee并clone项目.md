title: IDEA通过插件安装Gitee并clone项目
tags:
  - Gitee
  - IDEA
urlname: git_idea_clone
categories:
  - 技术
author: WuGenQiang
photos:
  - 'https://i.loli.net/2019/04/11/5caef8dc5b775.jpg'
date: 2019-04-08 18:00:18
updated: 2019-04-08 18:00:18
---
# 一、前言
在最新插件版本: 2018.3.1.（2019-01-10 发布）中码云 IDEA 插件已经由gitosc更名为gitee。
同时值得注意的是：新版插件gitee菜单已经和git菜单合并。
# 二、安装插件
## 1. 通过“插件管理”安装
启动 IDEA，在启动界面选择菜单Configure-Plugins
在弹出的插件市场中搜索关键字Gitee，在搜索结果中找到Gitee插件，点击Install安装插件。
重启 IDEA 使插件生效

![](https://wugenqiang.github.io/PictureBed/pictures/20190429204057.png)
## 2. 通过“首选项->插件”安装
启动 IDEA，选择菜单File-Settings打开），选择Plugins
在弹出的插件市场中搜索关键字Gitee，在搜索结果中找到Gitee插件，点击Install安装插件。
重启 IDEA 使插件生效

# 三、登陆并拉取仓库代码
## 1. 启动 idea，选择VCS- Check out from Version Control - git
说明：因为最新版本发生了变更，gitee 选项和 git 已经合并，所以这里选择git

![](https://wugenqiang.github.io/PictureBed/pictures/20190429204150.png)
## 2. 输入登录名和密码绑定gitee

![](https://wugenqiang.github.io/PictureBed/pictures/20190429204239.png)

如图所示：

![](https://wugenqiang.github.io/PictureBed/pictures/20190429204319.png)

## 3. 选择仓库进行clone
点击选框中的向下箭头，会显示当前用户在码云上的所有仓库，可选择任意仓库进行 clone

![](https://wugenqiang.github.io/PictureBed/pictures/20190429204351.png)

## 4. 查看效果

![](https://wugenqiang.github.io/PictureBed/pictures/20190429204425.png)
到这里就算ok了，接下来就可以直接通过IDEA导入项目，然后通过git进行pull和push操作了，在这里我就不做演示了，如有问题可以留言,或者点击右下角和我在线交流。