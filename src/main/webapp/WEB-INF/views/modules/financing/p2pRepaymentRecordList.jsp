<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>还款计划与记录管理</title>
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
    <li class="active"><a href="${ctx}/financing/p2pRepaymentRecord/">还款计划与记录列表</a></li>
    <shiro:hasPermission name="financing:p2pRepaymentRecord:edit">
        <li><a href="${ctx}/financing/p2pRepaymentRecord/form">还款计划与记录添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pRepaymentRecord" action="${ctx}/financing/p2pRepaymentRecord/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>还款记录ID：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>融资信息ID：</label>
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>计划还款日期：</label>
            <input name="planRepaymentDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pRepaymentRecord.planRepaymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>计划还款金额：</label>
            <form:input path="planRepaymentAmount" htmlEscape="false" class="input-medium"/>
        </li>
        <li><label>实际还款日期：</label>
            <input name="realRepaymentDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pRepaymentRecord.realRepaymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>实际还款金额：</label>
            <form:input path="realRepaymentAmount" htmlEscape="false" class="input-medium"/>
        </li>
        <li><label>还款账户：</label>
            <form:input path="repaymentAccount" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>还款记录ID</th>
        <th>融资信息ID</th>
        <th>计划还款日期</th>
        <th>计划还款金额</th>
        <th>实际还款日期</th>
        <th>实际还款金额</th>
        <th>还款账户</th>
        <shiro:hasPermission name="financing:p2pRepaymentRecord:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pRepaymentRecord">
        <tr>
            <td><a href="${ctx}/financing/p2pRepaymentRecord/form?id=${p2pRepaymentRecord.id}">
                    ${p2pRepaymentRecord.id}
            </a></td>
            <td>
                    ${p2pRepaymentRecord.financingInformationId}
            </td>
            <td>
                <fmt:formatDate value="${p2pRepaymentRecord.planRepaymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pRepaymentRecord.planRepaymentAmount}
            </td>
            <td>
                <fmt:formatDate value="${p2pRepaymentRecord.realRepaymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pRepaymentRecord.realRepaymentAmount}
            </td>
            <td>
                    ${p2pRepaymentRecord.repaymentAccount}
            </td>
            <shiro:hasPermission name="financing:p2pRepaymentRecord:edit">
                <td>
                    <a href="${ctx}/financing/p2pRepaymentRecord/form?id=${p2pRepaymentRecord.id}">修改</a>
                    <a href="${ctx}/financing/p2pRepaymentRecord/delete?id=${p2pRepaymentRecord.id}"
                       onclick="return confirmx('确认要删除该还款计划与记录吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>