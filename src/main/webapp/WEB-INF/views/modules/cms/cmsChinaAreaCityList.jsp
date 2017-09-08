<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>cmsca管理</title>
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
<form:form id="searchForm" modelAttribute="cmsChinaAreaCity" action="${ctx}/cmsca/cmsChinaAreaCity/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>省市名称</label>
            <form:input path="cmsChinaAreaCityName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>省份名称</th>
        <th>基本介绍</th>
        <th>地理位置</th>
        <th>人口</th>
        <th>民族</th>
        <!-- <td>图片</td> -->
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsChinaAreaCity">
        <tr>
            <td>
                    ${cmsChinaAreaCity.cmsChinaAreaCityName}
            </td>
            <td>
                    ${fns:abbr(cmsChinaAreaCity.cmsChinaAreaCityBasic,100)}
            </td>
            <td>
                    ${fns:abbr(cmsChinaAreaCity.cmsChinaAreaCityPosition,100)}
            </td>
            <td>
                    ${fns:abbr(cmsChinaAreaCity.cmsChinaAreaCityPopulation,100)}
            </td>
            <td>
                    ${fns:abbr(cmsChinaAreaCity.cmsChinaAreaCityNation,100)}
            </td>
                <%-- <td>
                    <form:textarea id="content" htmlEscape="true" path="content" rows="4" maxlength="200" class="input-xxlarge"/>
                     <sys:ckeditor replace="content" uploadPath="/cms/area"/>
                </td> --%>

            <td>
                <a href="${ctx}/cmsca/cmsChinaAreaCity/form?id=${cmsChinaAreaCity.id}">修改</a>
                <a href="${ctx}/cmsca/cmsChinaAreaCity/delete?id=${cmsChinaAreaCity.id}"
                   onclick="return confirmx('确认要删除该国内信息吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>