<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>产品详情管理</title>
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
    <li class="active"><a href="${ctx}/cms/cmsReport/">产品报告信息列表</a></li>
    <shiro:hasPermission name="cms:cmsReport:edit">
        <li><a href="${ctx}/cms/cmsReport/selectProjectList">产品报告信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="cmsReport" action="${ctx}/cms/cmsReport/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>信息产品名称：</label>
            <form:input path="productName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>信息产品名称</th>
        <th>信息产品简介</th>
        <th>电话</th>
        <th>传真</th>
        <th>邮箱</th>
        <shiro:hasPermission name="cms:cmsReport:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsReport">
        <tr>
            <td><a href="${ctx}/cms/cmsReport/form?id=${cmsReport.id}">
                    ${cmsReport.productName}
            </a></td>
            <td>
                    ${fns:abbr(cmsReport.productContent,100)}
            </td>
            <td>
                    ${cmsReport.phone}
            </td>
            <td>
                    ${cmsReport.fax}
            </td>
            <td>
                    ${cmsReport.mailbox}
            </td>
            <shiro:hasPermission name="cms:cmsReport:edit">
                <td>
                    <a href="${ctx}/cms/cmsReport/form?id=${cmsReport.id}">修改</a>
                    <a href="${ctx}/cms/cmsReport/delete?id=${cmsReport.id}"
                       onclick="return confirmx('确认要删除该产品详情吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>