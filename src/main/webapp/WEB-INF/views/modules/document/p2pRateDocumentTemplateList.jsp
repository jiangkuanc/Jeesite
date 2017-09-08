<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级材料模板管理</title>
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
    <li class="active"><a href="${ctx}/document/p2pRateDocumentTemplate/">评级材料模板列表</a></li>
    <shiro:hasPermission name="document:p2pRateDocumentTemplate:edit">
        <li><a href="${ctx}/document/p2pRateDocumentTemplate/form">评级材料模板添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pRateDocumentTemplate" action="${ctx}/document/p2pRateDocumentTemplate/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>ID</th>
        <th>材料类型</th>
        <th>名称</th>
        <th>是否必填</th>
        <shiro:hasPermission name="document:p2pRateDocumentTemplate:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pRateDocumentTemplate">
        <tr>
            <td><a href="${ctx}/document/p2pRateDocumentTemplate/form?id=${p2pRateDocumentTemplate.id}">
                    ${p2pRateDocumentTemplate.id}
            </a></td>
            <td>
                    ${p2pRateDocumentTemplate.type}
            </td>
            <td>
                    ${p2pRateDocumentTemplate.name}
            </td>
            <td>
                    ${p2pRateDocumentTemplate.isRequired}
            </td>
            <shiro:hasPermission name="document:p2pRateDocumentTemplate:edit">
                <td>
                    <a href="${ctx}/document/p2pRateDocumentTemplate/form?id=${p2pRateDocumentTemplate.id}">修改</a>
                    <a href="${ctx}/document/p2pRateDocumentTemplate/delete?id=${p2pRateDocumentTemplate.id}"
                       onclick="return confirmx('确认要删除该评级材料模板吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>