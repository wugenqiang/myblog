title: Hexo NexT 加入背景图片
urlname: hexo-do-bg-picture
tags:
  - Hexo
categories:
  - Hexo
author: WuGenQiang
date: 2019-03-31 13:21:57
updated: 2019-03-31 13:21:57
---
## 添加如下代码：
给 hexo next 加上背景图片，只需要在 themes\next\source\css \ _custom\custom.styl 文件中

添加几行代码：

```css
@media screen and (min-width:1200px) {
    body {
    background-image:url(/images/background.jpg);
    background-repeat: no-repeat;
    background-attachment:fixed;
    background-position:50% 50%; 
    }
    #footer a {
        color:#eee;
    }
}
```
ok