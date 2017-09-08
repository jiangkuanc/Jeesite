<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/jcalculator.js"></script>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li>我的位置：</li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active">银行卡管理</li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="zh-right-div zh-right-div-wdyhk">
            <h3>银行卡管理</h3>
            <h4>
                我的银行卡号：<c:out value="${p2pAccount.bankAccount}" default="无"></c:out>
            </h4>
            <h4>
                状态：<c:if
                    test="${p2pAccount==null||p2pAccount==''||p2pAccount.certificateStatus==null||p2pAccount.certificateStatus==''}"><span>未绑定</span>
                <a href="${ctx}/user/bankCard/binding">
                    <button class="btn btn-primary" style="background: #f2434a;">立即绑定</button>
                </a>
            </c:if>
                <c:if test="${p2pAccount!=null&&p2pAccount!=''&&p2pAccount.certificateStatus!=null&&p2pAccount.certificateStatus==1}"><span>已绑定</span></c:if>
            </h4>
            <h4>
                开户行银行：<span class="date"><c:out value="${p2pAccount.bankAccount}" default="无"></c:out></span>
            </h4>
            <h4>
                开户行所在地：<span class="date"><c:out value="${p2pAccount.openAccountName }" default="无"></c:out></span>
            </h4>
            <h4>
                账户类型：<span class="date"><c:out value="${p2pAccount.openAccountName }" default="无"></c:out></span>
            </h4>
            <h4>
                银行预留手机号：<span class="date"><c:out value="${p2pAccount.openAccountName }" default="无"></c:out></span>
            </h4>
            <h4>
                银行卡类型：<span class="date"><c:out value="${p2pAccount.openAccountName }" default="无"></c:out></span>
            </h4>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

</div>

</body>
</html>