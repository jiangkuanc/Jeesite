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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/help-center1.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .selected {
            border-radius: 6px;
            background: #CCC;
            filter: alpha(opacity=70); /*支持 IE 浏览器*/
            -moz-opacity: 0.70; /*支持 FireFox 浏览器*/
            opacity: 0.70; /*支持 Chrome, Opera, Safari 等浏览器*/
        }
    </style>
</head>

<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx }/cms/article/helpCenter">帮助中心</a></li>
        <li class="lg-active">投资流程</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">

<div class="help-guide">
    <div class="contentbox">
        <div class="select_faq">
            <ul>
                <li>1、用户登录平台，点击首页横幅上的我要投资按钮、导航菜单-投融资服务下的我要投资，进入投资专区</li>
                <li><img src="${ctxStatic}/dist/images/investment3.png" alt="" width="100%"></li>
                <li>2、首页页面中投资专区，点击了解更多，债项名称，立即投资按钮，快速投资下面的确定按钮可进入投资详情页面</li>
                <li><img src="${ctxStatic}/dist/images/investment1.png" alt="" width="70%"></li>
                <li>3、进入投资专区页面，可选择募集中状态的债项，点击后面的立即投资按钮，可查看债项详情</li>
                <li><img src="${ctxStatic}/dist/images/investment5.png" alt="" width="70%"></li>
                <li>4、债项详情页面</li>
                <li><img src="${ctxStatic}/dist/images/investment4.png" alt="" width="70%"></li>
                <%-- <li>5、投资用户查看投资协议，并同意投资协议内容</li>
                <li><img src="${ctxStatic}/dist/images/investment6.png" alt="" width="70%"></li> --%>
                <li>5、投资成功，投资用户成功选中债项，等待平台通知给融资企业放款</li>
                <li><img src="${ctxStatic}/dist/images/investment7.png" alt="" width="70%"></li>
            </ul>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>