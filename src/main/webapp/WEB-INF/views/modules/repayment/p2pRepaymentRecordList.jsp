<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
还款记录表
@author Quincy
@version 2016-11-03
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>还款记录管理</title>
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
    <li class="active"><a href="${ctx}/repayment/p2pRepaymentRecord/">还款记录列表</a></li>
    <shiro:hasPermission name="repayment:p2pRepaymentRecord:edit">
        <li><a href="${ctx}/repayment/p2pRepaymentRecord/form">还款记录添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pRepaymentRecord" action="${ctx}/repayment/p2pRepaymentRecord/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <shiro:hasPermission name="repayment:p2pRepaymentRecord:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pRepaymentRecord">
        <tr>
            <shiro:hasPermission name="repayment:p2pRepaymentRecord:edit">
                <td>
                    <a href="${ctx}/repayment/p2pRepaymentRecord/form?id=${p2pRepaymentRecord.id}">修改</a>
                    <a href="${ctx}/repayment/p2pRepaymentRecord/delete?id=${p2pRepaymentRecord.id}"
                       onclick="return confirmx('确认要删除该还款记录吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>