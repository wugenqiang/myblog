title: Hexo+NexT修改友链样式
tags:
  - Hexo
urlname: hexoEditLinkStyle
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-14 13:12:26
updated: 2019-04-14 13:12:26
---

# 1 写在前言
友链的设置是参考大佬 [三水非冰](https://www.sanshuifeibing.cn/) 的博客来完成的，在此表示感谢，样式效果如下：

<!--more-->

![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190414131508.png)

# 2 实现
## 2.1 新建`links.swig`文件

在`/themes/next/layout/`路径下，新建一个文件`links.swig`，其内容为以下代码：
```js
{% block content %}
  {######################}
  {### LINKS BLOCK ###}
  {######################}
  
    <div id="links">
        <style>
            .links-content{
                margin-top:1rem;
            }
            
            .link-navigation::after {
                content: " ";
                display: block;
                clear: both;
            }
            
            .card {
                width: 300px;
                font-size: 1rem;
                padding: 10px 20px;
                border-radius: 4px;
                transition-duration: 0.15s;
                margin-bottom: 1rem;
                display:flex;
            }
            .card:nth-child(odd) {
                float: left;
            }
            .card:nth-child(even) {
                float: right;
            }
            .card:hover {
                transform: scale(1.1);
                box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12), 0 0 6px 0 rgba(0, 0, 0, 0.04);
            }
            .card a {
                border:none; 
            }
            .card .ava {
                width: 3rem!important;
                height: 3rem!important;
                margin:0!important;
                margin-right: 1em!important;
                border-radius:4px;
                
            }
            .card .card-header {
                font-style: italic;
                overflow: hidden;
                width: 236px;
            }
            .card .card-header a {
                font-style: normal;
                color: #2bbc8a;
                font-weight: bold;
                text-decoration: none;
            }
            .card .card-header a:hover {
                color: #d480aa;
                text-decoration: none;
            }
            .card .card-header .info {
                font-style:normal;
                color:#a3a3a3;
                font-size:14px;
                min-width: 0;
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
            }
        </style>
        <div class="links-content">
            <div class="link-navigation">

                {% for link in theme.mylinks %}
                
                    <div class="card">
                        <img class="ava" src="{{ link.avatar }}"/>
                        <div class="card-header">
                        <div><a href="{{ link.site }}" target="_blank">@ {{ link.nickname }}</a></div>
                        <div class="info">{{ link.info }}</div>
                        </div>
                    </div>
                
                {% endfor %}

            </div>
            {{ page.content }}
            </div>
        </div>
  
  {##########################}
  {### END LINKS BLOCK ###}
  {##########################}
{% endblock %}
```
## 2.2 修改`page.swig`文件
修改`/themes/next/layout/page.swig`:

在
```js
#}{{ __('title.schedule') + page_title_suffix }}{#
```
下方添加两行代码：
```js
#}{% elif page.type === 'links' and not page.title %}{#
    #}{{ __('title.links') + page_title_suffix }}{#
```
在
```js
{% include 'schedule.swig' %}
```
下方添加两行代码：
```js
{% elif page.type === 'links' %}
  {% include 'links.swig' %}
```
## 2.3 修改`_config.yml`文件
在主题配置文件`/themes/_config.yml`末尾处添加友链：
```js
mylinks:
  - nickname: 青果先生  #友链名称
    avatar: https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/003.jpg  #友链头像
    site: https://blog.enjoytoshare.club  #友链地址
    info: Sometimes your whole life boils down to one insame move.  #友链说明
```
## 2.4 创建`links`页面
创建一个`links`页面，页面将自动加载已添加的友链。
确保links页面index.md文件中有
```js
title: 友链
author: WuGenQiang
type: links
---
此处放置你想写的东西，此处默认显示在链接下方
比如放置申请友链的要求等等
```
原因：
* 添加`title`，是为了标题中出现`title`，
* 添加`type`，是为了显示友链的对象，不添加不显示

# 3 结束语
点击效果最终显示这样:

![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190414133048.png)

点击这里查看实际效果：[戳我戳我好疼啊](https://blog.enjoytoshare.club/links/)

肯定到这里有人会问了，这是链接一个人的效果，如果链接两个人以及以上呢？当然也有办法：
在2.3步骤中如图设置即可，需要链接几个人就添加几条记录：

![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190414135327.png)

效果显示：

![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190414135751.png)