<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>项目信息详情管理</title>
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
    <li class="active"><a href="${ctx}/cms/cmsProjectDetils/">项目信息详情列表</a></li>
    <shiro:hasPermission name="cms:cmsProjectDetils:edit">
        <li><a href="${ctx}/cms/cmsProjectDetils/selectProjectList">项目信息详情添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="cmsProjectDetils" action="${ctx}/cms/cmsProjectDetils/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>项目名称：</label>
            <form:input path="projectName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>

        <li><label>所属行业：</label>
            <form:input path="industryInvolved" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>项目名称</th>
        <th>投资方式</th>
        <th>所属行业</th>
        <th>项目有效期</th>
        <th>项目所在地</th>
        <th>项目简介</th>
        <th>合作机会</th>
        <shiro:hasPermission name="cms:cmsProjectDetils:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsProjectDetils">
        <tr>
            <td><a href="${ctx}/cms/cmsProjectDetils/form?id=${cmsProjectDetils.id}">
                    ${cmsProjectDetils.projectName}
            </a></td>
            <td>
                    ${cmsProjectDetils.investmentWay}
            </td>
            <td>
                    ${cmsProjectDetils.industryInvolved}
            </td>
            <td>
                    ${cmsProjectDetils.projectValidity}
            </td>
            <td>
                    ${cmsProjectDetils.projectLocated}
            </td>
            <td>
                    ${fns:abbr(cmsProjectDetils.projectEnterprise,100)}
            </td>
            <td>
                    ${fns:abbr(cmsProjectDetils.cooperationOpportunities,100)}
            </td>


            <shiro:hasPermission name="cms:cmsProjectDetils:edit">
                <td>
                    <a href="${ctx}/cms/cmsProjectDetils/form?id=${cmsProjectDetils.id}">修改</a>
                    <a href="${ctx}/cms/cmsProjectDetils/delete?id=${cmsProjectDetils.id}"
                       onclick="return confirmx('确认要删除该项目信息详情吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>