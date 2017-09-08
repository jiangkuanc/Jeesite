<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/jcalculator.js"></script>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
    <style type="text/css">
        .jCalculator {
            position: absolute;
            top: 25px;
            right: 249px;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<c:if test="${user.roleList[0].id == '104'}">
    <!--账户总览页面-->
    <div class="zh">
        <ol class="breadcrumb">
            <li>我的位置：</li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">绑定手机号</a></li>
        </ol>
    </div>
</c:if>
<!-- 引入header文件 -->
<div class="zh-con">
    <c:if test="${user.roleList[0].id=='101'}">
        <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
    </c:if>
    <c:if test="${user.roleList[0].id=='104'}">
        <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>
    <div class="right">
        <c:if test="${codeValid==1}">
            <!--邮箱验证成功页面-->
            <!--内容区域-->
            <div class="zh-con youxiang-con">
                <div class="yzcheng">
                    <div class="youxiang">
                        <h3>手机认证</h3>
                        <p class="cg-text">
                            <img src="http://localhost:8080/dagongp2p/static/dist/images/password.png" alt="">
                            <span>您的手机已验证成功。</span>
                        </p>
                        <p class="jin">
                            <b>进入</b>
                            <c:if test="${user.roleList[0].id==101|| user.roleList[0].id==102}">
                                <button class="btn zh-sure"><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a>
                                </button>
                            </c:if>
                            <c:if test="${user.roleList[0].id==104 }">
                                <button class="btn zh-sure"><a
                                        href="${ctx}/user/myAccountinformation/accountDefaultPage">我的账户</a></button>
                            </c:if>
                        </p>

                        <div class="clearfix"></div>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>
            <!--账户总览内容区域结束-->
        </c:if>
    </div>
</div>

</body>
</html>