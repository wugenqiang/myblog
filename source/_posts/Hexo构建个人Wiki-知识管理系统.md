title: Hexo构建个人Wiki知识管理系统
tags:
  - Hexo
  - Wiki
urlname: hexoWikiThemeCreate
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-12 14:29:59
updated: 2019-04-12 14:29:59
---
# 1 写在前面
本文主要是使用Hexo来构建个人Wiki知识管理系统本篇文档参考了许多大佬的文章以及配置文件，在此感谢大佬们。本文参考的文章都会直接给出原文链接或者以注脚的形式标记出处，如有遗漏，欢迎指出。

<!--more-->
# 2 Hexo安装部署
* [Windows下部署安装Hexo](https://blog.csdn.net/wugenqiang/article/details/88372848)

# 3 创建Hexo项目
* 现在假设我要创建一个名为 `mywiki` 的项目，项目目录就放在：e:/work/ 目录下，所以我们在 e:/work/目录下创建一个 mywiki 目录。现在这个项目的全路径是：e:/work/mywiki
* 打开 Git Bash：
* 进入该目录：cd e:/work/mywiki
* 然后执行：hexo init，这个时间也会比较长，也有可能要等几分钟，有显示 WARN 也不用管
* 最后执行：npm install，有显示 WARN 也不用管
* 安装完成之后，e:/work/myblog 目录结构是这样的：

![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190412154024.png)

启动服务器，输入`hexo s`，浏览器输入`http://127.0.0.1:4000/`进行查看

![](https://oscimg.oschina.net/oscnet/7f022528daa86add9fb5d9e5659ff821cfa.jpg)

表明安装部署成功
# 4 安装Wiki主题(hexo-theme-Wikitten)
（1）进入hexo站点文件夹，克隆Wikitten主题到themes/路径下
输入：
```
git clone https://github.com/wugenqiang/hexo-theme-Wikitten.git themes/Wikitten
```
![](https://oscimg.oschina.net/oscnet/14bdf6a9e4e383c7e59c063575ffdcd6f62.jpg)

（2）覆盖站点目录中一些默认页面模板
```
cp -rf themes/Wikitten/_source/* source/
cp -rf themes/Wikitten/_scaffolds/* scaffolds/
```
![](https://oscimg.oschina.net/oscnet/0c70a8eeb44201d8d29d19de159f8e81238.jpg)

（3）重命名主题中的`_config.yml.example`到`_config.yml`，然后可以使用配置文件配置主题
```
cp -f themes/Wikitten/_config.yml.example themes/Wikitten/_config.yml
#编辑配置文件，定制你的配置项
vim themes/Wikitten/_config.yml
```
这里可以使用IDEA打开`_config.yml`进行操作
大部分的配置项都和 [icarus](https://github.com/ppoffice/hexo-theme-icarus) 主题中的配置项一样，你可以首先去阅读一下 [icraus文档](https://github.com/ppoffice/hexo-theme-icarus/wiki)。
（4）需要安装的插件写在主题的 package.json 文件中
这里列出了这些插件的功能作用：
```
hexo-autonofollow	    // 打开非本站链接时自动开启新标签页
hexo-directory-category // 根据文章文件目录自动为文章添加分类
hexo-generator-feed	    // 生成 RSS 源
hexo-generator-json-content	// 生成全站文章 json 内容，用于全文搜索
hexo-generator-sitemap	// 生成全站站点地图 sitemap
```
在站点目录下，通过一下目录安装：
```
npm i -S hexo-autonofollow hexo-directory-category hexo-generator-feed hexo-generator-json-content hexo-generator-sitemap
```
![](https://oscimg.oschina.net/oscnet/7676a02f445481528fcadc604a294a1c047.jpg)

# 5 启用主题
站点修改`_config.yml`文件中的`theme`选项对话为`Wikitten`。

![](https://oscimg.oschina.net/oscnet/d9fa3461c9a199270e99625bf304de23a32.jpg)

# 6 优化配置`_config.yml`
```
# Hexo Configuration
# URL
permalink: wiki/:title/

# Directory
skip_render:
  - README.md
  - '_posts/**/embed_page/**'

# Writing
new_post_name: :title.md # File name of new posts

## Markdown
## https://github.com/hexojs/hexo-renderer-marked
marked:
  gfm: true
  
## Plugins: https://hexo.io/plugins/
### JsonContent
jsonContent:
  meta: false
  pages:
    title: true
    date: true
    path: true
    text: true
  posts:
    title: true
    date: true
    path: true
    text: true
    tags: true
    categories: true
  ignore:
    - 404.html
    
### Creat sitemap
sitemap:
  path: sitemap.xml

### Adds nofollow attribute to all external links in your hexo blog posts automatically.
nofollow:
  enable: true
  exclude:
    - <your site url domain> # eg: wiki.enjoytoshare.club
```
在主题配置文件中`Wikitten/_config.yml`，您可以阅读有关某些选项的更详细的注释。
在开始之前，请先将自己的个人信息更改为自己，包括选项`profile` `social_links` `history_control`等等。

`profile`，`comment`，`Share`并且`miscellaneous`是默认禁用！
（你仍然可以启用它们，但不推荐。）
其他主题推荐设置：
```
# Customize
customize: # modify this information for yourself
    sidebar: left # sidebar position, options: left, right
    category_perExpand: false # enable article categories list per expanding
    default_index_file: index.md # enable this, it will display at site index instead of default index page, or disable that it will display more articles order by time 
    
# Widgets
widgets: # default use category only
    - category
    # - recent_posts
    # - archive
    # - tag
    # - tagcloud
    # - links
    
# History version 
history_control: # make you wiki has history version control in page (view source code, edit online, compare historical changes)
    enable: true
    server_link: https://github.com # recommend use GitHub - https://github.com
    user: <your GitHub name>
    repertory: <your repertory name of this wiki source code>
    branch: <branch name of this wiki site source code>
```
待更新


