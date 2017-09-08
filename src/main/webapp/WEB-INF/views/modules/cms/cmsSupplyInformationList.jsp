<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>供给信息管理</title>
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
    <li class="active"><a href="${ctx}/cms/cmsSupplyInformation/">供给信息列表</a></li>
    <shiro:hasPermission name="cms:cmsSupplyInformation:edit">
        <li><a href="${ctx}/cms/cmsSupplyInformation/selectSupplyInformationList">供给信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="cmsSupplyInformation" action="${ctx}/cms/cmsSupplyInformation/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>供给信息名称：</label>
            <form:input path="informationName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>供给信息名称</th>
        <th>产品价格/元</th>
        <th>联系人</th>
        <th>职务</th>
        <th>联系电话</th>
        <th>企业名称</th>
        <th>有效期至</th>
        <!-- 				<th>企业简介</th>				 -->
        <th>最小起订量</th>
        <shiro:hasPermission name="cms:cmsSupplyInformation:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsSupplyInformation">
        <tr>
            <td><a href="${ctx}/cms/cmsSupplyInformation/form?id=${cmsSupplyInformation.id}"
                   title="${cmsSupplyInformation.informationName}">${fns:abbr(cmsSupplyInformation.informationName,35)}</a>
            </td>
            <td>
                    ${cmsSupplyInformation.productPrice}
            </td>
            <td>
                    ${cmsSupplyInformation.contacts}
            </td>
            <td>
                    ${cmsSupplyInformation.duty}
            </td>
            <td>
                    ${cmsSupplyInformation.phone}
            </td>
            <td title="${cmsSupplyInformation.companyName }">
                    ${fns:abbr(cmsSupplyInformation.companyName,35)}
            </td>
            <td>
                <fmt:formatDate value="${cmsSupplyInformation.validity}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 				<td> -->
            <!-- 				    ${fns:abbr(cmsSupplyInformation.companyEnterprise,100)}			 -->
            <!-- 				</td>				 -->
            <td>
                    ${cmsSupplyInformation.minOrder}
            </td>
            <shiro:hasPermission name="cms:cmsSupplyInformation:edit">
                <td>
                    <a href="${ctx}/cms/cmsSupplyInformation/form?id=${cmsSupplyInformation.id}">修改</a>
                    <a href="${ctx}/cms/cmsSupplyInformation/delete?id=${cmsSupplyInformation.id}"
                       onclick="return confirmx('确认要删除该供给信息吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>