<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>投资收益</title>
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
<form:form id="searchForm" modelAttribute="user" action="${ctx}/investment/investmentIncome/investmentIncomeList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>投资方名称：</label>
            <form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>最近一次投资时间：</label>
            <input id="beginTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${user.p2pInvestmentInformation.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
            <input id="endTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${user.p2pInvestmentInformation.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
            <form:input path="p2pInvestmentInformation.beginTime" id="beginTime" type="text" readonly="readonly"
                        maxlength="20" class="input-mini Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',isShowClear:false});"/> -
            <form:input path="p2pInvestmentInformation.endTime" id="endTime" type="text" readonly="readonly"
                        maxlength="20" class="input-mini Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd 23:59:59',isShowClear:false});"/>
        </li>
        <li><label>投资方类型：</label>
            <form:select path="p2pUserInformation.userBodyType" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:option value="2" label="个人"/>
                <form:option value="3" label="投资机构"/>
                <%--<form:options items="${fns:getDictList('user_body_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
            </form:select>
        </li>
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
        <th>投资方名称</th>
        <th>投资方类型</th>
        <th>最近一次投资时间</th>
        <th>累计投资借贷产品数</th>
        <th>累计投资成功总金额（元）</th>
        <th>预计总收益（元）</th>
        <th>实际总收益（元）</th>
        <th>最近一笔收益金额（元）</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="user">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                <c:if test="${user.p2pUserInformation.userBodyType == 2 }">
                    <!-- 个人 -->
                    <a href="${ctx}/user/userList/personalBaseInfo?userid=${user.id}">${user.name }</a>
                </c:if>
                <c:if test="${user.p2pUserInformation.userBodyType == 3 }">
                    <!-- 机构 -->
                    <a href="${ctx}/user/userList/agencyBaseInfo?userid=${user.id}">${user.name }</a>
                </c:if>
            </td>
            <td>${fns:getDictLabel(user.p2pUserInformation.userBodyType, 'user_body_type', '')}</td>
            <td><fmt:formatDate value="${user.p2pInvestmentInformation.lastInvestmentTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${ctx}/investment/investmentIncome/investmentDebtList?userId=${user.id}">${user.p2pInvestmentInformation.count }</a>
            </td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${user.p2pInvestmentInformation.investmentSumAmount }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${user.p2pInvestmentInformation.expectEarn }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${user.p2pInvestmentInformation.accumulativeIncome }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${user.p2pInvestmentInformation.latelyIncome }</fmt:formatNumber></td>
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