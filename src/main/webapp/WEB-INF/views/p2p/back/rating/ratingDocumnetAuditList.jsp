<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>评级材料审核列表</title>
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
<form:form id="searchForm" modelAttribute="p2pRatingServiceInfo" action="${ctx}/rating/ratingDocumnetAudit"
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
        <li><label>审核状态：</label>
            <form:select path="currentStage" htmlEscape="false" maxlength="64" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:option value="202">待审核</form:option>
                <form:option value="300">审核通过</form:option>
                <form:option value="201">审核不通过</form:option>
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
        <th>评级企业名称</th>
        <th>审核状态</th>
        <th>审核操作</th>
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
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pRatingServiceInfo.applicantsId }">
                        ${p2pRatingServiceInfo.p2pEnterpriseCertify.enterpriseName }
                </a>
            </td>
            <td>
                <c:if test="${p2pRatingServiceInfo.currentStage == 201 }">审核不通过</c:if>
                <c:if test="${p2pRatingServiceInfo.currentStage == 202 }">待审核</c:if>
                <c:if test="${p2pRatingServiceInfo.currentStage == 300 }">审核通过</c:if>
            </td>
            <td>
                <c:if test="${p2pRatingServiceInfo.currentStage == 202 }">
                    <shiro:hasPermission name="material:authorization">
                        <a href="${ctx}/rating/ratingDocumnetAudit/ratingDocumentAudit?id=${p2pRatingServiceInfo.id }&paymentId=${p2pRatingServiceInfo.applicantsId }">
                            审核
                        </a>
                    </shiro:hasPermission>
                </c:if>
                <c:if test="${p2pRatingServiceInfo.currentStage != 202 }">
                    <a href="${ctx}/rating/ratingDocumnetAudit/ratingDocumentAuditView?id=${p2pRatingServiceInfo.id }">
                        查看
                    </a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog" style="width:430px;"
     aria-labelledby="myModalLabel" aria-hidden="true">
</div>
</body>
</html>