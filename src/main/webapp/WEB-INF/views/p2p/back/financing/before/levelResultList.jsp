<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级结果查询列表列表</title>
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
<%-- <ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/financing/p2pFinancingInformation/">融资信息表列表</a></li>
</ul> --%>
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/financing/findLevelResult"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li>
            <label>融资申请编号</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品名称</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品评级级别：</label>
            <form:select path="p2pFinancingRatingInfo.ratingLevel" htmlEscape="false" maxlength="64"
                         class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:options items="${fns:getDictList('rating_level')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>融资企业名称</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>借贷产品状态</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option value=" ">全部</form:option>
                <c:forEach items="${fns:getDictList('progress_stage')}" varStatus="status" var="a">
                    <c:if test="${a.value >=225 }">
                        <form:option value="${a.value }">${a.label }</form:option>
                    </c:if>
                </c:forEach>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>融资申请编号</th>
        <th>融资企业名称</th>
        <th>借贷产品名称</th>
        <th>申请融资额度(元)</th>
        <th>评级报告</th>
        <th>借款额度(元)</th>
        <th>借贷产品主体信用等级</th>
        <th>评级展望</th>
        <th>借贷产品评级级别</th>
        <th>借贷产品评级利率</th>
        <th>产品类别</th>
        <th>用户异议查看</th>
        <th>借贷产品状态</th>
        <th>评级报告操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">

        <tr style="text-align:left;">
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!-- 债项编号 -->
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <td title="${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        ${fns:abbr(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName,15)}
                </a>
            </td>
            <td title="${p2pFinancingInformation.finacingName}">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${fns:abbr(p2pFinancingInformation.finacingName,15)}
                </a>
            </td>
            <td>
                <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
            </td>
            <td>
                <c:if test="${not empty p2pFinancingInformation.p2pFinancingRatingInfo.commitReport}">
                    <shiro:hasPermission name="simple:version"><a
                            href="${ctx}/financing/download2?id=${p2pFinancingInformation.p2pFinancingRatingInfo.id}&type=1">简版</a></shiro:hasPermission>
                </c:if>
                <c:if test="${not empty p2pFinancingInformation.p2pFinancingRatingInfo.creditReport}">
                    <shiro:hasPermission name="non:version"><a
                            href="${ctx}/financing/download2?id=${p2pFinancingInformation.p2pFinancingRatingInfo.id}&type=2">完整版</a></shiro:hasPermission>
                </c:if>
            </td>
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>
                </c:if>
            </td>
            <td>
                    ${p2pFinancingInformation.p2pFinancingRatingInfo.mainCreditGrade}
            </td>
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.rateExpectation,'rating_expection','')}
            </td>
            <td>
                    ${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}
            </td>
            <td>
                <c:if test="${!empty p2pFinancingInformation.recommendedRate }">
                    <fmt:formatNumber pattern="#0.00">${p2pFinancingInformation.recommendedRate*100}</fmt:formatNumber>%
                </c:if>
            </td>
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.markType,'mark_type', '')}
            </td>
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.p2pRatingResultView.viewType,'view_type', '')}
            </td>
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.currentStage,'progress_stage', '')}
            </td>
            <td>
                <c:choose>
                    <c:when test="${p2pFinancingInformation.currentStage == 225}">
                        <shiro:hasPermission name="release:results">
                            <a href="${ctx}/financing/toRecordPublicPage?id=${p2pFinancingInformation.id}">报告发布</a>
                        </shiro:hasPermission>
                    </c:when>
                    <c:otherwise>
                        <shiro:hasPermission name="results:view">
                            <a href="${ctx}/financing/toRecordPublicPage?id=${p2pFinancingInformation.id}">查看</a>
                        </shiro:hasPermission>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

</body>
</html>