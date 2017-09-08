<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist-gyh/css/wdzh.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left">
    <div class="zh-right-div">
        <h3>会员昵称：<span>${user.loginName}</span></h3>
        <h4>
            会员类型：<span style="color: #666666;">免费会员</span>
        </h4>
        <h4>
            支付费用：<span class="date">0.00</span>元
        </h4>
        <h4>
            会员有效时间：<span class="date">2017年12月31日</span>
        </h4>
        <a href="${ctx}/user/p2pUserInformation/becomeMember" class="mfkt_btn">免费开通</a>
    </div>


    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

</body>
</html>