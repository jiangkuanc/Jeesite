<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户权限控制表，配置用户能访问的功能管理</title>
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
    <li class="active"><a href="${ctx}/user/p2pUserResource/">用户权限控制表，配置用户能访问的功能列表</a></li>
    <shiro:hasPermission name="user:p2pUserResource:edit">
        <li><a href="${ctx}/user/p2pUserResource/form">用户权限控制表，配置用户能访问的功能添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pUserResource" action="${ctx}/user/p2pUserResource/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>id：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>注册用户ID：</label>
            <sys:treeselect id="user" name="user.id" value="${p2pUserResource.user.id}" labelName="user.name"
                            labelValue="${p2pUserResource.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true"
                            notAllowSelectParent="true"/>
        </li>
        <li><label>用户类别：1-投资者、2-融资者，可同时存在：</label>
            <form:input path="userType" htmlEscape="false" maxlength="11" class="input-medium"/>
        </li>
        <li><label>资源名称，即模块名称，通过Static变量控制：</label>
            <form:input path="resourceName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>资源描述：</label>
            <form:input path="resourceExplain" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>id</th>
        <th>注册用户ID</th>
        <th>用户类别：1-投资者、2-融资者，可同时存在</th>
        <th>资源名称，即模块名称，通过Static变量控制</th>
        <th>资源描述</th>
        <shiro:hasPermission name="user:p2pUserResource:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pUserResource">
        <tr>
            <td><a href="${ctx}/user/p2pUserResource/form?id=${p2pUserResource.id}">
                    ${p2pUserResource.id}
            </a></td>
            <td>
                    ${p2pUserResource.user.name}
            </td>
            <td>
                    ${p2pUserResource.userType}
            </td>
            <td>
                    ${p2pUserResource.resourceName}
            </td>
            <td>
                    ${p2pUserResource.resourceExplain}
            </td>
            <shiro:hasPermission name="user:p2pUserResource:edit">
                <td>
                    <a href="${ctx}/user/p2pUserResource/form?id=${p2pUserResource.id}">修改</a>
                    <a href="${ctx}/user/p2pUserResource/delete?id=${p2pUserResource.id}"
                       onclick="return confirmx('确认要删除该用户权限控制表，配置用户能访问的功能吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>