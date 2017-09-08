<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级费用缴纳情况管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
        });
        function goBack() {
            window.location.href = '${ctx}/financing/p2pPaymentOfRatingCost/list';
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/financing/p2pPaymentOfRatingCost/">企业订单管理</a></li>
    <li class="active"><a href="javascript:void(0);">企业订单详情</a></li>
</ul>
<br/>
<h4>企业信息</h4>
<table id="table1" class="table table-striped table-bordered table-condensed mytable">
    <tr>
        <td>企业名称</td>
        <td>${p2pPaymentOfRatingCost.p2pEnterpriseCertify.enterpriseName}</td>
        <c:choose>
            <c:when test="${p2pPaymentOfRatingCost.chargingItem == '2'}">
                <td>评级报告名称</td>
                <td>${p2pPaymentOfRatingCost.reportName}</td>
            </c:when>
            <c:otherwise>
                <td></td>
                <td></td>
            </c:otherwise>
        </c:choose>
    </tr>
</table>
<h4>订单信息</h4>
<table id="table2" class="table table-striped table-bordered table-condensed mytable">
    <tr>
        <td>订单编号</td>
        <td>${p2pPaymentOfRatingCost.orderNo}</td>
        <td>借贷产品名称</td>
        <td>${p2pPaymentOfRatingCost.p2pFinancingInformation.finacingName}</td>
    </tr>
    <tr>
        <td>收费项目</td>
        <td>${fns:getDictLabel(p2pPaymentOfRatingCost.chargingItem,'charging_item','')}</td>
        <td>应付款日</td>
        <td><fmt:formatDate value="${p2pPaymentOfRatingCost.orderTime}" pattern="yyyy-MM-dd"/></td>
    </tr>
</table>
<h4>付款信息</h4>
<table id="table3" class="table table-striped table-bordered table-condensed mytable">
    <tr>
        <td>付款状态</td>
        <td>${fns:getDictLabel(p2pPaymentOfRatingCost.paymentStatus, 'payment_status', '')}</td>
        <td>交易流水号</td>
        <td>${p2pPaymentOfRatingCost.batchNo}</td>
    </tr>
    <tr>
        <td>已付金额</td>
        <c:choose>
            <c:when test="${p2pPaymentOfRatingCost.paymentStatus == 1 }">
                <td><fmt:formatNumber pattern="#,##0.00">${p2pPaymentOfRatingCost.paymentAmount}</fmt:formatNumber>元
                </td>
            </c:when>
            <c:otherwise>
                <td>--</td>
            </c:otherwise>
        </c:choose>
        <td>到账时间</td>
        <td><fmt:formatDate value="${p2pPaymentOfRatingCost.timeOfPayment}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
</table>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="goBack();"/>
</div>
</body>
</html>