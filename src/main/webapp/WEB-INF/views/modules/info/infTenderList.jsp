<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户招商管理</title>
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
    <li class="active"><a href="${ctx}/info/infTender/">我的招标项目</a></li>
    <li><a href="${ctx}/info/infProvideService/">我提供的服务或产品</a></li>
    <li><a href="${ctx}/info/infPurchaseInformatio/">我的求购信息</a></li>
</ul>
<form:form id="searchForm" modelAttribute="infTender" action="${ctx}/info/infTender/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>项目名称：</label>
            <form:input path="projectName" htmlEscape="false" maxlength="100" class="input-medium"/>
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
        <th>有效期至</th>
        <th>状态</th>
        <th>管理</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="infTender">
        <tr>
            <td><a href="${ctx}/info/infTender/form?id=${infTender.id}">
                    ${infTender.projectName}
            </a></td>
            <td>
                <fmt:formatDate value="${infTender.termOfValidity}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
                    ${fns:getDictLabel(infTender.infoStage,'info_stage','')}
            </td>
            <td>
                <c:if test="${infTender.infoStage=='1'}">
                    <a href="${ctx}/info/infTender/toTenderinfoPage?id=${infTender.id}">修改</a>
                    <a href="${ctx}/info/infTender/delete?id=${infTender.id}"
                       onclick="return confirmx('确认要删除该用户招商吗？', this.href)">删除</a>
                </c:if>
                <c:if test="${infTender.infoStage=='2'}">
                    <a href="${ctx}/info/infTender/infoRecord?infoStage=1&id=${infTender.id}">取消</a>
                </c:if>
                <c:if test="${infTender.infoStage=='3'}">
                    <a href="${ctx}/info/infTender/infoRecord?infoStage=4&id=${infTender.id}">关闭显示</a>
                </c:if>
                <c:if test="${infTender.infoStage=='4'}">
                    <a href="${ctx}/info/infTender/infoRecord?infoStage=3&id=${infTender.id}">显示</a>
                    <a href="${ctx}/info/infTender/delete?id=${infTender.id}"
                       onclick="return confirmx('确认要删除该用户招商吗？', this.href)">删除</a>
                </c:if>
                <c:if test="${infTender.infoStage=='5'}">
                    <a href="${ctx}/info/infTender/toTenderinfoPage?id=${infTender.id}">修改</a>
                    <a href="${ctx}/info/infTender/delete?id=${infTender.id}"
                       onclick="return confirmx('确认要删除该用户招商吗？', this.href)">删除</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>