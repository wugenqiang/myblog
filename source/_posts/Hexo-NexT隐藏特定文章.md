title: Hexo+NexT隐藏特定文章
tags:
  - Hexo
urlname: hexoNextHideArticleMethod
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-14 20:32:01
updated: 2019-04-14 21:32:01
---
# 1 写在前言
说实话，实现这个功能的初衷，是因为我在做博文图片展示的时候，发现博文不显示标题，所以在主页显示难免有点突兀，所以萌生出想隐藏它的想法，所以经查阅相关资料，结合本人所需的功能设计，实现了功能，下面我就把详细的解决方法整理出来，方便更多有需要的人……

<!--more-->

# 2 实现
## 2.1 修改首页模板`index.swig`文件
修改 `/themes/next/layout/index.swig` 文件，在把 `<section id="posts" class="posts-expand">` 和 `</section>` 之间的代码：
```js
 {% for post in page.posts %}
      {{ post_template.render(post, true) }}
    {% endfor %}
 ```
替换成下面的代码：
```js
{% for post in page.posts %}
      {% set hide = false %}
      {% if theme.hide.hide_post %}
        {% if post.hide %}
          {% set hide = true %}
        {% endif %}
      {% endif %}
      {% if !hide %}
        {{ post_template.render(post, true) }}
      {% endif %}
    {% endfor %}
```
## 2.2 修改主题配置`_config.yml`文件
打开`next`主题配置文件`/themes/next/_config.yml `, 在里面加入以下代码:
```js
# Hide single post
hide:
  hide_post: true
```
如果 `hide_post` 设置为 `true` , 新建文章时设置字段 `hide: true` 即可隐藏指定文章, 设置样式可参考下面：
```js
title: 测试图片展示
urlname: pictureToDisplayTest_5-3
author: WuGenQiang
type: picture
hide: true
categories:
  - Test
date: 2019-04-14 18:02:40
updated: 2019-04-14 18:02:40
```
即可隐藏啦
# 3 说明
如果设置 `hide` 字段值为 `false` , 这样就不会在首页隐藏，当然不写默认是不会隐藏的~~ 好了，就分享到这边了，应该可以实现了，嘿嘿