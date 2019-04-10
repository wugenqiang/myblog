title: DaoVoice实现在线联系
urlname: hexo-do-daovoice
tags:
  - Hexo
  - DaoVoice
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-06 10:13:16
updated: 2019-04-06 10:13:16
---
{% cq %}
<font size="4" face="verdana">绝佳的用户沟通工具</font>
{% endcq %}

<!--more-->
# 1 注册登录DaoVoice
注册登录地址如下:
http://www.daovoice.io/
官网进行注册,需要邀请码:  b6dbddb6 复制粘贴就可以了~!
或者通过下面链接进入：
http://dashboard.daovoice.io/get-started?invite_code=b6dbddb6

# 2 复制粘贴代码
修改的hexo的文件路劲如下: themes/next/layout/_partials/head.swig 添加下面的代码:

```js
{% if theme.daovoice %}
 <script>(function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/b6dbddb6.js","daovoice")
 daovoice('init', {
  app_id: "你获取的appid"
});
daovoice('update');
 </script>
{% endif %}
```
这段代码从这里找：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406110355.png)

根据你自己的进行修改，参照下图：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406103518.png)

# 3 修改主题的配置文件
在主题的配置文件中添加:

```js
daovoice: true
daovoice_app_id: 我们注册获取的id
```
# 4 重新部署
输入hexo s部署之后发现DaoVoice官网会提示

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406104400.png)

同时网页右下角出现了DaoVoice的图标

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406104538.png)

# 5 测试
输入hello wugenqiang

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406104806.png)

回车键发送，效果如图：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406104855.png)

与此同时，DaoVoice后台也同样收到了信息

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406105018.png)

如果每次都要登录DaoVoice进行回复有些麻烦，所以建议在DaoVocie内绑定微信，然后使用DaoVoice的小程序进行手机上的回复操作就很方便了。

绑定微信的途径：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190406110140.png)

