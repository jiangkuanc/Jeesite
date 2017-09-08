<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/help-center.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .selected {
            border-radius: 6px;
            background: #CCC;
            filter: alpha(opacity=70); /*支持 IE 浏览器*/
            -moz-opacity: 0.70; /*支持 FireFox 浏览器*/
            opacity: 0.70; /*支持 Chrome, Opera, Safari 等浏览器*/
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--帮助中心页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
        <li><a href="${ctx }/cms/article/helpCenter">帮助中心</a></li>
        <li class="lg-active">常见问题</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">
<div class="help-guide">
    <div class="contentbox">
        <h3>常见问题>账户管理</h3>
        <br><br>
        <br><br>
        <div class="select_faq">
            <ul>
                <li><a href="javascript:void(0)" onclick="FAQ1();">问题1：注册时手机收不到验证码怎么办？</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ2();">问题2：注册时邮箱收不到邮件怎么办？</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ3();">问题3：注册时收到邮件无法激活？</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ4();">问题4：注册时提示“您输入的手机号码/邮箱名已经被注册”？</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ5();">问题5：如何修改注册的手机号？</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ6();">问题6：如何修改注册的邮箱？</a></li>
            </ul>
            <br><br>
            <div>
                <div id="faq1" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>1、注册时手机收不到验证码怎么办？</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>1、用户自己手机号码被运营商屏蔽</b></p>
                    <div class="answer-content">
                        <p>曾将此类通知短信向运营商投诉为垃圾短信，使得短信被运营商屏蔽。</p>
                        <p><b>解决方法：</b>需要联系运营商解决此问题</p>
                        <p><b>2、手机短信安全软件等黑名单设置</b></p>
                        <p>曾经在手机短信中设置了比较严苛拦截的拦截规则。</p>
                        <p><b>解决方法：</b> 查看短信黑名单设置，菜单->骚扰拦截->设置，分别查看拦截模式与黑白明单是否有不允许短信到达的号码。
                            若以上都不是，请重复提交手机号并选择接收验证码步骤，再未收到验证码，可联系客服解决。</p>
                    </div>
                </div>
                <div id="faq2" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>2、注册时邮箱收不到邮件怎么办？</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>1、检查邮箱地址是否填写正确；</b></p>
                    <div class="answer-content">
                        <p><b>2、确认邮件是否被邮箱系统自动拦截，被误认为“垃圾邮件”；</b></p>
                        <p><b>3、若垃圾邮件中也未收到且已超过10分钟，可重新在注册页面填写一次，再次查收；</b></p>
                        <p>若以上都不是，可联系客服解决。</p>
                    </div>
                </div>
                <div id="faq3" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>3、注册时收到邮件无法激活？</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>可能您正在使用foxmail等邮件收发工具</b></p>
                    <div class="answer-content">
                        <p>因为有些工具屏蔽了点击激活的按钮，所以请您使用IE浏览器直接进入您的邮箱打开邮件，重新激活就可以了。
                            也可以使用复制链接去激活账户，请您检查链接是否完全并正确粘贴。</p>
                        <br>
                    </div>
                </div>
                <div id="faq4" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>4、注册时提示“您输入的手机号码/邮箱名已经被注册”？</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>一个手机号码/邮箱名只能注册一个账户</b></p>
                    <div class="answer-content">
                        <p>出现该提示说明您的手机号码/邮箱名之前已经注册过</p>
                        <p><b>解决方法：</b>该手机号码/邮箱名已经无法再次注册，您可以通过找回密码再继续使用该手机号码/邮箱名注册的账户或者换一个新的手机号码/邮箱名重新注册</p>
                    </div>
                </div>
                <div id="faq5" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>5、如何修改注册的手机号？</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>1、进入【我的账号-账号管理】，在手机号码后面选择“修改”进行操作。</b></p>
                    <div class="answer-content">
                        <p><b>2、若手机停用或收不到验证码，请联系客服修改。</b></p>
                        <p>
                            可发送新/旧手机号、邮箱和本人手持身份证正反面照片到客服邮箱：XXX，并在邮件主题上注明“申请修改手机号码”。收到邮件后我们会在2小时内帮您解绑手机号，解绑后会收到邮件提醒和站内消息。再次登录账户后，重新绑定新的手机号即可。</p>
                    </div>
                </div>
                <div id="faq6" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>6、如何修改注册的邮箱？</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>1、进入【个人中心-账号管理】，在邮箱后面选择“修改”进行操作。</b></p>
                    <div class="answer-content">
                        <p><b>2、可以使用新邮箱发送邮件至XXX，邮件主题上注明“申请修改邮箱”。</b></p>
                        <p>
                            邮件中写明新旧邮箱地址、手机号，并附本人手持实名认证身份证正反面照片。到邮件后我们会在2小时内帮您解绑邮箱，解绑后新邮箱会收到邮件提醒和站内消息。可通过新邮件提醒链接重新绑定新邮箱或再次登录账户后，重新绑定即可。</p>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    ///////////////初始状态下，全部隐藏//////////////////////
    $(function () {
        $("#faq1").hide();
        $("#faq2").hide();
        $("#faq3").hide();
        $("#faq4").hide();
        $("#faq5").hide();
        $("#faq6").hide();
    });
    $(function () {
        $(".select_faq li a").click(function () {
            $(this).addClass("selected").parent().siblings().find("a").removeClass("selected");
            var index = $(".select_faq li a").index(this);
            $('.answer').eq(index).show().siblings().hide();
        })
    });

</script>


</body>
</html>