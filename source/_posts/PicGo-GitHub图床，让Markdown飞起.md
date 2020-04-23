title: PicGo + GitHub 图床，让 Markdown 飞起
urlname: hexo-do-optimization-picture
tags:

  - Markdown
categories:
  - ToolBox
author: WuGenQiang
date: 2019-03-31 16:37:53
updated: 2019-03-31 16:37:53
---
<center>PicGo + GitHub 图床，让 Markdown 飞起</center>

<!--more-->



注：这段话写于 2020 - 04 -23，这篇文章这种方式在之前还是很棒的，但是随着 PicGo 支持 Gitee 插件之后，更好的图床工具就出现了，所以建议你使用新方式：[Typora + PicGo + Gitee 实现图片上传功能](https://wugenqiang.github.io/articles/Typora-PicGo-Gitee-PictureBed-Cool.html)，当然还可以继续浏览本篇文章，这种方式依然能用！

# 1 PicGo 介绍

这是一款图片上传的工具，目前支持微博图床，七牛图床，腾讯云，又拍云，GitHub 等图床，未来将支持更多图床。

所以解决问题的思路就是，将本地的文件，或者剪切板上面的截图发送图床，然后生成在线图片的链接，这样就可以

让Markdown 文档飞起来了，走到哪就可以用到哪~~

在众多的图床中，我选择的 GitHub 图床，其它类型的图床如果你们有兴趣的话可以试一下，主要我对于 Github 有特殊的感

情，很难割舍~~

# 2 下载 PicGo

## 2.1 进入下载链接

下载链接为：https://github.com/Molunerfinn/PicGo/releases/tag/v2.0.5

## 2.2 选择安装包下载

![](https://wugenqiang.github.io/PictureBed/pictures/20190331164455.png)

## 2.3 安装软件包

![](https://wugenqiang.github.io/PictureBed/pictures/20190331164603.png)

# 3 创建 GitHub 图床
## 3.1 需要注册/登陆 GitHub 账号

> 已经有了自行跳过这一步

> 申请 GitHub 账号很简单，我就不演示了

## 3.2 创建 Repository

随便命名，我的比较简单，直接是 PicGo

## 3.3 生成 Token

生成一个 Token 用于操作 GitHub repository

Settings -> Developer settings -> Personal access tokens 

![](https://wugenqiang.github.io/PictureBed/pictures/20190331165930.png)

![](https://wugenqiang.github.io/PictureBed/pictures/20190331170203.png)

然后确定提交，复制生成一串字符 token，这个 token 只出现一次，所以要保存一下。

![](https://wugenqiang.github.io/PictureBed/pictures/20190331170410.png)

# 4 配置 PicGo 客户端
如下图配置：

![](https://wugenqiang.github.io/PictureBed/pictures/20190331170716.png)

说明：

+ 仓库名 即你的仓库名
+ 分支名 默认 master
+ Token 就是刚刚复制的那一串字符
+ 存储路径 这个可以填也可以不填，填了的话图片就上传到这个文件夹
+ 域名 这个要改一下 格式： ~~https://raw.githubusercontent.com/[仓库名]/master~~ 
  + 注明：修改日期 2020 - 04 -23
  + 自定义域名，改成：https://cdn.jsdelivr.net/gh/[GitHub 名]/[仓库名]@master  例如：https://cdn.jsdelivr.net/gh/wugenqiang/PictureBed@master 这种方式不用开启 GitHub Pages
  + 或者域名改成 https://[GitHub 名].github.io 比如：https://wugenqiang.github.io 但是有一个前提，你要到相应的图床仓库里找到 setting，把 GitHub Pages 开启，像下图这样：

![image-20200423125444978](https://gitee.com/wugenqiang/PictureBed/raw/master/CS-Notes/20200423125447.png)

然后点确定就OK了，不妨试试。

# 5 小结一下

PicGo 是一个不错的软件，真的很好使用，虽然我只用了两天，但是我爱不释手，我之前自己写过图床，但是需要有自己的

云服务器才可访问，所以我自己上网查资料，找到了这个好用的图床工具。

上面的步骤都设置好之后，就可以让自己的 Markdown 文档飞起来了，来试试吧~~

