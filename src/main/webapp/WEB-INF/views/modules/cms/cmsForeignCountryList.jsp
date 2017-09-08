<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>国外信息管理</title>
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
    <li class="active"><a href="${ctx}/cms/cmsForeignCountry/list">国外信息列表</a></li>
    <shiro:hasPermission name="foe:cmsForeignCountry:edit">
        <li><a href="${ctx}/cms/cmsForeignCountry/form">国外信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="cmsForeignCountry" action="${ctx}/cms/cmsForeignCountry/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>国家名称：</label>
            <form:input path="cmsCountryName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>国家名称</th>
        <th>国家基本情况</th>
        <th>国家地理位置</th>
        <th>国家人口</th>
        <th>国家民族</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsForeignCountry">
        <tr>
            <td><a href="${ctx}/cms/cmsForeignCountry/form?id=${cmsForeignCountry.id}">
                    ${cmsForeignCountry.cmsCountryName}
            </a></td>
            <td>
                    ${fns:abbr(cmsForeignCountry.cmsCountryBasic,100)}
            </td>
            <td>
                    ${fns:abbr(cmsForeignCountry.cmsCountryPosition,100)}
            </td>
            <td>
                    ${fns:abbr(cmsForeignCountry.cmsCountryPopulation,100)}
            </td>
            <td>
                    ${fns:abbr(cmsForeignCountry.cmsCountryNation,100)}
            </td>
            <td>
                <a href="${ctx}/cms/cmsForeignCountry/form?id=${cmsForeignCountry.id}">修改</a>
                <a href="${ctx}/cms/cmsForeignCountry/delete?id=${cmsForeignCountry.id}"
                   onclick="return confirmx('确认要删除该国外信息吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>