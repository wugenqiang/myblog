title: Coding+Github双服务器托管Hexo
urlname: hexo-do-server-hosting
tags:
  - Hexo
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-05 09:36:34
updated: 2019-04-05 09:36:34
---
# 1 写在前面
其实之前是用的wordpress在阿里云上挂着。
觉得Hexo好像更符合现在我的审美，so, do it! 所以我选择了Hexo
# 2 部署优化Hexo
这一步我之前写过，在这里我就不详细赘述了啊

* [Hexo+NexT拥抱舒爽](https://wugenqiang.github.io/article/hexo-do-optimization.html)

# 3 创建Github公开库

* [Hexo博客上传至Github](https://blog.csdn.net/wugenqiang/article/details/88373385)

# 4 创建Coding公开库
创建腾讯云开发者平台（或Coding）公开库，因为目前两家公司战略合作，现在共用了。
[https://dev.tencent.com/](https://dev.tencent.com/)

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405095056.png)

## 4.1 创建项目
项目地址格式是 username.coding.me，格式不对会404哦，项目名称随便，确定就ok
例如我的：
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405095539.png)

## 4.2 开启page服务
创建完记得进入代码浏览，看看是否正确生成，然后进入page服务，然后开启
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405095901.png)
开启成功效果图：
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405100027.png)

# 5 配置服务并将文件部署到Github
## 5.1 修改_config.yml 
修改Hexo根目录下 _config.yml 文件，找到最下面的 deploy，格式类似我这样的

```
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  #repository: https://github.com/wugenqiang/wugenqiang.github.io.git #复制过来
  #branch: master
  repo:
    github: https://github.com/wugenqiang/wugenqiang.github.io.git,master
    coding: https://dev.tencent.com/u/wugenqiang/p/wugenqiang.coding.me.git,master 
```
## 5.2 生成静态文件发布
执行hexo clean && hexo g && hexo s 清除缓存，生成静态文件，本地发布
页面上没问题的话，就可以执行hexo d

会弹出输入github账号密码，和腾讯开发者平台的账号密码。
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405100903.png)
后面通过生成ssh私钥，公钥就不用频繁输入用户名密码

部署成功，按照各自平台的pages服务提示的网址即可访问
在这里我就演示coding的吧，嘿嘿
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405101028.png)

# 6 预览地址
* https://wugenqiang.coding.me/
* https://wugenqiang.github.io/

# 7 设置自定义域名
对于Github来说，可参考：
* [Hexo博客绑定个人域名]( https://wugenqiang.github.io/article/hexo-do-domain.html)

对于Coding来说，来进行下面步骤：
1.进入项目，进入Page服务页
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405103203.png)

点击设置进入

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405103257.png)

2.设置域名指向
设置自定义域名指向wugenqiang.coding.me

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405103808.png)

ok
![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405104001.png)

# 8 加快访问速度
修改解析记录，点击 修改，然后将github解析线路改成海外，然后保存，这样国外的用户访问你的博客的话会跳转到你的github的页面。国内默认coding.me，加快访问速度，欧耶

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405113112.png)

来访问试试吧，嘿嘿嘿 [死命点我吧，亲](https://blog.enjoytoshare.club/)