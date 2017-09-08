<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>评级企业列表</title>
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
        function publish(id, isFinalized) {
            if (isFinalized == 1) {
                swal({
                    title: "是否确认发布评级报告",
                    showCancelButton: true,
                    type: "info",
                }, function (inputValue) {
                    if (inputValue === false) {
                        return false;
                    }
                    window.location.href = "${ctx}/rating/ratingReportPublish/publish?id=" + id
                    <%--        	 location.href="${ctx}/rating/ratingReportPublish/publish?id="+id--%>
                });
            } else {
                swal("评级结果未定稿,无法发布债项!");
            }


        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="p2pRatingServiceInfo" action="${ctx}/rating/ratingReportPublish"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>评级项目编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>评级企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>评级状态：</label>
            <form:select path="currentStage" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <c:forEach items="${fns:getDictList('current_stage')}" var="currentStage">
                    <c:if test="${currentStage.value >= 700 && currentStage.value <= 901}">
                        <form:option value="${currentStage.value }">${currentStage.label }</form:option>
                    </c:if>
                </c:forEach>
            </form:select>
        </li>
        <li><label>主体信用等级：</label>
            <form:select path="p2pFinancingRatingInfo.mainCreditGrade" htmlEscape="false" maxlength="64"
                         class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:options items="${fns:getDictList('rating_level')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
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
        <th>评级项目编号</th>
        <th>评级项目名称</th>
        <th>评级申请时间</th>
        <th>评级企业名称</th>
        <th>正式版评级报告</th>
        <th>主体信用等级</th>
        <th>评级展望</th>
        <th>评级状态</th>
        <th>评级报告发布时间</th>
        <th>报告发布人</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pRatingServiceInfo">
        <tr>
            <td>${status.count }</td>
            <td>${p2pRatingServiceInfo.id }</td>
            <td>
                <a href="${ctx}/rating/ratingEnterprise/ratingDetails?id=${p2pRatingServiceInfo.id }">
                        ${p2pRatingServiceInfo.ratingName }
                </a>
            </td>
            <td><fmt:formatDate value="${p2pRatingServiceInfo.applyTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pRatingServiceInfo.applicantsId }">
                        ${p2pRatingServiceInfo.p2pEnterpriseCertify.enterpriseName }
                </a>
            </td>
            <td><shiro:hasPermission name="report:download">
                <a href="${ctx}/financing/download2?id=${p2pRatingServiceInfo.p2pFinancingRatingInfo.id}&type=2">
                        ${p2pRatingServiceInfo.p2pFinancingRatingInfo.creditReportName }
                </a></shiro:hasPermission>
            </td>
            <td>${p2pRatingServiceInfo.p2pFinancingRatingInfo.mainCreditGrade }</td>
            <td>${fns:getDictLabel(p2pRatingServiceInfo.p2pFinancingRatingInfo.rateExpectation, 'rating_expection', '') }</td>
            <td>${fns:getDictLabel(p2pRatingServiceInfo.currentStage, 'current_stage', '') }</td>
            <td>
                <fmt:formatDate value="${p2pRatingServiceInfo.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${fns:getUserById(p2pRatingServiceInfo.publishId).name }
            </td>
            <td>
                <c:if test="${p2pRatingServiceInfo.currentStage == 700}">
                    <shiro:hasPermission name="report:release">
                        <a onclick="publish('${p2pRatingServiceInfo.id}','${p2pRatingServiceInfo.p2pFinancingRatingInfo.isFinalized }')">发布</a>
                    </shiro:hasPermission>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>