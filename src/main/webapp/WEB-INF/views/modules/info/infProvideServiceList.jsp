<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户提供服务管理</title>
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
    <li class="active"><a href="${ctx}/info/infProvideService/">用户提供服务列表</a></li>
    <shiro:hasPermission name="info:infProvideService:edit">
        <li><a href="${ctx}/info/infProvideService/form">用户提供服务添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="infProvideService" action="${ctx}/info/infProvideService/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>产品或服务名称：</label>
            <form:input path="productServiceName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>产品或服务名称</th>
        <th>有效期至</th>
        <th>产品单价</th>
        <th>起订数量</th>
        <th>企业名称</th>
        <th>联系人</th>
        <th>职位</th>
        <th>联系电话</th>
        <th>传真</th>
        <th>产品图片</th>
        <th>产品服务介绍</th>
        <th>发布时间</th>
        <th>更新时间</th>
        <th>备注信息</th>
        <shiro:hasPermission name="info:infProvideService:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="infProvideService">
        <tr>
            <td><a href="${ctx}/info/infProvideService/form?id=${infProvideService.id}">
                    ${infProvideService.productServiceName}
            </a></td>
            <td>
                <fmt:formatDate value="${infProvideService.termOfValidity}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${infProvideService.productUnitPrice}
            </td>
            <td>
                    ${infProvideService.setNum}
            </td>
            <td>
                    ${infProvideService.enterpriseName}
            </td>
            <td>
                    ${infProvideService.contactsPerson}
            </td>
            <td>
                    ${infProvideService.positionPerson}
            </td>
            <td>
                    ${infProvideService.telphone}
            </td>
            <td>
                    ${infProvideService.tax}
            </td>
            <td>
                    ${infProvideService.productPicture}
            </td>
            <td>
                    ${infProvideService.productServiceIntroduction}
            </td>
            <td>
                <fmt:formatDate value="${infProvideService.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <fmt:formatDate value="${infProvideService.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${infProvideService.remarks}
            </td>
            <shiro:hasPermission name="info:infProvideService:edit">
                <td>
                    <a href="${ctx}/info/infProvideService/form?id=${infProvideService.id}">修改</a>
                    <a href="${ctx}/info/infProvideService/delete?id=${infProvideService.id}"
                       onclick="return confirmx('确认要删除该用户提供服务吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>