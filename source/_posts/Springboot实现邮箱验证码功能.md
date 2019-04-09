title: Springboot实现小程序端发送邮箱验证码功能
urlname: mailbox-verification-on-small-program
tags:
  - 邮箱验证
  - Springboot
  - 小程序
categories:
  - 小程序
  - Springboot
author: WuGenQiang
date: 2019-03-16 11:38:24
updated: 2019-03-16 11:38:24
---

# Springboot实现小程序端的邮箱验证
## 一、配置项

1. 配置pom文件，引入发送邮件的依赖

在pom文件中添加：

```
<!--邮件发送核心包-->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-mail</artifactId>
</dependency>

```

2. 修改配置文件application.yml，这里以QQ邮箱为例

我这里使用的是yml方式，当然也可以采用properties方式来写

```
#邮件发送配置
spring:
  mail:
    default-encoding: UTF-8
    host: smtp.qq.com
    username: 你的邮箱
    password: 邮箱授权码
    properties:
      mail:
        smtp:
          auth: true
          starttls:
            enable: true
            required: true
```

*邮箱授权码可以按以下方法获取:*

*打开QQ邮箱网页→设置→账户→POP3/IMAP/SMTP/Exchange/CardDAV/CalDAV服务→开启POP3/SMTP服务，然后就能看到授权码了*

![邮箱验证01.png](https://i.loli.net/2019/03/16/5c8c8a7252fef.png)


## 二、编写mailService和mailServiceImpl

即邮件服务层和邮件服务接口实现层

${spring.mail.username}是在yml中配置的属性，这里有一个方法，第一个是发送普通邮件，第二个是发送带有附件的邮件

1. 邮件服务层（IMailService）

```
public interface IMailService {

    //发送普通邮件
    void sendSimpleMail(String to,String title,String content);

    //发送带有附件的邮件
    void sendAttachmentsMail(String to, String title, String content, List<File> fileList);
}
```
2. 邮件服务接口实现层（MailServiceImpl）

```
@Service
public class MailServiceImpl implements IMailService {

    @Value("${spring.mail.username}")
    private String from;

    @Resource
    private JavaMailSender mailSender;

    Logger logger = LoggerFactory.getLogger(this.getClass());

    //发送普通邮件
    @Override
    public void sendSimpleMail(String to, String title, String content) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(title);
        message.setText(content);
        mailSender.send(message);
        logger.info("邮件发送成功");

    }

    //发送带有附件的邮件
    @Override
    public void sendAttachmentsMail(String to, String title, String content, List<File> fileList) {

        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(title);
            helper.setText(content);
            String fileName = null;
            for (File file:fileList) {
                fileName = MimeUtility.encodeText(file.getName(), "GB2312", "B");
                helper.addAttachment(fileName, file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        mailSender.send(message);
        logger.info("邮件发送成功");

    }
}
```

## 三、编写controller

即邮件发送控制层

```
//获取邮箱验证的验证码
    @RequestMapping("/getCheckCode")
    public JsonResult getCheckCode(HttpServletRequest request) {
        //获取微信小程序get的参数值并打印
        String userEmail = request.getParameter("userEmail");
        user = userService.queryUserByUserEmail(userEmail);
        if (null == user) {
            return new JsonResult(JsonResponseStatus.EMPTY.getCode(), JsonResponseStatus.EMPTY.getMsg());
        }else{
            String checkCode = String.valueOf(new Random().nextInt(899999) + 100000);
            String message = "您的注册验证码为："+checkCode;
            try {
                mailService.sendSimpleMail(userEmail, "注册验证码", message);
            }catch (Exception e){
                return new JsonResult(JsonResponseStatus.EMPTY.getCode(), JsonResponseStatus.EMPTY.getMsg());
            }
            return new JsonResult(JsonResponseStatus.SUCCESS.getCode(), JsonResponseStatus.SUCCESS.getMsg(),checkCode);
        }
    }
```


*附Web网页上可以用的控制层代码：*

```
@Controller
public class MailController {
    
    @Resource
    private IMailService mailService;

    @RequestMapping("getCheckCode")
    @ResponseBody
    public String getCheckCode(String email){
        String checkCode = String.valueOf(new Random().nextInt(899999) + 100000);
        String message = "您的注册验证码为："+checkCode;
        try {
            mailService.sendSimpleMail(email, "注册验证码", message);
        }catch (Exception e){
            return "";
        }
        return checkCode;
    }
}
```
## 四、编写小程序邮箱验证页面

```
<!--pages/getCheckCode/getCheckCode.wxml-->
<form bindsubmit="getCheckCode">
  <view class="form-list">
    <view class="form-item">
      <view class="form-item-hd">邮箱</view>
      <view class="form-item-bd">
        <input type="email" name="userEmail" value="{{userEmail}}" placeholder="请输入邮箱" maxlength="25" />
      </view>
    </view>
  </view>
  <!--按钮-->
  <button formType="submit" class="edit-btn">获取验证码</button>
</form>

<form bindsubmit="toPasswordReset">
  <view class="form-list">
    <view class="form-item">
      <view class="form-item-hd">验证码</view>
      <view class="form-item-bd">
        <input type="text" name="checkCode" value="{{checkCode}}" placeholder="请输入验证码" maxlength="20" />
      </view>
    </view>
  </view>
  <button formType="submit" class="edit-btn">进行验证</button>
</form>
```

## 五、测试

![邮箱验证03.png](https://i.loli.net/2019/03/16/5c8cc99015151.png)

![邮箱验证04.png](https://i.loli.net/2019/03/16/5c8cc9a7008c2.png)

好了，就分享到这边了啊，有问题可以在下面留言...