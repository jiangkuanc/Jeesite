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
            <li class="lg-active">身份认证</li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--右侧内容区域-->
    <div class="zh-right pull-left zhaimima ">
        <div class="renzheng ">
            <h3 class="zhai-mima rz-h3">身份认证</h3>
            <div class="mima">
                <p>
                    <img src="${ctxStatic}/dist/images/password.png" alt="">
                    <span>恭喜您，您的实名认证已通过。</span>
                </p>
                <p>
                    <!-- 如果确定显示身份认证信息 -->
                    <a href="${ctx }/user/accountGeneration/showIdCardInfo">
                        <button class="btn mi-sure">确定</button>
                    </a>
                    <c:if test="${bindingBank==null||bindingBank==''}">
                        <a href="${ctx }/user/bankCard/binding">
                            <button class="btn mi-sure qi-btn">绑定银行卡</button>
                        </a>

                    </c:if>
                    <c:if test="${bindingBank!=null}">
                        <span></span>
                    </c:if>
                </p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<!--账户总览内容区域结束-->
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

</body>
</html>
  