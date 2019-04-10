title: Hexo的NexT主题打赏功能
urlname: hexo-do-donate
tags:
  - Hexo
categories:
  - Hexo
author: WuGenQiang
date: 2019-04-05 17:37:10
updated: 2019-04-05 17:37:10
---

## 1 准备支付宝和微信二维码

首先要生成支付宝和微信收钱二维码
## 2 在_config.yml中配置图片
这里的`_config.yml`文件是主题中的配置文件，然后把制作好的wechat.jpg、alipay.jpg图片放入themes/next/source/images中

```js
reward:
  enable: true
  #打赏功能
  comment: 原创技术分享，您的支持将鼓励我继续创作
  wechatpay: /images/wechat.jpg
  alipay: /images/alipay.jpg
```
到目前为止，已经实现了需要的功能，如图所示：

![](https://raw.githubusercontent.com/wugenqiang/picGo/master/pictures/20190405180715.png)

但是出现闪动Bug，所以进行下面的修复

## 3 修复闪动Bug

修改next/source/css/_common/components/post/post-reward.styl，注释掉下面部分即可

```python
/*注释此部分
#QR > div:hover p {
  animation: roll 0.1s infinite linear;
  -webkit-animation: roll 0.1s infinite linear;
  -moz-animation: roll 0.1s infinite linear;
}*/
```

好啦，到这里大功告成，完美~~


