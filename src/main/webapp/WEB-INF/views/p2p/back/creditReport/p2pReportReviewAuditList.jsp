<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>举报复审列表</title>
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
<form:form id="searchForm" modelAttribute="p2pReportInformationAudit"
           action="${ctx}/creditReport/reportReviewAudit/p2pReportReviewAuditList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label>
            <form:input path="p2pCreditReport.userId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pCreditReport.enterpriseName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>举报类别：</label>
            <form:select path="reportCategory" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('report_category')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>举报人：</label>
            <form:input path="user.name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
            <%--
                        <li><label>所属行业：</label>
                            <form:select path="p2pCreditReport.industryCode" class="input-medium-select">
                                <form:option value="" label="全部"/>
                                <form:options items="${fns:getDictList('industry_code')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </li>
                        --%>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>企业编号</th>
        <th>企业名称</th>
        <th>所属行业</th>
        <th>举报类别</th>
        <th>举报人</th>
        <th>举报时间</th>
        <th>举报审核状态</th>
        <th>复审意见</th>
        <th>复审员</th>
        <th>复审时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <!-- p2pReportInformationAudit ria -->
    <c:forEach items="${page.list}" varStatus="status" var="ria">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count}
            </td>
            <!--企业编号-->
            <td>${ria.p2pCreditReport.userId }</td>
            <!--企业名称-->
            <td>${ria.p2pCreditReport.enterpriseName }</td>
            <!--所属行业-->
            <td>${fns:getIndustryclassiName(ria.p2pCreditReport.industryCode)}</td>
            <!--举报类别-->
            <td>${fns:getDictLabel(ria.reportCategory, 'report_category', '')}</td>
            <!--举报人-->
            <td>${ria.user.name }</td>
            <!--举报时间-->
            <td><fmt:formatDate value="${ria.reportTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <!--举报审核状态-->
            <td>${fns:getDictLabel(ria.reportAuditState, 'report_audit_state', '')}</td>
            <!--复审意见-->
            <td>${fns:getDictLabel(ria.reviewOpinion, 'pass_nopass', '')}</td>
            <!--复审员-->
            <td>${fns:getUserById(ria.reviewOfficer).name}</td>
            <!--复审时间-->
            <td><fmt:formatDate value="${ria.reviewTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <!--操作-->
            <td>
                <c:choose>
                    <c:when test="${ria.reportAuditState == 2 }">
                        <a href="${ctx }/creditReport/reportReviewAudit/p2pReportReviewAuditForm?id=${ria.id}&&type=1">复审</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${ctx }/creditReport/reportReviewAudit/p2pReportReviewAuditForm?id=${ria.id}&&type=2">查看</a>
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