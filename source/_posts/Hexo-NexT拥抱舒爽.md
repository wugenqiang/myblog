title: Hexo+NexT搭建博客拥抱舒爽
urlname: hexo-do-optimization
tags:
  - Hexo
  - NexT
categories:
  - Hexo
author: WuGenQiang
date: 2019-03-31 19:01:35
updated: 2019-04-09 13:35:27
---
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190404142303.png)

<!--more-->

# 1 写在前面

本文主要是Hexo+NexT搭建博客并且进行主题的配置以及页面的样式优化

本篇文档参考了许多大佬的文章以及配置文件，在此感谢大佬们。

本文参考的文章都会直接给出原文链接或者以注脚的形式标记出处，如有遗漏，欢迎指出。

本文内容会在后续的优化中慢慢补充完整~~

首先在配置Hexo+NexT之前，最好阅读一下[Hexo官方文档](https://hexo.io/zh-cn/docs/)和[NexT使用文档](http://theme-next.iissnan.com/getting-started.html)

# 2 博客安装和配置

    参考博客：

* [Windows下部署安装Hexo](https://blog.csdn.net/wugenqiang/article/details/88372848)

* [创建Hexo项目](https://blog.csdn.net/wugenqiang/article/details/88373085)

* [Hexo博客上传至Github](https://blog.csdn.net/wugenqiang/article/details/88373385)

* [使用NexT主题优化Hexo博客](https://blog.csdn.net/wugenqiang/article/details/88373990)

# 3 NexT主题优化

## 3.1 修改文章底部#为图标

修改模板/themes/next/layout/_macro/post.swig，

搜索 rel="tag">#，将 # 换成 `<i class="fa fa-envira"></i>`

效果如下图所示：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331200159.png)


## 3.2 点击出现爱心效果

在/themes/next/source/js/love.js下新建文件love.js，接着把该链接下的代码拷贝粘贴到love.js文件中

```
!function (e, t, a) { function n() { c(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"), o(), r() } function r() { for (var e = 0; e < d.length; e++)d[e].alpha <= 0 ? (t.body.removeChild(d[e].el), d.splice(e, 1)) : (d[e].y-- , d[e].scale += .004, d[e].alpha -= .013, d[e].el.style.cssText = "left:" + d[e].x + "px;top:" + d[e].y + "px;opacity:" + d[e].alpha + ";transform:scale(" + d[e].scale + "," + d[e].scale + ") rotate(45deg);background:" + d[e].color + ";z-index:99999"); requestAnimationFrame(r) } function o() { var t = "function" == typeof e.onclick && e.onclick; e.onclick = function (e) { t && t(), i(e) } } function i(e) { var a = t.createElement("div"); a.className = "heart", d.push({ el: a, x: e.clientX - 5, y: e.clientY - 5, scale: 1, alpha: 1, color: s() }), t.body.appendChild(a) } function c(e) { var a = t.createElement("style"); a.type = "text/css"; try { a.appendChild(t.createTextNode(e)) } catch (t) { a.styleSheet.cssText = e } t.getElementsByTagName("head")[0].appendChild(a) } function s() { return "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")" } var d = []; e.requestAnimationFrame = function () { return e.requestAnimationFrame || e.webkitRequestAnimationFrame || e.mozRequestAnimationFrame || e.oRequestAnimationFrame || e.msRequestAnimationFrame || function (e) { setTimeout(e, 1e3 / 60) } }(), n() }(window, document);

```

在\themes\next\layout\_layout.swig文件末尾添加：

```
<!-- 页面点击小红心 -->
<script type="text/javascript" src="/js/src/love.js"></script>
```

效果如下图所示：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331200832.png)


## 3.3 文章加密访问

打开themes->next->layout->_partials->head-unique.swig文件,插入这样一段代码:

```
<script>
    (function(){
        if('{{ page.password }}'){
            if (prompt('请输入查看密码') !== '{{ page.password }}'){
                alert('密码不正确,请询问主编大大！');
                history.back();
            }
        }
    })();
</script>
```
然后在文章上写成类似这样:

```
title: Hexo+NexT拥抱舒爽
tags:
  - Hexo
  - NexT
categories:
  - Hexo
author: WuGenQiang
password: 123456
date: 2019-03-31 19:01:35
updated: 2019-03-31 19:01:35
```
效果如图所示：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190331210050.png)

## 3.4 优化深色代码高亮背景

在主题配置文件修改代码高亮背景为深色背景后，当在博客文章上选择代码时，选择到的颜色也为深色，虽然和背景色还是有点点区别，但是不好区分。所以经过一番研究，才有了以下优化教程。

在myblog/themes/next/source/css/_custom/custom.styl中添加以下样式代码：

```
//page code background-color
.code ::selection {
    background: #2593a6;
    color: #fff;
}


//gitalk code background-color 
.gt-container .gt-comment-content .highlight pre, .markdown-body pre{
    background-color: #2d2d2d;
}
.gt-container .gt-comment-content .highlight ::selection {
    background: #2593a6;
    color: #fff;
}
```

以上代码优化了所以高亮代码区域，包括gitalk评论区的高亮代码。 这些样式代码是通过浏览器调试而得，如有其它样式的需求，可参考本示例在浏览器中调试。

## 3.5 解决NexT主题访问慢
当博客使用Hexo搭建在Github Page上的时候，可能会访问慢，有一个原因是因为fonts.googleapis.com加载极慢，所以Google了一下，发现了解决方案。
把在NexT主题的配置文件`_config.yml`里面的：
```
font:
  enable: true
  # 外链字体库地址，例如 //fonts.googleapis.com (默认值)
  host: 
```
改为：
```
font:
  enable: true
  # 外链字体库地址，例如 //fonts.googleapis.com (默认值)
  # Uri of fonts host. E.g. //fonts.googleapis.com (Default)
  # fonts.lug.ustc.edu.cn是中科大的源,解决Hexo NexT主题访问慢
  host: //fonts.lug.ustc.edu.cn
```
访问速度就很快了！哦耶，当然如果你有更好的解决办法也可以提啊
还有一种方法就是采用Coding+Github双服务器托管Hexo博客，这样访问速度会更快！
如果想进行这样的操作，可以参考我的文章：[Coding+Github双服务器托管Hexo](https://blog.enjoytoshare.club/article/hexo-do-server-hosting.html)
# 4 SEO推广
刚搭建完博客，可能你会发现你发表的文章在谷歌或者百度都搜索不到，因为需要进行SEO优化的，什么是SEO，顾名思义，SEO即(Search Engine Optimization):汉译为搜索引擎优化，下面来总结一下SEO优化的方法，让自己的博文能在谷歌百度上搜索到。
## 4.1 生成sitemap
添加站点地图sitemap
Sitemap用于通知搜索引擎网站上有哪些可供抓取的网页，以便搜索引擎可以更加智能地抓取网站。
安装sitemap站点地图自动生成插件`hexo-generator-sitemap`和`hexo-generator-baidu-sitemap`，用于生成`sitemap`,在`git Bash`中执行以下命令:
```
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
```
修改站点配置文件
将sitemap文件添加到站点配置文件`_config.yml`中，并修改url字段的值，其值默认为http://yoursite.com。
在站点配置文件 `_config.yml`中添加如下：
```
sitemap:
  path: sitemap.xml
baidusitemap:
  path: baidusitemap.xml
  
url: https://blog.enjoytoshare.club
```
配置好后，执行hexo g 就能在网站根目录(public目录)中生成sitemap.xml 和 baidusitemap.xml了;其中第一个是一会要提交给google的，后面那个看名字当然就是提交给Baidu的了；

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409142957.png)

## 4.2 添加蜘蛛协议
网站通过`Robots协议`告诉搜索引擎哪些页面可以抓取，哪些页面不能抓取。`robots.txt` 通常存放于网站根目录(public目录)。由于我们每次hexo clean都会清空public，着实不方便，我们都知道source目录下的文件通过hexo g命令会转换成public中的文件，所以为了方便起见，我们把`robots.txt`文件放在`source`目录下，我的 robots.txt 内容为：
```
User-agent: *
Allow: /
Allow: /archives/
Allow: /categories/
Allow: /tags/
Allow: /notes/
Allow: /love/
Allow: /page/
Disallow: /js/
Disallow: /css/
Disallow: /fonts/
Disallow: /vendors/
Disallow: /fancybox/
Sitemap: https://blog.enjoytoshare.club/sitemap.xml
Sitemap: https://blog.enjoytoshare.club/baidusitemap.xml
```
其中Allow后面的就是你的menu 
请自行将blog.enjoytoshare.club改成自己的域名，然后hexo g提交一下
## 4.3 打开SEO
在主题配置文件`_config.yml`中找到：

```
seo: false
```
将其设置为`true`

## 4.4 提交站点到百度

### 4.4.1 开启百度自动推送
在主题配置文件`_config.yml`中添加如下：
```
baidu_push: true
```
### 4.4.2 将网站链接提交到百度
[百度搜索引擎非验证提交入口](http://www.sousuoyinqingtijiao.com/baidu/tijiao/)
[正式提交入口](https://ziyuan.baidu.com/site/siteadd)

正式提交需要验证，有三种验证方式，我选择Html标签验证，在themes\next\layout \ _partials\head.swing中添加验证代码(根据你实际验证代码来决定这里写什么)：
```
<meta name="baidu-site-verification" content="bqaja5HAOz" />
```
![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190410180738.png)

添加后运行hexo d -g将改动提交，然后点击完成验证，通过即可。

### 4.4.3 登录[百度站长平台](https://ziyuan.baidu.com/site/index)
进行链接提交
添加：
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409154624.png)

出现这个即成功：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409154650.png)

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409154938.png)

## 4.5 提交站点到Google
首先保证你要能翻墙出去，连到谷歌，如果没有VPN，可参考下面网址获取：[工具盒子](https://blog.enjoytoshare.club/laboratory/toolBox/index.html)

### 4.5.1 提交博客域名

打开[Google Search Console](https://www.google.com/webmasters/#?modal_active=none)
根据提示注册好之后，添加你的博客域名。

### 4.5.2 进行站点验证

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409150421.png)
我选择了备用方法中的HTML 标记，将给出的元标记复制到\themes\next\layout\ _partials \head\head.swig文件中。

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409150235.png)

添加后运行hexo d -g将改动提交，稍后就可以验证成功了。

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409150748.png)

### 4.5.3 提交站点地图
还记得我们刚才创建创建sitemap.xml文件吧,现在它要派上用场了。点击左侧工具栏的站点地图

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409151250.png)

提交成功会提示：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409151459.png)

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409151735.png)

## 4.6 验证站点是否被收录
在搜索引擎搜索框输入`site:your.domain`可以查看域名是否被该搜索引擎收录，用户可以使用各大搜索引擎站长工具提交个人博客网址。
### 4.6.1 验证谷歌收录
```
site:blog.enjoytoshare.club
```
域名换成你自己的，谷歌是一定支持的，不过你需要翻墙VPN！如果没有，可参考下面网址获取：[工具盒子](https://blog.enjoytoshare.club/laboratory/toolBox/index.html)，如果没有找到你的博客说明没有被收录！
成功收录会如下图一样：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409165959.png)

### 4.6.2 验证百度收录
```
site:blog.enjoytoshare.club
```
域名换成你自己的，如果没有找到你的博客说明没有被收录！
百度收录是真的需要时间，你看下图还没收录：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409170617.png)