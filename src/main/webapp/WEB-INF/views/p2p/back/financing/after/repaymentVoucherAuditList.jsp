<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>还款凭证审核列表</title>
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
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/after/repaymentVoucherAudit/list"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>借贷产品编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>凭证审核状态：</label>
            <form:select path="p2pRepaymentRecord.repaymentAuditState" htmlEscape="false" maxlength="64"
                         class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:options items="${fns:getDictList('repayment_audit_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>借贷产品类别</th>
        <th>借贷产品期限</th>
        <th>当前还款期数</th>
        <th>还款方式</th>
        <th>融资金额（元）</th>
        <th>本期应还本金（元）</th>
        <th>本期应还利息（元）</th>
        <th>本期应还总金额（元）</th>
        <th>发布时间</th>
        <th>投资时间</th>
        <th>凭证审核状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">
        <tr>
            <td>${status.count }</td>
            <td>${p2pFinancingInformation.id}</td>
            <td title="${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        ${fns:abbr(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName,15)}
                </a>
            </td>
            <td title="${p2pFinancingInformation.finacingName}">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${fns:abbr(p2pFinancingInformation.finacingName,15)}
                </a>
            </td>
            <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
            <td>
                <a href="${ctx}/after/financing/repaymentPlan?id=${p2pFinancingInformation.id}">${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</a>
            </td>
            <td>${p2pFinancingInformation.p2pRepaymentPlan.phase }</td>
            <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>
                </c:if>
            </td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pRepaymentPlan.planRepaymentPrincipal }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pRepaymentPlan.planRepaymentInterest }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pRepaymentPlan.planRepaymentPrincipal+p2pFinancingInformation.p2pRepaymentPlan.planRepaymentInterest }</fmt:formatNumber></td>
            <td><fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${p2pFinancingInformation.p2pInvestmentInformation.lastInvestmentTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${fns:getDictLabel(p2pFinancingInformation.p2pRepaymentRecord.repaymentAuditState, 'repayment_audit_state', '')}</td>
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.p2pRepaymentRecord.repaymentAuditState == 0 }">
                        --
                    </c:when>
                    <c:when test="${p2pFinancingInformation.p2pRepaymentRecord.repaymentAuditState == 1 }">
                        <shiro:hasPermission name="repayment:voucher">
                            <a href="${ctx }/after/repaymentVoucherAudit/form?financingInformationId=${p2pFinancingInformation.id}&repaymentRecordId=${p2pFinancingInformation.p2pRepaymentRecord.id}&temp=1">审核</a>
                        </shiro:hasPermission>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx }/after/repaymentVoucherAudit/form?financingInformationId=${p2pFinancingInformation.id}&repaymentRecordId=${p2pFinancingInformation.p2pRepaymentRecord.id}&temp=2">查看</a>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>