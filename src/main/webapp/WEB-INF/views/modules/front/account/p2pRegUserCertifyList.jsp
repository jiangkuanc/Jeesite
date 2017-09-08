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

<!--账户总览页面-->
<!-- 引入账户菜单文件 -->
<%-- <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp"%> --%>
<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${ctx}">首页</a></li>
        <li class="active"><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></li>
    </ol>
</div>
<!--左侧内容区域结束-->
<div class="zh-con">
    <div class="zh-left pull-left">
        <p class="zh-p" style="background: #eaeaea;"><a href="${ctx}/user/p2pUserInformation/accountPermission">账户总览</a>
        </p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">我的投资</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentGeneral">投资总览</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentIncome">投资收益</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentRecord">投资记录</a></li>
                </ul>
            </li>
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">资金记录</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=expenseMsg">费用记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=chargeRecord">充值记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=withdrawRecord">提现记录</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bindingPhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=p2pRegUserCertify">身份认证</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bankMsg">管理银行卡</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=riskEvaluation">风险测评</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=passwordModify">密码管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accountSet">举报管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">消息中心<span
                            class="badge" style="margin-left:2px;background-color:red;color:white;">4</span></a></li>
                </ul>
            </li>

            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">交易助手</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=riskEvaluation">计算器</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="zhright_top">
            <!--左侧-->
            <div class="zh-top_left pull-left">
                <div class="pull-left">
                    <!-- 	                    <c:if test="${p2pUserPic.userpic==null||''.equals(p2pUserPic.userpic) }"> -->
                    <!-- 	                    	<p> -->
                    <!-- 	                            <img style="width:100px" src="${ctxStatic }/dist/images/user.png" alt=""> -->
                    <!-- 	                        </p> -->
                    <!-- 	                    </c:if> -->
                    <!-- 	                    <c:if test="${p2pUserPic.userpic!=null && !''.equals(p2pUserPic.userpic)}"> -->
                    <!-- 	                        <p> -->
                    <!-- 								<img style="width:100px" src="${pageContext.request.contextPath}/${p2pUserPic.userpic }" alt=""> -->
                    <!-- 	                        </p> -->
                    <!-- 	                    </c:if> -->
                    <p>
                        <img src="${pageContext.request.contextPath}/${p2pUserPic.userpic}" alt=""
                             style="width:100px;height:100px;">
                    </p>
                    <p class="zh-user">
                        <a href="${ctx }/financing/myAccount/personAddTouXiang">设置头像</a>
                    </p>
                </div>
                <div class="pull-left top-text">

                </div>
            </div>
            <!--右侧-->
            <div class="zh-top_right pull-left">
                <p class="ljje">累计投资金额：<span>${allInvestmentAmount} 元</span>
                </p>
            </div>
            <div class="clearfix"></div>
        </div>

        <!-- 引入footer文件 -->
        <%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

        <script type="text/javascript">
        </script>
</body>
</html>