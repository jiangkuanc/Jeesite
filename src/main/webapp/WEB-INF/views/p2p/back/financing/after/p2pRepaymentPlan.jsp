<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>还款计划</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="title"><h3>还款计划</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品详情</h4>
<table class="table table-striped table-bordered table-condensed mytable1">
    <tbody>
    <tr>
        <td>借贷产品编号</td>
        <td>${p2pFinancingInformation.id }</td>
        <td>借贷产品类型</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
        <td>还款方式</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
        <td>级别</td>
        <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</td>
    </tr>
    <tr>
        <td>借贷产品名称</td>
        <td>${p2pFinancingInformation.finacingName}</td>
        <td>期限</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>融资金额</td>
        <td>
            <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>元
            </c:if>
            <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>元
            </c:if>
        </td>
        <td>利率</td>
        <td><fmt:formatNumber
                pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
        </td>
    </tr>
    <tr>
        <td>应还款总额</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.qbyhk }</fmt:formatNumber>元</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
<h4>还款计划</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>账期</th>
        <th>还款时间</th>
        <th>应还本金(元)</th>
        <th>应还利息(元)</th>
    </tr>
    <c:forEach items="${list }" var="p2pRepaymentPlan" varStatus="status">
        <tr>
            <td>${p2pRepaymentPlan.phase }</td>
            <td><fmt:formatDate value="${p2pRepaymentPlan.planRepaymentDate }" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatNumber pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentPrincipal }</fmt:formatNumber></td>
            <td><fmt:formatNumber pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentInterest }</fmt:formatNumber></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

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