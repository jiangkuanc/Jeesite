<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>产品供给信息管理</title>
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
    <li class="active"><a href="${ctx}/cms/p2pProductInfo/">产品供给信息列表</a></li>
    <shiro:hasPermission name="cms:p2pProductInfo:edit">
        <li><a href="${ctx}/cms/p2pProductInfo/form">产品供给信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pProductInfo" action="${ctx}/cms/p2pProductInfo/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>产品名称：</label>
            <form:input path="productName" htmlEscape="false" maxlength="255" class="input-medium"/>
        </li>
        <li><label>供给企业：</label>
            <form:input path="supplyEnterprise" htmlEscape="false" maxlength="255" class="input-medium"/>
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
        <th>产品单价</th>
        <th>供给企业</th>
        <th>最小起订量</th>
        <th>最大供货量</th>
        <!-- 				<th>产品信息</th> -->
        <th>发货期限</th>
        <!-- 				<th>供货企业信息简介</th> -->
        <!-- 				<th>产品图片</th> -->
        <!-- 				<th>创建者</th> -->
        <!-- 				<th>创建时间</th> -->
        <!-- 				<th>更新者</th> -->
        <!-- 				<th>更新时间</th> -->
        <!-- 				<th>备注信息</th> -->
        <shiro:hasPermission name="cms:p2pProductInfo:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pProductInfo">
        <tr>
            <td><a href="${ctx}/cms/p2pProductInfo/form?id=${p2pProductInfo.id}" title="${p2pProductInfo.productName}">
                    ${fns:abbr(p2pProductInfo.productName,35)}
            </a></td>
            <td>
                    ${p2pProductInfo.productPrice}
            </td>
            <td title="${p2pProductInfo.supplyEnterprise }">
                    ${fns:abbr(p2pProductInfo.supplyEnterprise,35)}
            </td>
            <td>
                    ${p2pProductInfo.minOrder}
            </td>
            <td>
                    ${p2pProductInfo.maxSupplyAmount}
            </td>
            <!-- 				<td> -->
            <!-- 					${p2pProductInfo.productInfo} -->
            <!-- 				</td> -->
            <td>
                    ${p2pProductInfo.periodForDelivery}
            </td>
            <!-- 				<td> -->
            <!-- 				    ${fns:abbr(p2pProductInfo.supplyEnterpriseInfo,100)}					 -->
            <!-- 				</td> -->
            <!-- 				<td> -->
            <!-- 					${p2pProductInfo.productPic} -->
            <!-- 				</td> -->
            <!-- 				<td> -->
            <!-- 					${p2pProductInfo.createBy.id} -->
            <!-- 				</td> -->
            <!-- 				<td> -->
            <!-- 					<fmt:formatDate value="${p2pProductInfo.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> -->
            <!-- 				</td> -->
            <!-- 				<td> -->
            <!-- 					${p2pProductInfo.updateBy.id} -->
            <!-- 				</td> -->
            <!-- 				<td> -->
            <!-- 					<fmt:formatDate value="${p2pProductInfo.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> -->
            <!-- 				</td> -->
            <!-- 				<td> -->
            <!-- 					${p2pProductInfo.remarks} -->
            <!-- 				</td> -->
            <shiro:hasPermission name="cms:p2pProductInfo:edit">
                <td>
                    <a href="${ctx}/cms/p2pProductInfo/form?id=${p2pProductInfo.id}">修改</a>
                    <a href="${ctx}/cms/p2pProductInfo/delete?id=${p2pProductInfo.id}"
                       onclick="return confirmx('确认要删除该产品供给信息吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>