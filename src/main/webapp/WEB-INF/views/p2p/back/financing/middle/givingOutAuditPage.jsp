<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>机构放款审核列表</title>
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
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/inFinancing/givingOutAuditPage"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>借贷产品编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品名称：</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>凭证审核状态：</label>
            <form:select path="givingOutState" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:options items="${fns:getDictList('giving_out_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<!-- 	<sys:message content="${message}"/> -->
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>借贷产品名称</th>
        <th>借贷产品类别</th>
        <th>企业名称</th>
        <th>借贷产品期限</th>
        <th>融资金额（元）</th>
        <th>已募集金额（元）</th>
        <th>发布时间</th>
        <th>投资时间</th>
        <th>凭证审核状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <td>
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${p2pFinancingInformation.finacingName}
                </a>
            </td>
            <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        ${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}
                </a>
            </td>
            <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    ${p2pFinancingInformation.applicationAmount}
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    ${p2pFinancingInformation.financingAmount}
                </c:if>
            </td>
            <td>
                <a href="${ctx}/inFinancing/getInvestRecordPage?id=${p2pFinancingInformation.id}">
                        ${p2pFinancingInformation.hasRaiseAmount}
                </a>
            </td>
            <td>
                <fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td><fmt:formatDate value="${p2pFinancingInformation.p2pInvestmentInformation.lastInvestmentTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${fns:getDictLabel(p2pFinancingInformation.givingOutState, 'giving_out_state', '')}</td>
            <td>
                <c:if test="${p2pFinancingInformation.givingOutState == 0}">
                    --
                </c:if>
                <c:if test="${p2pFinancingInformation.givingOutState == 1}">
                    <a href="${ctx}/inFinancing/givingOutAuditDetails?id=${p2pFinancingInformation.id}">查看</a>
                </c:if>
                <c:if test="${p2pFinancingInformation.givingOutState == 2}">
                    <shiro:hasPermission name="mechanism:loan">
                        <a href="${ctx}/inFinancing/givingOutAuditDetails?id=${p2pFinancingInformation.id}">审核</a>
                    </shiro:hasPermission>
                </c:if>
                <c:if test="${p2pFinancingInformation.givingOutState == 3}">
                    <a href="${ctx}/inFinancing/givingOutAuditDetails?id=${p2pFinancingInformation.id}">查看</a>
                </c:if>
            </td>
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
<script type="text/javascript">
    $(function () {

    })


</script>
</html>