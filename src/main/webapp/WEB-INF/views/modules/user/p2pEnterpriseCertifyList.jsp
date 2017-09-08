<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业认证</title>
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
    <li class="active"><a
            href="${ctx}/user/p2pEnterpriseCertify/list">企业</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pEnterpriseCertify"
           action="${ctx}/user/p2pEnterpriseCertify/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label> <form:input
                path="user.id" htmlEscape="false" maxlength="64"
                class="input-medium"/>
        </li>
        <li><label>企业名称：</label> <form:input path="enterpriseName"
                                             htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业身份：</label>
            <form:select path="user.role.name" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:option value="投资用户">投资用户</form:option>
                <form:option value="融资用户">融资用户</form:option>
            </form:select>
        </li>
        <li><label>代理人姓名：</label> <form:input path="user.p2pRegUserCertify.realName"
                                              htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>代理人身份认证状态：</label>
            <form:select path="user.p2pRegUserCertify.auditState" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('audit_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>企业认证状态：</label>
            <form:select path="auditState" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('audit_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>

        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable"
       class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>企业编号</th>
        <th>企业名称</th>
        <th>单位类型</th>
        <th>证件类型</th>
        <th>企业代理人姓名</th>
        <th>企业身份</th>
        <th>代理人身份认证状态</th>
        <th>企业认证状态</th>
        <%--<th>是否拉入黑名单</th>
    --%></tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status"
               var="p2pEnterpriseCertify">
        <tr>
            <td>${status.count }</td>
            <td>${p2pEnterpriseCertify.user.id}</td>
            <td><a
                    href="${ctx}/user/p2pEnterpriseCertify/details?id=${p2pEnterpriseCertify.id}">
                    ${p2pEnterpriseCertify.enterpriseName} </a>
            </td>
            <td>${fns:getDictLabel(p2pEnterpriseCertify.unitType,'unit_type','')}</td>
            <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateType,'certificate_type','')}</td>
            <td>${p2pEnterpriseCertify.user.p2pRegUserCertify.realName}</td>
            <td>${p2pEnterpriseCertify.user.role.name}</td>
            <td><a href="${ctx}/user/p2pEnterpriseCertify/userAuditView?user=${p2pEnterpriseCertify.user}">
                    ${fns:getDictLabel(p2pEnterpriseCertify.user.p2pRegUserCertify.auditState,
                            'audit_state', '')} </a>
            </td>
            <td><a
                    href="${ctx}/user/p2pEnterpriseCertify/auditView?id=${p2pEnterpriseCertify.id}">
                    ${fns:getDictLabel(p2pEnterpriseCertify.auditState,
                            'audit_state', '')}
            </a>
            </td>
                <%--<td>——</td>
            --%></tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>