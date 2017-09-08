<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>产品需求信息管理</title>
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
    <li class="active"><a href="${ctx}/cms/cmsRequirementInformation/">产品需求信息列表</a></li>
    <shiro:hasPermission name="cms:cmsRequirementInformation:edit">
        <li><a href="${ctx}/cms/cmsRequirementInformation/form">产品需求信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="cmsRequirementInformation" action="${ctx}/cms/cmsRequirementInformation/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>产品名称：</label>
            <form:input path="productName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>

        <li><label>需求企业：</label>
            <form:input path="demandEnterprise" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th width="34%">产品名称</th>
        <th width="30%">需求企业</th>
        <th width="10%">产品单价(元)</th>
        <th width="10%">需求数量</th>
        <th width="10%">发货期限(天)</th>
        <shiro:hasPermission name="cms:cmsRequirementInformation:edit">
            <th width="6%">操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsRequirementInformation">
        <tr>
            <td title="${cmsRequirementInformation.productName }"><a
                    href="${ctx}/cms/cmsRequirementInformation/form?id=${cmsRequirementInformation.id}">
                    ${fns:abbr(cmsRequirementInformation.productName,50)}
            </a></td>
            <td title="${cmsRequirementInformation.demandEnterprise}">
                    ${fns:abbr(cmsRequirementInformation.demandEnterprise,50)}
            </td>
            <td>
                    ${cmsRequirementInformation.productPrice}
            </td>
            <td>
                    ${cmsRequirementInformation.demandQuantity}
            </td>
            <td>
                    ${cmsRequirementInformation.periodForDelivery}
            </td>
            <shiro:hasPermission name="cms:cmsRequirementInformation:edit">
                <td>
                    <a href="${ctx}/cms/cmsRequirementInformation/form?id=${cmsRequirementInformation.id}">修改</a>
                    <a href="${ctx}/cms/cmsRequirementInformation/delete?id=${cmsRequirementInformation.id}"
                       onclick="return confirmx('确认要删除该产品需求信息吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>