<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>撮合前债项状态进展表管理</title>
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
    <li class="active"><a href="${ctx}/financing/p2pBeforeMatchDebtState/">撮合前债项状态进展表列表</a></li>
    <shiro:hasPermission name="financing:p2pBeforeMatchDebtState:edit">
        <li><a href="${ctx}/financing/p2pBeforeMatchDebtState/form">撮合前债项状态进展表添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pBeforeMatchDebtState" action="${ctx}/financing/p2pBeforeMatchDebtState/"
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
        <th>更新时间</th>
        <th>备注信息</th>
        <shiro:hasPermission name="financing:p2pBeforeMatchDebtState:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pBeforeMatchDebtState">
        <tr>
            <td><a href="${ctx}/financing/p2pBeforeMatchDebtState/form?id=${p2pBeforeMatchDebtState.id}">
                <fmt:formatDate value="${p2pBeforeMatchDebtState.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </a></td>
            <td>
                    ${p2pBeforeMatchDebtState.remarks}
            </td>
            <shiro:hasPermission name="financing:p2pBeforeMatchDebtState:edit">
                <td>
                    <a href="${ctx}/financing/p2pBeforeMatchDebtState/form?id=${p2pBeforeMatchDebtState.id}">修改</a>
                    <a href="${ctx}/financing/p2pBeforeMatchDebtState/delete?id=${p2pBeforeMatchDebtState.id}"
                       onclick="return confirmx('确认要删除该撮合前债项状态进展表吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>