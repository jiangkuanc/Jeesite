<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>认购记录</title>
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
<form:form id="searchForm" modelAttribute="p2pInvestmentInformation"
           action="${ctx}/investment/p2pInvestmentInformation/" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>投资机构：</label>
            <form:input path="user.p2pUserInformation.bankname" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <!-- 			<li><label>订单号：</label> -->
        <!-- 				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/> -->
        <!-- 			</li> -->
        <li><label>订单状态：</label>
            <form:select path="p2pGivingOutLoans.givingOutAmount" class="input-medium-select">
                <form:option value="">全部</form:option>
                <form:option value="111">已放款</form:option>
                <form:option value="222">未放款</form:option>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th width="3%">序号</th>
        <th width="8%">订单号</th>
        <th width="18%">投资机构</th>
        <th width="8%">投资方类型</th>
        <!-- 				<th>合同签订时间</th> -->
        <!-- 				<th>三方协议</th> -->
        <th width="8%">放款时间</th>
        <th width="15%">投资金额（元）</th>
        <th width="20%">投资债项名称</th>
        <th width="15%">预计收益（元）</th>
        <th width="5%">订单状态</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">

        <tr>

            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!--订单号-->
            <td>
                    ${p2pInvestmentInformation.id}
            </td>
            <!--投资方-->
            <td title="${p2pInvestmentInformation.user.p2pUserInformation.bankname }">
                <a href="${ctx}/user/p2pUserInformation/bankForm?id=${p2pInvestmentInformation.user.p2pUserInformation.id}">
                        ${fns:abbr(p2pInvestmentInformation.user.p2pUserInformation.bankname,26)}
                </a>
            </td>
            <!--投资方类型-->
            <td>
                    ${fns:getDictLabel(p2pInvestmentInformation.user.p2pUserInformation.userBodyType, 'user_body_type', '')}</td>
            <!--合同签订时间-->
            <!-- 				<td> -->
            <!-- 					<fmt:formatDate value="${p2pInvestmentInformation.p2pGivingOutLoans.contractSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/> -->
            <!-- 				</td> -->
            <!--三方协议-->
            <!-- 				<td>${p2pInvestmentInformation.p2pGivingOutLoans.tripartiteAgreement}</td> -->
            <!--放款时间-->
            <td>
                <c:if test="${!empty p2pInvestmentInformation.p2pGivingOutLoans.givingOutAmount && p2pInvestmentInformation.p2pGivingOutLoans.givingOutAmount != 0}">
                    <fmt:formatDate value="${p2pInvestmentInformation.p2pGivingOutLoans.givingOutTime}"
                                    pattern="yyyy-MM-dd"/>
                </c:if>
            </td>
            <!--投资金额（元）-->
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pInvestmentInformation.investmentAmount}</fmt:formatNumber></td>
            <!--投资债项名称-->
            <td title="${p2pInvestmentInformation.p2pFinancingInformation.finacingName}">
                <a href="${ctx}/financing/p2pFinancingInformation/debtDetail?id=${p2pInvestmentInformation.financingInformationId }">
                        ${fns:abbr(p2pInvestmentInformation.p2pFinancingInformation.finacingName,35)}
                </a>
            </td>
            <!--预计收益-->
            <td>
                <c:if test="${!empty p2pInvestmentInformation.p2pFinancingInformation.id}"><fmt:formatNumber
                        pattern="#,##0.00">${fic:getRepaymentAmount(p2pInvestmentInformation.p2pFinancingInformation) }</fmt:formatNumber></c:if>
            </td>
            <!--订单状态-->
            <td>
                <c:if test="${empty p2pInvestmentInformation.p2pGivingOutLoans.givingOutAmount || p2pInvestmentInformation.p2pGivingOutLoans.givingOutAmount == 0}">
                    未放款
                </c:if>
                <c:if test="${!empty p2pInvestmentInformation.p2pGivingOutLoans.givingOutAmount && p2pInvestmentInformation.p2pGivingOutLoans.givingOutAmount != 0}">
                    已放款
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>