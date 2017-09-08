<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
平台数据统计
@author Sora
@version 2016-11-22
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>平台数据统计管理</title>
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

    <%
        Date date = new Date();
        request.setAttribute("date", date);
    %>
</head>
<body>
<form:form id="searchForm" modelAttribute="p2pPlatformOperationDataStatistics"
           action="${ctx}/operation/p2pPlatformOperationDataStatistics/" method="post" class="form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <!-- <ul class="ul-form">
    <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
    <li class="clearfix"></li>
    </ul> -->
    <div style="margin-top:8px;">
        <label>日期：&nbsp;</label>
        <input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
               value="<fmt:formatDate value="${p2pPlatformOperationDataStatistics.beginDate}" pattern="yyyy-MM-dd"/>"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
        <label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
               value="<fmt:formatDate value="${p2pPlatformOperationDataStatistics.endDate}" pattern="yyyy-MM-dd"/>"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
        <input onclick="resetForm()" class="btn btn-primary" type="button" value="重置"/>
    </div>
</form:form>
<sys:message content="${message}"/>
<!-- 列表 -->
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>日期</th>
        <th>交易总额(元)</th>
        <th>交易总笔数</th>
        <th>融资人总数</th>
        <th>投资人总数</th>
        <th>待偿金额(元)</th>
        <th>逾期金额(元)</th>
        <th>项目逾期率(%)</th>
        <th>金额逾期率(%)</th>
        <th>逾期项目数</th>
        <th>人均累计融资金额(元)</th>
        <th>人均累计投资金额(元)</th>
        <th>笔均融资金额(元)</th>
        <th>最大单户融资余额占比(%)</th>
        <th>最大十户融资余额占比(%)</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pPlatformOperationDataStatistics" varStatus="status">
        <tr style="text-align:center;">
            <!-- 序号 -->
            <td>
                    ${status.count}
            </td>
            <!-- 日期 -->
            <td style="white-space:nowrap;">
                <fmt:formatDate value="${p2pPlatformOperationDataStatistics.historyDate}" pattern="yyyy-MM-dd"/>
            </td>
            <!-- 交易总额 -->
            <td>

                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.tradeTotalAmount}" type="number"/>
            </td>
            <!-- 交易总笔数 -->
            <td>
                    ${p2pPlatformOperationDataStatistics.tradeTotalNumber}
            </td>
            <!-- 融资人总数 -->
            <td>
                    ${p2pPlatformOperationDataStatistics.financingTotalPeople}
            </td>
            <!-- 投资人总数-->
            <td>
                    ${p2pPlatformOperationDataStatistics.investmentTotalPeople}
            </td>
            <!-- 代偿金额 -->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.compensatoryAmount}" type="number"/>
            </td>
            <!-- 逾期金额 -->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.overdueAmount}" type="number"/>
            </td>
            <!-- 项目逾期率 -->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.projectOverdueRate}" type="number"/>
            </td>
            <!-- 金额逾期率-->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.amountOverdueRate}" type="number"/>
            </td>
            <!-- 逾期项目数 -->
            <td>
                    ${p2pPlatformOperationDataStatistics.overdueProjectNumber}
            </td>
            <!-- 人均累计融资金额 -->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.renjunFinancingAmount}" type="number"/>
            </td>
            <!-- 人均累计投资金额-->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.renjunInvestmentAmount}" type="number"/>
            </td>
            <!-- 笔均融资金额 -->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.bijunFinancingAmount}" type="number"/>
            </td>
            <!-- 最大单户融资余额占比 -->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.maxSingleRzyezb}" type="number"/>
            </td>
            <!-- 最大十户融资余额占比 -->
            <td>
                <fmt:formatNumber value="${p2pPlatformOperationDataStatistics.maxTenRzyezb}" type="number"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>