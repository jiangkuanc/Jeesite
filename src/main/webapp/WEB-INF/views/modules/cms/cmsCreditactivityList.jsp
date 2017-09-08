<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
生成用户报名信息
@author summer
@version 2016-11-15
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>用户报名信息管理</title>
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
    <li class="active"><a href="${ctx}/cms/cmsCreditactivity/">用户报名信息列表</a></li>
    <%-- <shiro:hasPermission name="cms:cmsCreditactivity:edit"><li><a href="${ctx}/cms/cmsCreditactivity/form">用户报名信息添加</a></li></shiro:hasPermission> --%>
</ul>
<form:form id="searchForm" modelAttribute="cmsCreditactivity" action="${ctx}/cms/cmsCreditactivity/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>活动主题：</label>
            <form:input path="article.title" value="${cmsCreditactivity.article.title}" htmlEscape="false"
                        maxlength="64" class="input-medium"/>
        </li>
        <li><label>用户真实姓名：</label>
            <form:input path="realName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th width="50%">教育活动主题</th>
        <th width="20%">用户登录名</th>
        <th width="15%">用户真实姓名</th>
        <th width="15%">手机号</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="cmsCreditactivity">
        <tr>
            <td>
                    ${cmsCreditactivity.article.title}
            </td>
            <td>
                    ${cmsCreditactivity.user.name}
            </td>
            <td>
                    ${cmsCreditactivity.realName}
            </td>
            <td>
                    ${cmsCreditactivity.tel}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>