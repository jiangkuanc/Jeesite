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

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
        <li><a href="${ctx }/cms/article/helpCenter">帮助中心</a></li>
        <li class="lg-active">自助服务</li>
    </ol>
</div>

<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">
<div class="help-guide">
    <h2>自助服务</h2>
    <div class="help-guide-1 pull-left help-guide-div">
        <a href="javascript:;"><img src="${ctxStatic}/dist/images/service.jpg" alt=""> </a>
    </div>
    <div class="help-guide-2 pull-left help-guide-div">
        <a href="${ctx}/sys/user/preResetPwd"><img src="${ctxStatic}/dist/images/service.jpg" alt=""></a>
    </div>
    <div class="help-guide-3 pull-right help-guide-div">
        <a onclick="updatepwd();" href="javascript:;"><img src="${ctxStatic}/dist/images/xiugai.jpg" alt=""></a>
    </div>
    <div class="clearfix"></div>
    <span class="help-guide-1-span pull-left help-span">找回用户名</span>
    <span class="help-guide-2-span pull-left help-span">找回登录密码</span>
    <span class="help-guide-3-span pull-right help-span">修改登录密码</span>
    <div class="clearfix"></div>
</div>

<div class="help-guide">
    <div class="help-guide-1 pull-left help-guide-div">
        <a onclick="updatephone();" href="javascript:;"><img src="${ctxStatic}/dist/images/xiugai.jpg" alt=""> </a>
    </div>
    <div class="help-guide-2 pull-left help-guide-div">
        <a onclick="updatebank();" href="javascript:;"><img src="${ctxStatic}/dist/images/xiugai.jpg" alt=""></a>
    </div>
    <div class="help-guide-3 pull-right help-guide-div">
        <a href="javascript:;"><img src="${ctxStatic}/dist/images/service.jpg" alt=""></a>
    </div>
    <div class="clearfix"></div>
    <span class="help-guide-1-span pull-left help-span">修改手机号码</span>
    <span class="help-guide-2-span pull-left help-span">更换银行卡</span>
    <span class="help-guide-3-span pull-right help-span">找回交易密码</span>
    <div class="clearfix"></div>
</div>

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    var userId = '${user.id}';
    var roleId = '${user.roleList[0].id}';
    function updatepwd() {
        if (roleId == '101') {
            window.location.href = '${ctx}/user/Institution/ctrlMenu?mode=pwdManager';
        }
        if (roleId == '102') {
            window.location.href = '${ctx}/user/p2pUserInformation/accountPermission?mode=pwdManager';
        }
        if (roleId == '104') {
            window.location.href = '${ctx}/user/personInvestment/ctrlMenuPerson?mode=pwdManager';
        }
        if (roleId == '105') {
            window.location.href = '${ctx}/user/AssetValuation/ctrlMenu?mode=pwdManager';
        }
        if (roleId == '106') {
            window.location.href = '${ctx}/user/Guarantee/ctrlMenu?mode=pwdManager';
        }
        if (userId == '') {
            window.location.href = '${ctx}/sys/user/preUserLogin';
        }
    }
    function updatephone() {
        if (roleId == '101') {
            window.location.href = '${ctx}/user/Institution/ctrlMenu?mode=updatePhone';
        }
        if (roleId == '102') {
            window.location.href = '${ctx}/user/p2pUserInformation/accountPermission?mode=updatePhone';
        }
        if (roleId == '104') {
            window.location.href = '${ctx}/msg/msgSmsRecord/showSmsPage?mode=bindPhone';
        }
        if (userId == '') {
            window.location.href = '${ctx}/sys/user/preUserLogin';
        }
    }
    function updatebank() {
        if (roleId == '104') {
            window.location.href = '${ctx}/user/bankManage/bankInfo?mode=bankCard';
        }
        if (userId == '') {
            window.location.href = '${ctx}/sys/user/preUserLogin';
        }
    }
</script>
</body>
</html>
 