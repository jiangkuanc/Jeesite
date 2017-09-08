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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhzl.css">

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

        .zh-left ul.zhzl {
            height: 680px;
        }

        .zh-left {
            border-left: 1px solid #DFDEDD;
        }

        .zh-con {
            border-left: 0;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<c:if test="${user.roleList[0].id == '101'}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '102'}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '104'}">
<div class="zh">
    <ol class="breadcrumb">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active"><b>邮箱认证</b></li>
    </ol>
</div>
<div class="zh-con" style="height:900px;">
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>

    <div class="right">
        <!--邮箱验证成功页面-->
        <!--内容区域-->
        <div class="zh-con youxiang-con">
            <div class="yzcheng">
                <div class="youxiang">
                    <h3>邮箱认证</h3>
                    <p class="cg-text">
                        <img src="${ctxStatic}/dist/images/password.png" alt="">
                        <span>您的邮箱已验证成功。</span>
                    </p>
                    <p class="jin">
                        <b>进入</b>
                        <c:if test="${user.roleList[0].id==101 }">
                            <a href="${ctx}/user/Institution/ctrlMenu?mode=accountSet">
                                <button class="btn zh-sure">账户设置</button>
                            </a>
                        </c:if>
                        <c:if test="${user.roleList[0].id==102}">
                            <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accSettings">
                                <button class="btn zh-sure">账户设置</button>
                            </a>
                        </c:if>
                        <c:if test="${user.roleList[0].id==104 }">
                            <a href="${ctx}/user/accountGeneration/showAllInformation">
                                <button class="btn zh-sure">账户总览</button>
                            </a>
                        </c:if>
                    </p>
                </div>
            </div>
        </div>
        <!--账户总览内容区域结束-->

    </div>
    <div style='height:331px;width:1px;'></div>
</div>

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>