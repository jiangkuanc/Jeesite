<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>逾期借贷产品</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            <%--    	$.ajax({	--%>
            <%--			url : '',--%>
            <%--			dataType:'json',--%>
            <%--			type:'post',--%>
            <%--			success:function(data){	--%>
            <%--				$("#currentRepaymentDetails").html(data);	--%>
            <%--				$("#currentRepaymentDetails").modal();--%>
            <%--			}--%>
            <%--		});--%>


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
<form:form id="searchForm" modelAttribute="p2pDebtOverdueRecord" action="${ctx}/after/overdue/debtOverdueList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>借贷产品编号：</label>
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品名称：</label>
            <form:input path="p2pFinancingInformation.finacingName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>公司名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
            <%--<li><label>逾期类别：</label>

            </li>
            --%>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>借贷产品名称</th>
        <th>公司名称</th>
        <th>融资总金额（元）</th>
        <th>已还总金额（元）</th>
        <%--<th>逾期类别</th>--%>
        <th>累计逾期次数</th>
        <th>累计逾期天数（天）</th>
        <th>连续逾期天数（天）</th>
        <th>担保公司代偿状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pDebtOverdueRecord">
        <tr>
            <!-- 序号 -->
            <td>${status.count }</td>
            <!--借贷产品编号-->
            <td>${p2pDebtOverdueRecord.financingInformationId }</td>
            <!--借贷产品名称-->
            <td title="${p2pDebtOverdueRecord.p2pFinancingInformation.finacingName }">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pDebtOverdueRecord.financingInformationId}">
                        ${fns:abbr(p2pDebtOverdueRecord.p2pFinancingInformation.finacingName,15)}

                </a>
            </td>
            <!--公司名称-->
            <td title="${p2pDebtOverdueRecord.p2pEnterpriseCertify.enterpriseName}">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pDebtOverdueRecord.userId}">
                        ${fns:abbr(p2pDebtOverdueRecord.p2pEnterpriseCertify.enterpriseName,15)}
                </a>
            </td>
            <!--融资总金额（元）-->
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber
                            pattern="#,##0.00">${p2pDebtOverdueRecord.p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber
                            pattern="#,##0.00">${p2pDebtOverdueRecord.p2pFinancingInformation.financingAmount}</fmt:formatNumber>
                </c:if>
            </td>
            <!--已还总金额（元）-->
            <td>
                <a href="${ctx}/after/financing/repaymentRecord?id=${p2pDebtOverdueRecord.financingInformationId}"><fmt:formatNumber
                        pattern="#,##0.00">${p2pDebtOverdueRecord.p2pFinancingInformation.yhzjz}</fmt:formatNumber></a>
            </td>
            <!--逾期类别-->
                <%--<td></td>--%>
            <!--累计逾期次数-->
            <td>${p2pDebtOverdueRecord.totalOverdueNumber}</td>
            <!--累计逾期天数-->
            <td>${p2pDebtOverdueRecord.totalOverdueDays}</td>
            <!--连续逾期天数-->
            <td>${p2pDebtOverdueRecord.continueOverdueDays}</td>
            <!--担保公司代偿状态-->
            <td>${p2pDebtOverdueRecord.guaranteeRepayState}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
<form:form action="${ctx}/after/overdue/overdue" method="post" class="breadcrumb form-search">
    <ul class="ul-form">
        <li>
            <label>选择逾期统计日期：&nbsp;</label>
            <input name="currentDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
                   value="<fmt:formatDate value="${p2pPlatformOperationDataStatistics.beginDate}" pattern="yyyy-MM-dd"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="确定"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>

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