title: Hexo博客NexT主题开启文章目录和调整样式
urlname: hexo-do-catalog
tags:
  - Hexo
categories:
  - Hexo
author: WuGenQiang
date: 2019-03-16 23:37:41
updated: 2019-03-16 23:37:41
---

## 一、前言

Hexo博客NexT主题中是有目录的，只是在默认情况下没有开启，需要我们来手动开启。

## 二、修改样式文件custom.styl

文章目录样式文件custom.styl文件位于`themes/next/source/css/_custom`

打开后添加内容：

### 1.文章目录默认展开

```
//文章目录默认展开
.post-toc .nav .nav-child { display: block; }
```

### 2.文章目录字体大小调整

```
.post-toc ol {  
  font-size : 13px;     
} 
```

## 三、修改主题配置文件

主题配置文件位于`themes/next/_config.yml`

每行目录超长自动换行

```
toc:
  enable: true  
  wrap: true 
```

## 四、结果图展示

![文章目录.png](https://i.loli.net/2019/03/16/5c8d1b75707ae.png)
