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
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>

    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<c:if test="${user.roleList[0].id == 101}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == 102}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == 104}">

</c:if>
<div class="zh-right pull-left bdsjh ">
    <h3>绑定手机号</h3>
    <p class="wdsjh">
        <span>我的手机号：</span>
        <input type="text" value="${user.phone }" readonly>
        <a href="${ctx }/financing/myAccount/replacePhone" class=" ghsjh">
            <button class="btn genghuan">更换手机号码</button>
        </a>
    </p>

    <p class="zt">
        <span>状态：</span>
        <c:if test="${user.phone == null || ''.equals(user.phone)}">
            <b>未绑定</b>
        </c:if>
        <c:if test="${user.phone != null || !''.equals(user.phone)}">
            <b>已绑定</b>
        </c:if>
    </p>
    <sys:message content="message"/>
    <div class="clearfix"></div>


</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">

</script>


</body>
</html>