<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>认证审核记录管理</title>
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
    <li class="active"><a href="${ctx}/user/p2pAuditRecord/">认证审核记录列表</a></li>
    <shiro:hasPermission name="user:p2pAuditRecord:edit">
        <li><a href="${ctx}/user/p2pAuditRecord/form">认证审核记录添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pAuditRecord" action="${ctx}/user/p2pAuditRecord/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>认证审核记录ID：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>认证类别：身份认证、企业认证：</label>
            <form:input path="auditType" htmlEscape="false" maxlength="11" class="input-medium"/>
        </li>
        <li><label>认证ID，即用户身份认证表或企业认证表ID：</label>
            <form:input path="referenceId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>审核人员ID：</label>
            <form:input path="auditPersonId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>审核时间：</label>
            <input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pAuditRecord.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>审核结论：</label>
            <form:input path="auditResult" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>审核意见：</label>
            <form:input path="auditOpinion" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>认证审核记录ID</th>
        <th>认证类别：身份认证、企业认证</th>
        <th>认证ID，即用户身份认证表或企业认证表ID</th>
        <th>审核人员ID</th>
        <th>审核时间</th>
        <th>审核结论</th>
        <th>审核意见</th>
        <shiro:hasPermission name="user:p2pAuditRecord:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pAuditRecord">
        <tr>
            <td><a href="${ctx}/user/p2pAuditRecord/form?id=${p2pAuditRecord.id}">
                    ${p2pAuditRecord.id}
            </a></td>
            <td>
                    ${p2pAuditRecord.auditType}
            </td>
            <td>
                    ${p2pAuditRecord.referenceId}
            </td>
            <td>
                    ${p2pAuditRecord.auditPersonId}
            </td>
            <td>
                <fmt:formatDate value="${p2pAuditRecord.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pAuditRecord.auditResult}
            </td>
            <td>
                    ${p2pAuditRecord.auditOpinion}
            </td>
            <shiro:hasPermission name="user:p2pAuditRecord:edit">
                <td>
                    <a href="${ctx}/user/p2pAuditRecord/form?id=${p2pAuditRecord.id}">修改</a>
                    <a href="${ctx}/user/p2pAuditRecord/delete?id=${p2pAuditRecord.id}"
                       onclick="return confirmx('确认要删除该认证审核记录吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>