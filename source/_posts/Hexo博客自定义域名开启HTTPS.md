title: Hexo博客自定义域名开启HTTPS
urlname: hexo-do-https
tags:
  - Hexo
  - 域名
  - Https
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-04 16:44:18
updated: 2019-04-04 16:44:18
---

GitHub官方曾经宣布，GitHub Pages的自定义域名获得对HTTPS的支持。

<!--more-->

自己博客没有启用HTTPS，看到消息后，就想着折腾下吧。其实，很简单的，对着官方教程一步步来就可以了。

首先，打开仓库的Settings，找到GitHub Pages项，有一个Enforce HTTPS，在前面的框打上钩就可以了。
完成后，博客就全站支持HTTPS了。


![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404165057.png)

效果如下：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404165246.png)

但是爆红就让人心态不好了，所以下面使用Netlify来优化https方案

Netlify (推荐)
* 可以使用 CLI 上传代码
* 支持自定义域名且自定义域名支持一键开启 https（证书来自 Let’s Encrype）
* 支持强制让用户通过 https 访问网站（开启后此功能后，http 的访问一律会 301 跳转到 https
* 支持自动构建
* 支持重定向（Redirects）和重写（Rewrites）功能
* 数据通过 HTTP2 协议传输
* 提供 webhooks 与 API

# 1 Netlify
Netlify是一家专注于提供静态网站托管服务的公司，通过自己的内容分发网络，将提前建立好的静态页面呈献给访客，节约了加载的时间。
## 1.1 部署网站

首先去 Netlify 注册账号登录（https://www.netlify.com/）

接着点击页面右上角的 New site from Git

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404170805.png)

这里选择的 GitHub ,别忘记勾选访问公共仓库选项.之后授权给 Netlify 指定Repository,然后 Deploy

设置自定义域名
点击 Domain settings 然后点击 Add custom domain.

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404171035.png)

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404171134.png)

然后到域名解析处,修改域名CNAME记录,记录值就是设置完域名页面显示的配置值

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404172505.png)

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404172429.png)

## 1.2 添加SSL证书
设置完成域名绑定后,设置中心选项有所变化 , 点击

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404173233.png)

至此配置完成

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404173821.png)

效果显示：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404174519.png)

完美~~