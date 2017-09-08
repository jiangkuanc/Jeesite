<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>需求信息详情管理</title>
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
    <li class="active"><a href="${ctx}/cms/cmsDemandInformation/">需求信息详情列表</a></li>
    <shiro:hasPermission name="cms:cmsDemandInformation:edit">
        <li><a href="${ctx}/cms/cmsDemandInformation/selectDemandInformationList">需求信息详情添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="cmsDemandInformation" action="${ctx}/cms/cmsDemandInformation/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>产品名称：</label>
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
        <th>产品名称</th>
        <th>期望价格</th>
        <th>预算金额</th>
        <th>所需数量</th>
        <th>企业名称</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>有效期至</th>
        <th>需求信息简介</th>
        <shiro:hasPermission name="cms:cmsDemandInformation:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsDemandInformation">
        <tr>
            <td><a href="${ctx}/cms/cmsDemandInformation/form?id=${cmsDemandInformation.id}">
                    ${cmsDemandInformation.productName}
            </a></td>
            <td>
                    ${cmsDemandInformation.hopePrice}
            </td>
            <td>
                    ${cmsDemandInformation.budgetAmount}
            </td>
            <td>
                    ${cmsDemandInformation.requiredNumber}
            </td>
            <td>
                    ${cmsDemandInformation.companyName}
            </td>
            <td>
                    ${cmsDemandInformation.contacts}
            </td>
            <td>
                    ${cmsDemandInformation.phone}
            </td>
            <td>
                <fmt:formatDate value="${cmsDemandInformation.validity}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
                    ${fns:abbr(cmsDemandInformation.requiredEnterprise,100)}
            </td>
            <shiro:hasPermission name="cms:cmsDemandInformation:edit">
                <td>
                    <a href="${ctx}/cms/cmsDemandInformation/form?id=${cmsDemandInformation.id}">修改</a>
                    <a href="${ctx}/cms/cmsDemandInformation/delete?id=${cmsDemandInformation.id}"
                       onclick="return confirmx('确认要删除该需求信息详情吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>