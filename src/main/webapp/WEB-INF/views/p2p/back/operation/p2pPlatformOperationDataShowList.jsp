<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
平台运营数据披露表
@author Zeus
@version 2016-11-25
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>平台运营数据披露</title>
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
<%--<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/operation/p2pPlatformOperationDataShow/">平台运营数据披露表</a></li>
    <li><a href="${ctx}/operation/p2pPlatformOperationDataShow/form">平台运营数据披露表添加</a></li>
    </ul>
--%>
<%--<form:form id="searchForm" modelAttribute="p2pPlatformOperationDataShow" action="${ctx}/operation/p2pPlatformOperationDataShow/" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>日期：</label>
            <input name="historyDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                value="<fmt:formatDate value="${p2pPlatformOperationDataShow.historyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
--%>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>编号</th>
        <th>日期</th>
        <th>交易总额（元）</th>
        <th>交易总笔数（笔）</th>
        <th>融资人总数（人）</th>
        <th>投资人总数（人）</th>
        <th>代偿金额（元）</th>
        <th>逾期金额（元）</th>
        <th>总项目个数（个）</th>
        <th>项目逾期率</th>
        <th>金额逾期率</th>
        <th>逾期项目数（个）</th>
        <th>人均累计融资金额（元）</th>
        <th>人均累计投资金额（元）</th>
        <th>笔均融资金额（元）</th>
        <th>最大单户融资余额（元）</th>
        <th>最大十户融资余额（元）</th>
        <th>最大单户融资余额占比</th>
        <th>最大十户融资余额占比</th>
        <th>投资收益（元）</th>
        <th>历史年化收益率</th>
        <th>外网注册总人数（人）</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody class="listtable">
    <c:forEach items="${page.list}" var="p2pPlatformOperationDataShow" varStatus="status">
        <tr>
            <td>
                    ${status.count }
                <!-- ${p2pPlatformOperationDataShow.id} -->
            </td>
            <td>
                <a href="${ctx}/operation/p2pPlatformOperationDataShow/form?id=${p2pPlatformOperationDataShow.id}">
                    <fmt:formatDate value="${p2pPlatformOperationDataShow.historyDate}" pattern="yyyy-MM-dd"/>
                </a>
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.tradeTotalAmount}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.tradeTotalNumber}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.financingTotalPeople}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.investmentTotalPeople}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.compensatoryAmount}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.overdueAmount}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.projectTotalNumber}
            </td>
            <td>
                <fmt:formatNumber
                        pattern="#0.00">${p2pPlatformOperationDataShow.projectOverdueRate*100}</fmt:formatNumber>%
            </td>
            <td>
                <fmt:formatNumber
                        pattern="#0.00">${p2pPlatformOperationDataShow.amountOverdueRate*100}</fmt:formatNumber>%
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.overdueProjectNumber}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.renjunFinancingAmount}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.renjunInvestmentAmount}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.bijunFinancingAmount}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.maxSingleRzye}
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.maxTenRzye}
            </td>
            <td>
                <fmt:formatNumber pattern="#0.00">${p2pPlatformOperationDataShow.maxSingleRzyezb*100}</fmt:formatNumber>%
            </td>
            <td>
                <fmt:formatNumber pattern="#0.00">${p2pPlatformOperationDataShow.maxTenRzyezb*100}</fmt:formatNumber>%
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.financingEarn}
            </td>
            <td>
                <fmt:formatNumber
                        pattern="#0.00">${p2pPlatformOperationDataShow.historicalAnnualYield*100}</fmt:formatNumber>%
            </td>
            <td>
                    ${p2pPlatformOperationDataShow.registerCount}
            </td>
            <td>
                <a href="${ctx}/operation/p2pPlatformOperationDataShow/form?id=${p2pPlatformOperationDataShow.id}">修改</a>
                    <%--<a href="${ctx}/operation/p2pPlatformOperationDataShow/delete?id=${p2pPlatformOperationDataShow.id}" onclick="return confirmx('确认要删除该平台运营数据披露表吗？', this.href)">删除</a>--%>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--<div class="pagination">${page}</div>--%>
</body>
</html>