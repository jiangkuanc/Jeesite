<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的账户</title>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/index.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/gnzddq.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/dist/css/wodezhanghu.css"/>
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <!--<script type="text/javascript" src="${ctxStatic}/dist/js/ydyl.js"></script>-->
</head>
<body style="">
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="container" style="height: 540px; width: 76.38%;margin: 20px auto;">
    <div class="row">
        <div class="col-xs-12">
            <div class="wdzh_center">
                <img src="${ctxStatic}/dist/images/yuangou.png" style="vertical-align: top" alt="">
                <span>
	                    您的申请及评级资料已提交，我们会在1个工作日内审核完成，请耐心等待！此外请您务必确保所有材料的原件都已寄给我们，以免影响您的款项使用时间
	                </span>
                <ul>
                    <li>
                        <span>进入</span>
                        <a href="${ctx}/user/p2pUserInformation/accountPermission">
                            <button type="button">我的账户</button>
                        </a>
                    </li>
                    <li>
                        <span>查看</span>
                        <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp">
                            <button type="button">我的申请状态</button>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

</body>
</html>
