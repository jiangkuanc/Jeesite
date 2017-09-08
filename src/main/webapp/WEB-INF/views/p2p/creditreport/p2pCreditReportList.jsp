<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
企业信用报告表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>企业信用报告表管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/p2p/creditreport/p2pCreditReport/">企业信用报告表列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pCreditReport" action="${ctx}/p2p/creditreport/p2pCreditReport/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>注册用户ID</th>
        <th>企业名称</th>
        <th>企业类型</th>
        <th>所属行业</th>
        <th>企业介绍</th>
        <th>报告时间</th>
        <th>评级等级</th>
        <th>评级时间</th>
        <th>评级释义</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pCreditReport">
        <tr>
            <td>${status.count}</td>
            <td>${p2pCreditReport.user.id}</td>
            <td>${p2pCreditReport.enterpriseName}</td>
            <td>${p2pCreditReport.enterpriseType}</td>
            <td>${p2pCreditReport.industryCode}</td>
            <td>${p2pCreditReport.enterpriseIntroduce}</td>
            <td>${p2pCreditReport.reportTime}</td>
            <td>${p2pCreditReport.ratingLevel}</td>
            <td>${p2pCreditReport.ratingTime}</td>
            <td>${p2pCreditReport.ratingDefinition}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>