<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">

    <title>登录</title>

    <link href="${ctxStatic }/login/css/bootstrap.css" rel="stylesheet">
    <link href="${ctxStatic }/login/css/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${ctxStatic }/login/css/login.css" rel="stylesheet">

    <script src="${ctxStatic }/login/js/jquery-1.11.3.js"></script>
    <script src="${ctxStatic }/login/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/login/js/bootstrapValidator.min.js"></script>
    <script src="${ctxStatic }/login/js/jquery.cookie.js"></script>

    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .alert {
            padding: 0px;
            margin-bottom: 0px;
            border: 1px solid transparent;
            border-radius: 4px;
            font-size: 14px;
            color: red;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#loginForm").validate({
                rules: {
                    validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
                },
                messages: {
                    username: {required: "请填写用户名."}, password: {required: "请填写密码."},
                    validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
                },
                errorLabelContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    error.appendTo($("#loginError").parent());
                }
            });
        });
        setTimeout(function () {
            $("#loginError").html("")
        }, 3000)
        // 如果在框架或在对话框中，则弹出提示并跳转到首页
        if (self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0) {
            alert('未登录或登录超时。请重新登录，谢谢！');
            top.location = "${ctx}";
        }
    </script>
</head>
<body class="bg">

<div class="login-div">

    <div class="clearfix">
        <img src="${ctxStatic }/login/imgs/logo.png" class="logo pull-left">
        <p class="pull-left title">${fns:getConfig('productName')}</p>
    </div>
    <form class="loginForm" id="loginForm" action="${ctx}/login" method="post">

        <div class="form-group">
            <div class="input-group">
                <span class="glyphicon glyphicon-user dak"></span>
                <label for="username">登&nbsp;录&nbsp;名</label>
                <input class="form-control " id="username" type="text" name="username" value="${username}">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="glyphicon glyphicon-lock dak"></span>
                <label for="password">密&emsp;&nbsp;&nbsp;码</label>
                <input class="form-control " id="password" type="password" name="password">
            </div>
        </div>
        <div class=" form-group">
            <c:if test="${isValidateCodeLogin}">
                <div class="input-group input-code">
                    <label for="validateCode">验&nbsp;证&nbsp;码</label>
                    <sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
                </div>
            </c:if>
        </div>
        <div class="">
            <div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}">
                <span id="loginError" class="error">${message}</span>
            </div>
        </div>
        <div id="login-ok">
            <button type="submit" id="login-alert" class="btn btn-primary">登&emsp;录</button>
        </div>
        <div id="load-data">
            <!--            		 <input type="checkbox" id="rememberMe"  name="rememberMe" ${rememberMe ? 'checked' : ''} >记住我(公共场所慎用) -->
        </div>
    </form>


</div>


<div class="text-center foot">
    <%-- <p>Copyright &copy; 2012-${fns:getConfig('copyrightYear')} ${fns:getConfig('productName')} </p> --%>
    <p>丝路互金网运营管理系统 版权所有 Copyright &copy; 2017 | All Rights Reserved 京ICP证160917号 京ICP备16012398号-4</p>
</div>
<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>
