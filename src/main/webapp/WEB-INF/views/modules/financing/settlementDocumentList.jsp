<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>清算文件管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#beginTime").val($("#beginTimeHidden").val());
            $("#endTime").val($("#endTimeHidden").val());
            $("#fId").val($("#financingInformationId").val());
        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

        function exportExcel() {
            var beginTime = $("#beginTimeHidden").val();
            var endTime = $("#endTimeHidden").val();
            var financingInformationId = $("#financingInformationId").val();
            window.location.href = '${ctx}/financing/p2pPaymentOfRatingCost/exportExcel?beginTime=' + beginTime + '&&endTime=' + endTime + '&&financingInformationId=' + financingInformationId;
// 			$("#searchForm").submit();
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/financing/p2pPaymentOfRatingCost/">清算文件管理</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pPaymentOfRatingCost"
           action="${ctx}/financing/p2pPaymentOfRatingCost/settlementDocumentList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul style="float: left" class="ul-form">
        <li><label>到账时间：</label>
            <input id="beginTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${p2pPaymentOfRatingCost.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
            <input id="endTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${p2pPaymentOfRatingCost.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
            <input id="financingInformationId" type="hidden" value="${p2pPaymentOfRatingCost.financingInformationId}">
            <form:input path="beginTime" id="beginTime" type="text" readonly="readonly" maxlength="20"
                        class="input-medium Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',isShowClear:false});"/> -
            <form:input path="endTime" id="endTime" type="text" readonly="readonly" maxlength="20"
                        class="input-medium Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd 23:59:59',isShowClear:false});"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
    <input class="btn btn-primary" type="button" style="margin-top: 4px;margin-left: 10px;" value="导出"
           onclick="exportExcel();"/>
    <div class="clearfix"></div>
    <!-- <span><a href="${ctx}/financing/p2pPaymentOfRatingCost/exportExcel" onclick="exportExcel();" >导出</a></span> -->
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>订单编号</th>
        <th>付款金额(元)</th>
        <th>付款用户编号</th>
        <th>到账时间</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pPaymentOfRatingCost">
        <tr>
            <td>${status.count}</td>
            <td>${p2pPaymentOfRatingCost.orderNo}</td>
            <td><fmt:formatNumber pattern="#,##0.00">${p2pPaymentOfRatingCost.paymentAmount}</fmt:formatNumber></td>
            <td>${p2pPaymentOfRatingCost.paymentId}</td>
            <td><fmt:formatDate value="${p2pPaymentOfRatingCost.timeOfPayment}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>