<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>逾期债务人</title>
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
<form:form id="searchForm" modelAttribute="p2pDebtorOverdueRecord" action="${ctx}/after/overdue/debtorOverdueList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>债务人编号：</label>
            <form:input path="userId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>

        <li><label>债务人：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>

        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<!-- 	<sys:message content="${message}"/> -->
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>债务人编号</th>
        <th>债务人</th>
        <th>债项个数</th>
        <th>项目详情</th>
        <th>逾期情况查询</th>
        <th>累计逾期天数</th>
        <th>连续逾期天数</th>
        <th>累计逾期次数</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pDebtorOverdueRecord">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!--债务人编号-->
            <td>${p2pDebtorOverdueRecord.userId }</td>
            <!--债务人-->
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pDebtorOverdueRecord.userId}">
                        ${p2pDebtorOverdueRecord.p2pEnterpriseCertify.enterpriseName }
                </a>
            </td>
            <!--债项个数-->
            <td>${p2pDebtorOverdueRecord.debtNum }</td>
            <!--项目详情-->
            <td>查看</td>
            <!--逾期情况查询-->
            <td>查看</td>
            <!--累计逾期天数-->
            <td>${p2pDebtorOverdueRecord.totalOverdueDays }</td>
            <!--连续逾期天数-->
            <td>${p2pDebtorOverdueRecord.continueOverdueDays }</td>
            <!--累计逾期次数-->
            <td>${p2pDebtorOverdueRecord.totalOverdueNumber }</td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>