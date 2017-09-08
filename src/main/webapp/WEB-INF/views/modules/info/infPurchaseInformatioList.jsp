<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户求购信息管理</title>
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
    <li class="active"><a href="${ctx}/info/infPurchaseInformatio/">用户求购信息列表</a></li>
    <shiro:hasPermission name="info:infPurchaseInformatio:edit">
        <li><a href="${ctx}/info/infPurchaseInformatio/form">用户求购信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="infPurchaseInformatio" action="${ctx}/info/infPurchaseInformatio/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>求购产品名称：</label>
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
        <th>求购产品名称</th>
        <th>期望价格</th>
        <th>预算金额</th>
        <th>所需数量</th>
        <th>企业名称</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>有效期至</th>
        <th>发布时间</th>
        <th>附注说明</th>
        <th>更新时间</th>
        <th>备注信息</th>
        <shiro:hasPermission name="info:infPurchaseInformatio:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="infPurchaseInformatio">
        <tr>
            <td><a href="${ctx}/info/infPurchaseInformatio/form?id=${infPurchaseInformatio.id}">
                    ${infPurchaseInformatio.productName}
            </a></td>
            <td>
                    ${infPurchaseInformatio.expectedPrice}
            </td>
            <td>
                    ${infPurchaseInformatio.budgetAmount}
            </td>
            <td>
                    ${infPurchaseInformatio.requiredQuantity}
            </td>
            <td>
                    ${infPurchaseInformatio.enterpriseName}
            </td>
            <td>
                    ${infPurchaseInformatio.contactsPerson}
            </td>
            <td>
                    ${infPurchaseInformatio.telphone}
            </td>
            <td>
                <fmt:formatDate value="${infPurchaseInformatio.termOfValidity}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <fmt:formatDate value="${infPurchaseInformatio.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${infPurchaseInformatio.notes}
            </td>
            <td>
                <fmt:formatDate value="${infPurchaseInformatio.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${infPurchaseInformatio.remarks}
            </td>
            <shiro:hasPermission name="info:infPurchaseInformatio:edit">
                <td>
                    <a href="${ctx}/info/infPurchaseInformatio/form?id=${infPurchaseInformatio.id}">修改</a>
                    <a href="${ctx}/info/infPurchaseInformatio/delete?id=${infPurchaseInformatio.id}"
                       onclick="return confirmx('确认要删除该用户求购信息吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>