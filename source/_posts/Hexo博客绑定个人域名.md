title: Hexo博客绑定个人域名
urlname: hexo-do-domain
tags:
  - Hexo
  - 域名
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-04 15:47:54
updated: 2019-04-04 15:47:54
---

前段时间用hexo搭建的gitpage个人博客，域名默认也是 github 下的二级域名：username.github.io, 
现在为了提升格调准备将自己的博客指向一个新的域名。
<!--more-->

下面来记录下过程。

# 1 购买域名
如果想要免费的域名，可以到下面网址购买：http://www.dot.tk/en/index.html?lang=en
当然，如果有条件，最好到阿里云或者腾讯云等地方购买域名，听说1元优惠域名还是很多的

# 2 域名解析
首先获取自己 github 的二级域名的 IP地址，windows 下直接在 cmd 里 Ping 一下自己的博客就会得到 IP 地址：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404155814.png)

我的ip是185.199.111.153
下面通过 DNS域名解析将购买的域名指向 github 的二级域名：username.github.io，
我的是在腾讯云购买的1元用一年的，
进入腾讯云的管理控制台-域名与网站-云解析 DNS，进入域名的解析设置，点击新手指导，将得到的 IP 地址填到记录值一栏，点击确定就 OK 了。填完以后的解析列表会出现：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404162502.png)

记录值就是自己 github 的二级域名的 IP地址。

# 3 设置CNAME
在 hexo 项目下，source 文件夹下面创建 CNAME 文件（没有后缀名的），在里面写上购买的域名。比如：
blog.enjoytoshare.club

在 github 上面，打开 username.github.io 项目的（Settings）设置，然后在 GitHub Pages的 Custom domain设置里填上购买的域名。比如：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404162901.png)

好了，新域名配置完成，可以访问了。

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404163631.png)



