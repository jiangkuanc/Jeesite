<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资信息管理</title>
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
    <li class="active"><a href="${ctx}/investment/p2pInvestmentInformation/">投资信息列表</a></li>
    <shiro:hasPermission name="investment:p2pInvestmentInformation:edit">
        <li><a href="${ctx}/investment/p2pInvestmentInformation/form">投资信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pInvestmentInformation"
           action="${ctx}/investment/p2pInvestmentInformation/" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>投资机构：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>订单号：</label>
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>订单状态：</label>
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>订单号</th>
        <th>投资机构</th>
        <th>投资方类型</th>
        <th>合同签订时间</th>
        <!-- 				<th>三方协议</th> -->
        <th>放款时间</th>
        <th>投资金额（元）</th>
        <th>投资债项名称</th>
        <th>预计收益</th>
        <th>订单状态</th>
        <shiro:hasPermission name="investment:p2pInvestmentInformation:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">
        <tr>
            <!--序号-->
            <td>
                    ${status.count }
            </td>
            <!--订单号-->
            <a href="${ctx}/investment/p2pInvestmentInformation/form?id=${p2pInvestmentInformation.id}">
                    ${p2pInvestmentInformation.id}
            </a>
            <!--投资方-->
            <td>
                    ${p2pInvestmentInformation.financingInformationId}
            </td>


            <td>
                    ${p2pInvestmentInformation.user.name}
            </td>
            <td>
                    ${p2pInvestmentInformation.investmentAmount}
            </td>
            <!-- 				<td> -->
            <!-- 					${p2pInvestmentInformation.investmentAgreement} -->
            <!-- 				</td> -->
            <td>
                <fmt:formatDate value="${p2pInvestmentInformation.investmentAgreementTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>