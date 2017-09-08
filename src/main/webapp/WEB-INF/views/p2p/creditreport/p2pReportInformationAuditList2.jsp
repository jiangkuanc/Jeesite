<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
举报信息审核表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>举报信息审核表管理</title>
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
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/p2p/creditreport/p2pReportInformationAudit/">举报信息审核表列表</a></li>

</ul>
<form:form id="searchForm" modelAttribute="p2pReportInformationAudit"
           action="${ctx}/p2p/creditreport/p2pReportInformationAudit/" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>举报人编号</th>
        <th>信用报告编号</th>
        <th>信用信息类型</th>
        <th>指标编号</th>
        <th>举报类别</th>
        <th>举报内容</th>
        <th>复审意见</th>
        <th>复审员</th>
        <th>复审说明</th>
        <th>复审时间</th>
        <th>举报审核状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pReportInformationAudit">
        <tr style="text-align: left;">
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                    ${p2pReportInformationAudit.user.id}
            </td>
            <td>
                    ${p2pReportInformationAudit.creditReportId}
            </td>
            <td>
                    ${p2pReportInformationAudit.creditInfoType}
            </td>
            <td>
                    ${p2pReportInformationAudit.indexId}
            </td>
            <td>
                    ${p2pReportInformationAudit.reportCategory}
            </td>
            <td>
                    ${p2pReportInformationAudit.reportContent}
            </td>
            <td>
                    ${p2pReportInformationAudit.review_opinion}
            </td>
            <td>
                    ${p2pReportInformationAudit.review_officer}
            </td>
            <td>
                    ${p2pReportInformationAudit.review_explain}
            </td>
            <td>
                    ${p2pReportInformationAudit.review_time}
            </td>
            <td>
                    ${p2pReportInformationAudit.reportAuditState}
            </td>


        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>