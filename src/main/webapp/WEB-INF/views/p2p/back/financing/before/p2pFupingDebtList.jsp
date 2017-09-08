<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>复评</title>
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
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/before/fuping/fupingDebtList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>申请编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>借贷产品名称：</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品状态：</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option value=" ">全部</form:option>
                <c:forEach items="${fns:getDictList('progress_stage')}" var="list">
                    <c:if test="${list.value >= 220 }">
                        <form:option value="${list.value }">${list.label }</form:option>
                    </c:if>
                </c:forEach>
            </form:select>
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
        <!-- <th>企业编号</th> -->
        <th>申请编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>借贷产品状态</th>
        <th>意见类型</th>
        <th>意见说明</th>
        <th>意见反馈时间</th>
        <th>复评审核状态</th>
        <%--			<th>复评审核意见</th>--%>
        <th>复评审核时间</th>

    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">

        <tr style="text-align: left;">
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!--融资申请编号-->
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <!--融资企业名称-->
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        <%--					<a href="${ctx}/user/p2pEnterpriseCertify/detailsTwo?id=${p2pFinancingInformation.id}&id2=${p2pFinancingInformation.p2pEnterpriseCertify.id}">--%>
                        ${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}
                </a>
            </td>
            <!-- 申请债项名称 -->
            <td>
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${p2pFinancingInformation.finacingName}
                </a>
            </td>
            <!-- 债项状态 -->
            <td>${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
            <!--意见类型-->
            <td>${fns:getDictLabel(p2pFinancingInformation.p2pRatingResultView.viewType, 'view_type', '')}</td>
            <!--意见说明-->
            <td>${p2pFinancingInformation.p2pRatingResultView.viewExplain }</td>
            <!--意见反馈时间-->
            <td><fmt:formatDate value="${p2pFinancingInformation.p2pRatingResultView.viewTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <!--复评审核状态-->
            <td>${fns:getDictLabel(p2pFinancingInformation.p2pRatingResultView.auditState, 'process_statu', '')}</td>
                <%--				<!--复评审核意见-->--%>
                <%--				<td>${p2pFinancingInformation.p2pRatingResultView.auditReason}</td>--%>
            <!--复评审核时间-->
            <td><fmt:formatDate value="${p2pFinancingInformation.p2pRatingResultView.auditTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/></td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

</body>
</html>