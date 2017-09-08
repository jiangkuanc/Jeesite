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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/help-center1.css">
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
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
        <li><a href="${ctx }/cms/article/helpCenter">帮助中心</a></li>
        <li class="lg-active">如何注册</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">

<div class="help-guide">
    <div class="contentbox">
        <div class="select_faq">
            <ul>
                <li><b>一、</b>1.点击平台首页左上角"免费注册"进入注册页面</li>
                <li> 2.点击平台首页右上角"我的账户"进入登录页面，点击下方"注册新用户"进入注册页面</li>
                <li><img src="${ctxStatic}/dist/images/login.png" alt="" width="70%"></li>

                <li><b>二、</b>阅读《大公注册用户服务协议》</li>

                <li><b>三、</b>设置登录信息</li>
                <li>如果同意协议，在注册页面相应位置，填写用户名、手机号码、手机验证码、登录密码、再次确认密码及验证码，
                    并勾选“我已阅读并同意《大公注册用户服务协议》”，点击【注册】：
                </li>
                <li><img src="${ctxStatic}/dist/images/zhuce.png" alt="" width="70%"></li>

                <li><b>四、</b>注册成功</li>
            </ul>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>