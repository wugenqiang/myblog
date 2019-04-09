title: Hexo之修改内容区域的宽度
urlname: hexo-do-edit-screen
tags:
  - Hexo
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-05 23:20:27
updated: 2019-04-05 23:20:27
---

# 1 修改内容区域的宽度
编辑主题的 source/css/_variables/custom.styl  文件，新增变量：

```js
// 修改成你期望的宽度
$content-desktop = 700px
// 当视窗超过 1600px 后的宽度
$content-desktop-large = 1050px
```