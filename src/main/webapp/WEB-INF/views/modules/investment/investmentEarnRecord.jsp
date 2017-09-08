<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资收益</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#btnSubmit").click(function(){

            //  $("#searchForm").submit();
            //if(${!empty p2pInvestmentEarnRecord.beginTime}){
            //	alert(123);
            //	}
            //var a = '${p2pInvestmentEarnRecord.beginTime}';
            // alert(a);
            //});

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
<form:form id="searchForm" modelAttribute="p2pInvestmentEarnRecord"
           action="${ctx}/investment/p2pInvestmentInformation/investmentEarnRecord" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>投资机构：</label>
            <form:input path="bankName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>认购时间：</label>
            <input id="beginTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${p2pInvestmentEarnRecord.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
            <input id="endTimeHidden" type="hidden"
                   value='<fmt:formatDate value="${p2pInvestmentEarnRecord.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
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
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>投资机构</th>
        <th>最近一次投资时间</th>
        <th>累计投资项目总数</th>
        <th>累计投资成功债项数</th>
        <th>累计投资成功总金额（元）</th>
        <th>预计总收益（元）</th>
        <th>实际总收益（元）</th>
        <%--
                        <th>最近一笔收益金额（元）</th>
                    --%></tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentEarnRecord">

        <tr>

            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!--投资机构-->
            <td>
                <a href="${ctx}/user/p2pUserInformation/bankForm?id=${p2pInvestmentEarnRecord.id}">
                        ${p2pInvestmentEarnRecord.bankName}
                </a>
            </td>
            <!--最近一次投资时间-->
            <td>
                <fmt:formatDate value="${p2pInvestmentEarnRecord.lateInvestTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
            </td>
            <!--累计投资项目总数-->
            <td>
                <c:choose>
                    <c:when test="${p2pInvestmentEarnRecord.countInvestItem >0}">
                        <a href="${ctx}/investment/p2pInvestmentInformation/investmentDebtList?user.p2pUserInformation.id=${p2pInvestmentEarnRecord.id}&bankName=${p2pInvestmentEarnRecord.bankName}&countInvestItem=${p2pInvestmentEarnRecord.countInvestItem}">
                                ${p2pInvestmentEarnRecord.countInvestItem}
                        </a>
                    </c:when>
                    <c:otherwise>
                        ${p2pInvestmentEarnRecord.countInvestItem}
                    </c:otherwise>
                </c:choose>
            </td>
            <!--累计投资成功债项数-->
            <td>
                    ${p2pInvestmentEarnRecord.countInvestSuccessItem}
            </td>
            <!--累计投资成功总金额（元）-->
            <td><fmt:formatNumber pattern="#,##0.00">${p2pInvestmentEarnRecord.sumInvestAccount}</fmt:formatNumber></td>
            <!--预计总收益（元）-->
            <td>
                <c:if test="${!empty p2pInvestmentEarnRecord.id }"><fmt:formatNumber
                        pattern="#,##0.00">${fic:getBankPlanTotalEarn(p2pInvestmentEarnRecord.id)}</fmt:formatNumber></c:if>
            </td>
            <!--实际总收益（元）-->
            <td><fmt:formatNumber
                    pattern="#,##0.00">${fic:getBankRealTotalEarn(p2pInvestmentEarnRecord.id)}</fmt:formatNumber></td>
            <!--最近一笔收益金额（元）-->
                <%--<td>——</td>
            --%></tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>