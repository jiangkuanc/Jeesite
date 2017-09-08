<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>融资评级信息管理</title>
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
    <li class="active"><a href="${ctx}/financing/p2pFinancingRatingInfo/">融资评级信息列表</a></li>
    <shiro:hasPermission name="financing:p2pFinancingRatingInfo:edit">
        <li><a href="${ctx}/financing/p2pFinancingRatingInfo/form">融资评级信息添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="p2pFinancingRatingInfo" action="${ctx}/financing/p2pFinancingRatingInfo/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>融资评级信息ID：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>融资信息ID：</label>
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>信用等级：</label>
            <form:input path="ratingLevel" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>推荐利率：</label>
            <form:input path="recommendedRate" htmlEscape="false" class="input-medium"/>
        </li>
        <li><label>评级报告：</label>
            <form:input path="creditReport" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>发布时间：</label>
            <input name="publishTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${p2pFinancingRatingInfo.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>融资评级信息ID</th>
        <th>融资信息ID</th>
        <th>信用等级</th>
        <th>推荐利率</th>
        <th>评级报告</th>
        <th>发布时间</th>
        <shiro:hasPermission name="financing:p2pFinancingRatingInfo:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="p2pFinancingRatingInfo">
        <tr>
            <td><a href="${ctx}/financing/p2pFinancingRatingInfo/form?id=${p2pFinancingRatingInfo.id}">
                    ${p2pFinancingRatingInfo.id}
            </a></td>
            <td>
                    ${p2pFinancingRatingInfo.financingInformationId}
            </td>
            <td>
                    ${p2pFinancingRatingInfo.ratingLevel}
            </td>
            <td>
                    ${p2pFinancingRatingInfo.recommendedRate}
            </td>
            <td>
                    ${p2pFinancingRatingInfo.creditReport}
            </td>
            <td>
                <fmt:formatDate value="${p2pFinancingRatingInfo.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <shiro:hasPermission name="financing:p2pFinancingRatingInfo:edit">
                <td>
                    <a href="${ctx}/financing/p2pFinancingRatingInfo/form?id=${p2pFinancingRatingInfo.id}">修改</a>
                    <a href="${ctx}/financing/p2pFinancingRatingInfo/delete?id=${p2pFinancingRatingInfo.id}"
                       onclick="return confirmx('确认要删除该融资评级信息吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>