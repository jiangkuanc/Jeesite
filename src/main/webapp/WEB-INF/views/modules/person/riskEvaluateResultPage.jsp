<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li>我的位置：</li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="zh-right pull-left ">
        恭喜你已完成风险测评<a href="${ctx}/user/bankCard/beMember">成为会员</a>
    </div>
    <div class="clearfix"></div>

</div>
<div class="clearfix"></div>

<!--账户总览内容区域结束-->
<!-- 引入footer文件 -->
<!--账户总览内容区域结束-->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>
