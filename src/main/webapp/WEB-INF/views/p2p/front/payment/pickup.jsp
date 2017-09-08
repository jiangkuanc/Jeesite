<%@page import="com.thinkgem.jeesite.common.config.Payment" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Content-Language" content="zh-CN"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <title>网上支付平台-商户接口范例-支付结果</title>
    <link href="css.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<center><h2>接收页面返回的支付结果，显示客户订单支付结果</h2>
    <hr/>
    <div style="padding-left:40px;">


        <h2>支付结果：${mypay} </h2>
        <!-- 	 		<h2>验签结果：${verifyResult} </h2> -->
        <!-- 			<h2>支付结果：${paySuccess}</h2> -->
        <!-- 			<h2>支付结果：${paymentResult}</h2> -->
        <!-- 			<h2>支付结果：${text}</h2> -->
    </div>
</body>
</html>



