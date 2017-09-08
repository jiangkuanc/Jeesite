<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>账户策略管理管理</title>
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
    <li class="active"><a href="${ctx}/sys/accountStrategic/">账户策略管理列表</a></li>
    <shiro:hasPermission name="sys:accountStrategic:edit">
        <li><a href="${ctx}/sys/accountStrategic/form">账户策略管理添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="accountStrategic" action="${ctx}/sys/accountStrategic/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>密码最小长度：</label>
            <form:input path="pwdLength" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>密码加密方式：</label>
            <form:select path="pwdEncryMode" class="input-medium">
                <form:option value="" label=""/>
                <form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>密码最短使用期限：</label>
            <form:input path="pwdMinimumAge" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>密码最长使用期限：</label>
            <form:input path="pwdMaximumAge" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>密码最小长度</th>
        <th>密码加密方式</th>
        <th>密码最短使用期限</th>
        <th>密码最长使用期限</th>
        <th>密码强度</th>
        <th>创建时间</th>
        <th>更新时间</th>
        <th>备注信息</th>
        <shiro:hasPermission name="sys:accountStrategic:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="accountStrategic">
        <tr>
            <td><a href="${ctx}/sys/accountStrategic/form?id=${accountStrategic.id}">
                    ${accountStrategic.pwdLength}
            </a></td>
            <td>
                    ${fns:getDictLabel(accountStrategic.pwdEncryMode, '', '')}
            </td>
            <td>
                    ${accountStrategic.pwdMinimumAge}
            </td>
            <td>
                    ${accountStrategic.pwdMaximumAge}
            </td>
            <td>
                    ${fns:getDictLabel(accountStrategic.pwdStrength, '', '')}
            </td>
            <td>
                <fmt:formatDate value="${accountStrategic.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <fmt:formatDate value="${accountStrategic.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${accountStrategic.remarks}
            </td>
            <shiro:hasPermission name="sys:accountStrategic:edit">
                <td>
                    <a href="${ctx}/sys/accountStrategic/form?id=${accountStrategic.id}">修改</a>
                    <a href="${ctx}/sys/accountStrategic/delete?id=${accountStrategic.id}"
                       onclick="return confirmx('确认要删除该账户策略管理吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>