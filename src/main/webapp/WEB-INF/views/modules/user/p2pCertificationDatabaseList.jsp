<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>个人身份认证数据库管理</title>
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
    <li class="active"><a href="${ctx}/user/p2pCertificationDatabase/">个人身份认证数据库列表</a></li>
    <shiro:hasPermission name="user:p2pCertificationDatabase:edit">
        <li><a href="${ctx}/user/p2pCertificationDatabase/form">个人身份认证数据库添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pCertificationDatabase" action="${ctx}/user/p2pCertificationDatabase/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>个人身份认证数据ID：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>真实姓名：</label>
            <form:input path="realName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>身份证号：</label>
            <form:input path="idNumber" htmlEscape="false" maxlength="18" class="input-medium"/>
        </li>
        <li><label>更新时间：</label>
            <input name="updatetime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pCertificationDatabase.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>个人身份认证数据ID</th>
        <th>真实姓名</th>
        <th>身份证号</th>
        <th>更新时间</th>
        <shiro:hasPermission name="user:p2pCertificationDatabase:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pCertificationDatabase">
        <tr>
            <td><a href="${ctx}/user/p2pCertificationDatabase/form?id=${p2pCertificationDatabase.id}">
                    ${p2pCertificationDatabase.id}
            </a></td>
            <td>
                    ${p2pCertificationDatabase.realName}
            </td>
            <td>
                    ${p2pCertificationDatabase.idNumber}
            </td>
            <td>
                <fmt:formatDate value="${p2pCertificationDatabase.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <shiro:hasPermission name="user:p2pCertificationDatabase:edit">
                <td>
                    <a href="${ctx}/user/p2pCertificationDatabase/form?id=${p2pCertificationDatabase.id}">修改</a>
                    <a href="${ctx}/user/p2pCertificationDatabase/delete?id=${p2pCertificationDatabase.id}"
                       onclick="return confirmx('确认要删除该个人身份认证数据库吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>