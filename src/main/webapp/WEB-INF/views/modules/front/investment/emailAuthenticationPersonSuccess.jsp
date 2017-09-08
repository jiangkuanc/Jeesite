<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrapValidator.css"/>

    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script>


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--邮箱验证成功页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${ctx}">首页</a></li>
        <li class="active"><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></li>
    </ol>
</div>

<!--内容区域-->
<div class="zh-con youxiang-con">

    <div class="yzcheng">
        <div class="youxiang">
            <h3>邮箱认证</h3>
            <p class="cg-text">
                <img src="${ctxStatic }/dist/images/password.png" alt="">
                <span>您的邮箱已验证成功。</span>
            </p>
            <b id="show"> 10秒后自动跳转到首页</b>
            <p class="jin">
                <b>进入</b>
                <button class="btn zh-sure"><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></button>
            </p>

            <div class="clearfix"></div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    var t = 10;//设定跳转的时间
    setInterval("refer()", 1000); //启动1秒定时
    function refer() {
        if (t == 0) {
            location = "${pageContext.request.contextPath}${fns:getFrontPath()}"; //#设定跳转的链接地址
        }
        document.getElementById('show').innerHTML = "" + t + "秒后自动跳转到首页"; // 显示倒计时
        t--; // 计数器递减
        //本文转自：
    }
</script>


</body>
</html>