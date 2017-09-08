<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级材料上传管理</title>
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
    <li class="active"><a href="${ctx}/document/p2pRateDocumentUpload/">评级材料上传列表</a></li>
    <shiro:hasPermission name="document:p2pRateDocumentUpload:edit">
        <li><a href="${ctx}/document/p2pRateDocumentUpload/form">评级材料上传添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pRateDocumentUpload" action="${ctx}/document/p2pRateDocumentUpload/"
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
        <th>userid</th>
        <th>评级材料模板表id</th>
        <th>文件原名</th>
        <th>上传后地址</th>
        <th>上传时间</th>
        <th>是否驳回</th>
        <th>驳回原因</th>
        <th>更新时间</th>
        <th>备注信息</th>
        <shiro:hasPermission name="document:p2pRateDocumentUpload:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pRateDocumentUpload">
        <tr>
            <td><a href="${ctx}/document/p2pRateDocumentUpload/form?id=${p2pRateDocumentUpload.id}">
                    ${p2pRateDocumentUpload.id}
            </a></td>
            <td>
                    ${p2pRateDocumentUpload.userid}
            </td>
            <td>
                    ${p2pRateDocumentUpload.rateDocumentId}
            </td>
            <td>
                    ${p2pRateDocumentUpload.name}
            </td>
            <td>
                    ${p2pRateDocumentUpload.address}
            </td>
            <td>
                <fmt:formatDate value="${p2pRateDocumentUpload.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pRateDocumentUpload.isReject}
            </td>
            <td>
                    ${p2pRateDocumentUpload.reason}
            </td>
            <td>
                <fmt:formatDate value="${p2pRateDocumentUpload.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${p2pRateDocumentUpload.remarks}
            </td>
            <shiro:hasPermission name="document:p2pRateDocumentUpload:edit">
                <td>
                    <a href="${ctx}/document/p2pRateDocumentUpload/form?id=${p2pRateDocumentUpload.id}">修改</a>
                    <a href="${ctx}/document/p2pRateDocumentUpload/delete?id=${p2pRateDocumentUpload.id}"
                       onclick="return confirmx('确认要删除该评级材料上传吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>