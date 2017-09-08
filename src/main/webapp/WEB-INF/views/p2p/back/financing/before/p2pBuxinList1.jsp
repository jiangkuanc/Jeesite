<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>增信</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert('${page.list}[0]');
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
    <li class="active"><a href="${ctx}/before/buxin/buxinList1">抵质押增信借贷产品列表</a></li>
    <li><a href="${ctx}/before/buxin/buxinList2">担保增信借贷产品列表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/before/buxin/buxinList1"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>借贷产品编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>借贷产品名称：</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>评估公司名称：</label>
            <form:input path="p2pAssetValuation.name" htmlEscape="false" maxlength="64" class="input-medium"/>
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
        <th>借贷产品编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>借贷产品级别</th>
        <th>标的类型</th>
        <th>增信额度（元）</th>
        <th>评估公司名称</th>
        <th>评估审核状态</th>
        <th>资产评估操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p">
        <tr>
            <!--序号-->
            <td>${status.count }</td>
            <!--申请编号-->
            <td>${p.id }</td>
            <!--企业名称-->
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p.applicantsId}">
                        <%--						<a href="${ctx}/user/p2pEnterpriseCertify/detailsTwo?id=${p.id}&id2=${p.p2pEnterpriseCertify.id}">--%>
                        ${p.p2pEnterpriseCertify.enterpriseName }
                </a>
            </td>
            <!--债项名称-->
            <td>
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p.id}">
                        ${p.finacingName }
                </a>
            </td>
            <!--债项级别-->
            <td>${p.p2pFinancingRatingInfo.ratingLevel }</td>
            <!--标的类型-->
            <td>${fns:getDictLabel(p.markType, 'mark_type', '')}</td>
            <!--增信额度-->
            <td>
                <fmt:formatNumber pattern="#,##0.00">${p.p2pFinancingRatingInfo.repCount }</fmt:formatNumber>
            </td>
            <!--评估公司名称-->
            <td>
                <a href="${ctx}/user/userList/assetBaseInfo?userid=${p.p2pAssetValuation.userId}">
                        ${p.p2pAssetValuation.name }
                </a>
            </td>
            <!--评估审核状态-->
            <td>${fns:getDictLabel(p.p2pAssetValuationRecord.isReject, 'buxin_state', '')}</td>
            <!--资产评估操作-->
            <td>
                <c:choose>
                    <c:when test="${p.p2pAssetValuationRecord.isReject == 0 }">
                        <shiro:hasPermission name="credit:audit">
                            <a href="${ctx}/before/buxin/assetValuation?fiId=${p.id}">审核</a>
                        </shiro:hasPermission>
                    </c:when>
                    <c:otherwise>
                        <shiro:hasPermission name="credit:check">
                            <a href="${ctx}/before/buxin/assetValuation?fiId=${p.id}">
                                查看
                            </a>
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