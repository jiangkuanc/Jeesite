<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业订单管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#beginTime").val($("#beginTimeHidden").val());
            $("#endTime").val($("#endTimeHidden").val());
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
    <li class="active"><a href="${ctx}/financing/p2pPaymentOfRatingCost/">企业订单管理</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pPaymentOfRatingCost" action="${ctx}/financing/p2pPaymentOfRatingCost/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>收费项目：</label>
            <form:select path="chargingItem" class="input-medium-select">
                <form:option value=" ">不限</form:option>
                <form:options items="${fns:getDictList('charging_item')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>到账时间：</label>
            <input id="beginTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${user.p2pInvestmentInformation.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
            <input id="endTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${user.p2pInvestmentInformation.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
            <form:input path="beginTime" id="beginTime" type="text" readonly="readonly" maxlength="20"
                        class="input-medium Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',isShowClear:false});"/> -
            <form:input path="endTime" id="endTime" type="text" readonly="readonly" maxlength="20"
                        class="input-medium Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd 23:59:59',isShowClear:false});"/>
        </li>
        <li class="clearfix"></li>
        <li><label>订单状态：</label>
            <c:forEach items="${fns:getDictList('payment_status')}" var="item">
                <input type="checkbox" name="paymentStatus${item.value}"
                       value="${item.value}">${item.label} &nbsp;&nbsp;
            </c:forEach>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>企业名称</th>
        <th>订单编号</th>
        <th>交易流水号</th>
        <th>到账时间</th>
        <th>收费项目</th>
        <th>付款金额</th>
        <th>订单状态</th>
        <th>详情</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pPaymentOfRatingCost">
        <tr>
            <td>${status.count}</td>
            <td>${p2pPaymentOfRatingCost.p2pEnterpriseCertify.enterpriseName}</td>
            <td>${p2pPaymentOfRatingCost.orderNo}</td>
            <td>${p2pPaymentOfRatingCost.batchNo}</td>
            <td><fmt:formatDate value="${p2pPaymentOfRatingCost.timeOfPayment}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${fns:getDictLabel(p2pPaymentOfRatingCost.chargingItem, 'charging_item', '')}</td>
            <td><fmt:formatNumber pattern="#,##0.00">${p2pPaymentOfRatingCost.paymentAmount}</fmt:formatNumber>元</td>
            <td>${fns:getDictLabel(p2pPaymentOfRatingCost.paymentStatus, 'payment_status', '')}</td>
            <td>
                <a href="${ctx}/financing/p2pPaymentOfRatingCost/form?id=${p2pPaymentOfRatingCost.id}">详情</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>