title: PicGo+GitHub图床，让Markdown飞起
urlname: hexo-do-optimization-picture
tags:
  - Markdown
categories:
  - Markdown
author: WuGenQiang
date: 2019-03-31 16:37:53
updated: 2019-03-31 16:37:53
---
<center>PicGo+GitHub图床，让Markdown飞起</center>

<!--more-->

# 1 PicGo介绍

这是一款图片上传的工具，目前支持微博图床，七牛图床，腾讯云，又拍云，GitHub等图床，未来将支持更多图床。

所以解决问题的思路就是，将本地的文件，或者剪切板上面的截图发送图床，然后生成在线图片的链接，这样就可以

让Markdown文档飞起来了，走到哪就可以用到哪~~

在众多的图床中，我选择的GitHub图床，其它类型的图床如果你们有兴趣的话可以试一下，主要我对于Github有特殊的感

情，很难割舍~~

# 2 下载PicGo

## 2.1 进入下载链接

下载链接为：https://github.com/Molunerfinn/PicGo/releases/tag/v2.0.5

## 2.2 选择安装包下载

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331164455.png)

## 2.3 安装软件包

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331164603.png)

# 3 创建GitHub图床
## 3.1 需要注册/登陆GitHub账号

> 已经有了自行跳过这一步

> 申请GitHub账号很简单，我就不演示了

## 3.2 创建Repository

随便命名，我的比较简单，直接是picGo

## 3.3 生成Token

生成一个Token用于操作GitHub repository

Settings -> Developer settings -> Personal access tokens 

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331165930.png)

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331170203.png)

然后确定提交，复制生成一串字符 token，这个 token 只出现一次，所以要保存一下。

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331170410.png)

# 4 配置PicGo客户端
如下图配置：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331170716.png)

说明：

+ 仓库名 即你的仓库名
+ 分支名 默认 master
+ Token 就是刚刚复制的那一串字符
+ 存储路径 这个可以填也可以不填，填了的话图片就上传到这个文件夹
+ 域名 这个要改一下 格式： https://raw.githubusercontent.com/[仓库名]/master

然后点确定就OK了，不妨试试。

# 5 小结一下

PicGo是一个不错的软件，真的很好使用，虽然我只用了两天，但是我爱不释手，我之前自己写过图床，但是需要有自己的

云服务器才可访问，所以我自己上网查资料，找到了这个好用的图床工具。

上面的步骤都设置好之后，就可以让自己的Markdown文档飞起来了，来试试吧~~