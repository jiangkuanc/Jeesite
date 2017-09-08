<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


    <title>丝路互金网</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
</head>

<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh" style="border-bottom: 1px solid #d6d7dc;">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active">移动端下载</li>
    </ol>
</div>
<div align="center" style="padding-top: 2%;">
    <%-- <div>
        <img alt="" src="${ctxStatic}/dist/images/IOS.png">
      <div>&nbsp;&nbsp;
          <a href="${ctx}/image/test?mode=1"><h5 style="color: #2F84D7;">苹果安装包下载地址</h5></a>
      </div>
  </div> --%>

    <div style="margin-top: 5%;margin-bottom: 5%;float:left; margin-left:30%;">
        <img alt="" src="${ctxStatic}/dist/images/android.png" style="width:250px;height:250px;">
        <div>&nbsp;&nbsp;
            <a href="${ctx}/image/test?mode=2"><h5 style="color: #2F84D7;">安卓安装包下载地址</h5></a>
        </div>
    </div>

    <div style="margin-top: 5%;margin-bottom: 5%;float:left;margin-left:5%;">
        <img alt="" src="${ctxStatic}/dist/images/IOS.jpg" style="width:250px;height:250px;">
        <div>&nbsp;&nbsp;
            <a href="javascript:void(0);"><h5 style="color: #2F84D7;">IOS安装包下载地址</h5></a>
        </div>
    </div>

</div>

<div style='width:1px;height:500px;'></div>


<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


</body>
</html>
