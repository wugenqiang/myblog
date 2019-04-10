title: Hexo文章中图片点击实现全屏查看
urlname: hexo-do-picture-screen
tags:
  - Hexo
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-06 14:10:48
updated: 2019-04-06 14:10:48
---
![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/062.jpg)

<!--more-->
# 1 写在前面
方法一存在图片放大后不美观，建议直接跳到方法二
如果想尝试解决第一种方法出现的Bug，可以尝试一下，然后我们讨论一下，方便的话可以加我QQ：2422676183

# 2 方法一
## 2.1 修改post-details.js文件

文件目录：/themes/next/source/js/src/post-details.js
在文件最后添加：

```js
//----自定义js----------------
function createImgEventFullScreen() {
  var imgs = $(".post-body").find("img");
  console.log(imgs);
  for(var i = 0;i < imgs.length;i++) {
    // $(imgs[i]).click(createCover(imgs[i]));
    imgs[i].onclick= function(e) {
      var src = e.srcElement.currentSrc;
      createCover(src)
    }
  }
  function createCover (src) {
    console.log(src);
    var cover = $("<div id='fullScreenCover' class='zhao-cover-img-container'><img class='zhao-cover-img' src='"+src+"'/></div>");
    $("#fullScreenCover").remove();
    $("body").append(cover);
    $("body").addClass("zhao-no-scroll");
    $("#fullScreenCover").click(function(){
      $("#fullScreenCover").remove();
      $("body").removeClass("zhao-no-scroll");
    })
  }
}
setTimeout(function(){
  createImgEventFullScreen();
},1000)
```
## 2.2 修改custom.styl文件

文件目录：/themes/next/source/css/_custom/custom.styl
在文件最后添加：

```css
.zhao-cover-img-container{
 position: fixed;
 top: 0;
 left: 0;
 width: 100%;
 height: 100vh;
 z-index: 10002;
 text-align: center;
 background-color: #000;
 overflow-y: scroll;
}
.zhao-cover-img{
 width: 100%;
 position: absolute;
 top: 0;
 bottom: 0;
}
.zhao-no-scroll{
 width: 100%;
 height: 100vh;
 overflow: hidden;
}
```
不过还是会存在一个小bug，大图片图片放大时有点不美观
如果您知道如何解决可以给我留言，谢谢啦

# 3 方法二
这种方法使用了图片浏览放大功能fancybox插件

## 3.1 切换到lib目录

```java
cd next/source/lib
```
## 3.2 下载插件

```java
git clone https://github.com/theme-next/theme-next-fancybox3 fancybox
```
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406155520.png)

## 3.3 更改主题配置文件
更改next/_config.yml文件

```java
fancybox: true
```
## 3.4 测试效果
部署hexo s之后点击图片，如图：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406155801.png)

完美，这种效果我很满意，你觉得呢，还是大神优秀啊~~ 好好学习！