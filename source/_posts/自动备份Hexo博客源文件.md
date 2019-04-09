title: 自动备份Hexo博客源文件
tags:
  - Hexo
urlname: auto_backup_blog_source_files
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-09 18:15:46
updated: 2019-04-09 18:15:46
---
# 一、前言
自从接触了Hexo+NexT之后，发现离不开了，以后有能力的时候一定重新架构一下，使得更加个性化，最大程度的满足我们对于软件的需求，大家都知道，如果写东西在本地的话，最怕的应该就是更换电脑，还要重新搭建博客了，所以备份对于我们来说特别重要！备份博客就是本篇博客文章的主旨了，一定要攻下这座城堡。
我曾经看过Git备份Hexo博客源文件的方式，这种方式虽然能够备份Hexo博客的源文件，但是对于我这种懒人，每次更新博文都需要输入两三行重复的Git命令真是一件麻烦的事情。况且指不定哪天就搞忘push到github上了。你说是不是，所以这篇文章出现了……

<!--more-->
# 二、原理
通过监听Hexo的事件来完成自动执行Git命令进行自动备份，查阅[Hexo文档](https://hexo.io/zh-cn/api/events.html)，找到了Hexo的主要事件，见下表：

事件名|事件发生时间
:---:|:---:
deployBefore|在部署完成前发布
deployAfter|在部署成功后发布
exit|在 Hexo 结束前发布
generateBefore|在静态文件生成前发布
generateAfter|在静态文件生成后发布
new|在文章文件建立后发布

于是我们就可以通过监听Hexo的`deployAfter`事件，待上传完成之后自动运行Git备份命令，从而达到自动备份的目的。
# 三、实现
## 1.将Hexo目录加入Git仓库
本脚本需要提前将Hexo加入Git仓库并与Github或者Gitee远程仓库绑定之后，才能正常工作。如果你不知道该怎样进行操作，可以参考我的另一篇博文：
* [Git命令手动备份Hexo博客源文件](https://blog.enjoytoshare.club/article/manual_backup_blog_source_files.html)

## 2.安装`shelljs`模块
要实现这个自动备份功能，需要依赖NodeJs的一个shelljs模块,该模块重新包装了child_process,调用系统命令更加的方便。（其实就是因为我懒( ╯▽╰)）该模块需要安装后使用。

在命令中键入以下命令，完成shelljs模块的安装：
```
npm install --save shelljs
```
## 3.编写自动备份脚本
`shelljs`模块安装完成后，在`Hexo`根目录的`scripts`文件夹下新建一个js文件，文件名随意取(我的文件名为:`auto_backup.js`)。如果没有`scripts`目录，请新建一个。

然后在脚本中，写入以下内容：

```python
require('shelljs/global');
try {
    hexo.on('deployAfter', function() {//当deploy完成后执行备份
        run();
    });

} catch (e) {
    console.log("产生了一个错误啊<(￣3￣)> !，错误详情为：" + e.toString());
}
function run() {
    if (!which('git')) {
        echo('Sorry, this script requires git');
        exit(1);
    } else {
        echo("======================Auto Backup Begin===========================");
        cd('E:/work/myblog');    //此处修改为Hexo根目录路径
        if (exec('git add --all').code !== 0) {
            echo('Error: Git add failed');
            exit(1);
        }
        if (exec('git commit -am "blog auto backup script\'s commit"').code !== 0) {
            echo('Error: Git commit failed');
            exit(1);
        }
        if (exec('git push origin master').code !== 0) {
            echo('Error: Git push failed');
            exit(1);
        }
        echo("==================Auto Backup Complete============================")
    }
}
```
* 其中，需要修改第16行的E:/work/myblog路径为Hexo的根目录路径。（脚本中的路径为博主的Hexo路径）

* 如果你的Git远程仓库名称不为origin的话，还需要修改第25行执行的push命令，修改成自己的远程仓库名和相应的分支名。

## 4.测试结果
保存脚本并退出，然后执行`hexo d`命令，在常规结果执行出来后，将会得到类似以下结果:

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409215918.png)

这样子就表明成功上传啦，每次更新博文并deploy到服务器上之后，备份就自动启动并完成备份啦~

查看github镜像库，如下图所示，得到了想要的东西：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190409220342.png)

测试成功！

很开心，以后就可以自动备份Hexo博客源文件托管在Github上啦，嘿嘿嘿！