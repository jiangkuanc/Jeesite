<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资债项列表</title>
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
<h3>投资债项列表</h3>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <tr>
        <td>投资机构</td>
        <td>${p2pInvestmentEarnRecord.bankName}</td>
        <td>认购债项总数</td>
        <td>${p2pInvestmentEarnRecord.countInvestItem}</td>
        <td>预计总收益</td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${fic:getBankPlanTotalEarn(p2pInvestmentEarnRecord.id)}</fmt:formatNumber></td>
        <td>实际总收益</td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${fic:getBankRealTotalEarn(p2pInvestmentEarnRecord.id)}</fmt:formatNumber></td>
    </tr>
</table>
<h4>认购记录</h4>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>订单号</th>
        <th>认购时间</th>
        <th>认购债项名称</th>
        <th>投资总金额（元）</th>
        <th>预期总收益（元）</th>
        <th>实际总收益（元）</th>
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
            <!--认购时间-->
            <td>
                <fmt:formatDate value="${p2pInvestmentInformation.p2pGivingOutLoans.givingOutTime}"
                                pattern="yyyy-MM-dd"/>
            </td>
            <!--认购债项名称-->
            <td>
                <a href="${ctx}/financing/p2pFinancingInformation/debtDetail?id=${p2pInvestmentInformation.financingInformationId }">
                        ${p2pInvestmentInformation.p2pFinancingInformation.finacingName}
                </a>
            </td>
            <!--投资总金额（元）-->
            <td>
                <fmt:formatNumber pattern="#,##0.00">${p2pInvestmentInformation.investmentAmount}</fmt:formatNumber>
            </td>
            <!--预期总收益（元）-->
            <td>
                <fmt:formatNumber
                        pattern="#,##0.00">${fic:getDebtPlanTotalEarn(p2pInvestmentInformation.financingInformationId)}</fmt:formatNumber>
            </td>
            <!--实际总收益（元）-->
            <td><fmt:formatNumber
                    pattern="#,##0.00">${fic:getDebtRealTotalEarn(p2pInvestmentInformation.financingInformationId)}</fmt:formatNumber></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
<div class="pagination">${page}</div>
</body>
</html>