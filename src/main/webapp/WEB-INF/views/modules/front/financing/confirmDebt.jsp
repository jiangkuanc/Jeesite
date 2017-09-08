<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
<table>
    <tr>
        <th>债项名称</th>
        <th>完成时间</th>
        <th>状态</th>
        <th>级别</th>
        <th>评级报告</th>
    </tr>
    <tr>
        <td>${p2pFinancingInformation.finacingName}</td>
        <td>${p2pFinancingInformation.p2pFinancingRatingInfo.publishTime}</td>
        <td>${p2pFinancingInformation.p2pFinancingRatingInfo.creditState}</td>
        <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</td>
        <td>
            <a href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?address=${p2pFinancingInformation.p2pFinancingRatingInfo.creditReport}">下载</a>
        </td>
    </tr>
</table>
<hr/>
<form action="${ctx}/financing/p2pFinancingInformation/confirmDebt" method="post">
    <input type="hidden" name="id" value="${p2pFinancingInformation.id}"/>
    <input type="submit" value="确认债项信息"/>
</form>
</body>
</html>
