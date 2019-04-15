---
title: Hexo+NexT选取文字提示版权信息
tags:
  - Hexo
urlname: hexoNextSelectWords
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-15 13:37:07
updated: 2019-04-15 13:37:07
---

# 1 写在前面
效果图：

![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190415134019.png)

<!--more-->

# 2 实现
## 2.1 新建`selectionCopyright.swig`文件
首先在`\themes\next\layout\_third-party`目录下新建`selectionCopyright.swig`文件，然后在文件里依次添加如下代码：
```js
{% if theme.selectionCopyright.enable %}
<style>
#selectionCopyright {
    position: absolute;
    display: none;
    background: rgba(244,67,54,.7);
    color: #fff;
    border-radius: 6px;
    box-shadow: none;
    border: none;
    font-size: 14px;
}
#selectionCopyright a{
    color:#fff;
    border-color: #fff;
}
#selectionCopyright::before {
    content: "";
    width: 0;
    height: 0;
    border-style: solid;
    border-width: 6px 8px 6px 0;
    border-color: transparent rgba(244,67,54,.7) transparent transparent;
    position: absolute;
    left: -8px;
    top:50%;
    transform:translateY(-50%);
}
</style>

<button id="selectionCopyright" disabled="disabled">本文发表于 [<a href="https://blog.enjoytoshare.club/">吴跟强的博客</a>] 分享记得注明来源哟</button>

<script>
window.onload = function() {
    function selectText() {
        if (document.selection) { //IE浏览器下
            return document.selection.createRange().text; //返回选中的文字
        } else { //非IE浏览器下
            return window.getSelection().toString(); //返回选中的文字
        }
    }
    var content = document.getElementsByTagName("body")[0];
    var scTip = document.getElementById('selectionCopyright');

    content.onmouseup = function(ev) { //设定一个onmouseup事件
        var ev = ev || window.event;
        var left = ev.clientX;//获取鼠标相对浏览器可视区域左上角水平距离距离
        var top = ev.clientY;//获取鼠标相对浏览器可视区域左上角垂直距离距离
        var xScroll = Math.max(document.body.scrollLeft, document.documentElement.scrollLeft);//获取文档水平滚动距离
        var yScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);//获取文档垂直滚动距离
        if (selectText().length > 0) {
            setTimeout(function() { //设定一个定时器
                scTip.style.display = 'inline-block';
                scTip.style.left = left + xScroll + 15 + 'px';//鼠标当前x值
                scTip.style.top = top + yScroll - 15 + 'px';//鼠标当前y值
            }, 100);
        } else {
            scTip.style.display = 'none';
        }
    };

    content.onclick = function(ev) {
        var ev = ev || window.event;
        ev.cancelBubble = true;
    };
    document.onclick = function() {
        scTip.style.display = 'none';
    };
};
</script>
{% endif %}
```
## 2.2 修改`_layout.swig`文件
接着在`\themes\next\layout\_layout.swig`文件最后`</body>`标签之前添加如下语句：
```
{% include '_third-party/selectionCopyright.swig' %}
```
## 2.3 修改`_config.yml`文件
在主题配置文件`_config.yml`中加入：
```
# 鼠标选取文字自动提示版权信息
selectionCopyright:
  enable: true
```
最后在`Git Bash`里执行hexo s部署，欧克，完成