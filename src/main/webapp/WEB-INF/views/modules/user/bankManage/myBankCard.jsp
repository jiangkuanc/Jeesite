<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'myBankCard.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>

<!-- 左部分区域,我的银行卡 -->
<div id="myBanlCard">
    <h2>我的银行卡</h2>
    <div id="bankCardInfo">
        <table class="table table-stripped">
            <tr>
                <td>我的银行卡号:</td>
                <td>${bankCardNo}</td>
            </tr>
            <tr>
                <td>状态:</td>
                <td>${status}</td>
                <c:if test="status==1">
                    <button type="button" class="instantBinding">立即绑定</button>
                </c:if>
            </tr>
            <tr>
                <td>开户行银行:</td>
                <td>${openBank}</td>
            </tr>
            <tr>
                <td>开户行所在地:</td>
                <td>${bankAddress}</td>
            </tr>
            <tr>
                <td>账户类型:</td>
                <td>${accountType}</td>
            </tr>
            <tr>
                <td>银行预留手机号:</td>
                <td>${bankPhone}</td>
            </tr>
            <tr>
                <td>银行卡类型:</td>
                <td>${bankType}</td>
            </tr>

        </table>
    </div>
</div>
</body>
</html>
