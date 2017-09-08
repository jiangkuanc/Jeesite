<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>贷款发放记录管理</title>
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
    <li class="active"><a href="${ctx}/financing/p2pGivingOutLoans/">贷款发放记录列表</a></li>
    <shiro:hasPermission name="financing:p2pGivingOutLoans:edit">
        <li><a href="${ctx}/financing/p2pGivingOutLoans/form">贷款发放记录添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pGivingOutLoans" action="${ctx}/financing/p2pGivingOutLoans/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>贷款发放ID：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>融资信息ID：</label>
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>投资信息ID：</label>
            <form:input path="investmentInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>投资人账户：</label>
            <form:input path="investorAccount" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>投资人用户ID：</label>
            <form:input path="givingOutPerson" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>放款金额：</label>
            <form:input path="givingOutAmount" htmlEscape="false" maxlength="11" class="input-medium"/>
        </li>
        <li><label>放款时间：</label>
            <input name="givingOutTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pGivingOutLoans.givingOutTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>融资人账户：</label>
            <form:input path="financierAccount" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>融资人用户ID：</label>
            <form:input path="receiveAmoutPerson" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>收款金额：</label>
            <form:input path="receiveAmount" htmlEscape="false" maxlength="11" class="input-medium"/>
        </li>
        <li><label>收款时间：</label>
            <input name="receiveAmountTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pGivingOutLoans.receiveAmountTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>贷款发放ID</th>
        <th>融资信息ID</th>
        <th>投资信息ID</th>
        <th>投资人账户</th>
        <th>投资人用户ID</th>
        <th>放款金额</th>
        <th>放款时间</th>
        <th>融资人账户</th>
        <th>融资人用户ID</th>
        <th>收款金额</th>
        <th>收款时间</th>
        <shiro:hasPermission name="financing:p2pGivingOutLoans:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pGivingOutLoans">
        <tr>
            <td><a href="${ctx}/financing/p2pGivingOutLoans/form?id=${p2pGivingOutLoans.id}">
                    ${p2pGivingOutLoans.id}
            </a></td>
            <td>
                    ${p2pGivingOutLoans.financingInformationId}
            </td>
            <td>
                    ${p2pGivingOutLoans.investmentInformationId}
            </td>
            <td>
                    ${p2pGivingOutLoans.investorAccount}
            </td>
            <td>
                    ${p2pGivingOutLoans.givingOutPerson}
            </td>
            <td>
                    ${p2pGivingOutLoans.givingOutAmount}
            </td>
            <td>
                <fmt:formatDate value="${p2pGivingOutLoans.givingOutTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pGivingOutLoans.financierAccount}
            </td>
            <td>
                    ${p2pGivingOutLoans.receiveAmoutPerson}
            </td>
            <td>
                    ${p2pGivingOutLoans.receiveAmount}
            </td>
            <td>
                <fmt:formatDate value="${p2pGivingOutLoans.receiveAmountTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <shiro:hasPermission name="financing:p2pGivingOutLoans:edit">
                <td>
                    <a href="${ctx}/financing/p2pGivingOutLoans/form?id=${p2pGivingOutLoans.id}">修改</a>
                    <a href="${ctx}/financing/p2pGivingOutLoans/delete?id=${p2pGivingOutLoans.id}"
                       onclick="return confirmx('确认要删除该贷款发放记录吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>