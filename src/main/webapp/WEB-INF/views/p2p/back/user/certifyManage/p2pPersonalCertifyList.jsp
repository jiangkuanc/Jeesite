<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>个人认证列表</title>
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
<%--<ul class="nav nav-tabs">
    <li><a href="${ctx}/user/certifyManage/enterpriseCertifyList">企业</a></li>
    <li class="active"><a href="${ctx}/user/certifyManage/personalCertifyList">个人</a></li>
</ul>
--%>
<form:form id="searchForm" modelAttribute="user" action="${ctx}/user/certifyManage/personalCertifyList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li>
            <label>个人编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li>
            <label>姓名：</label>
            <form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li>
            <label>身份认证状态：</label>
            <form:select path="p2pRegUserCertify.auditState" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('audit_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li>
            <label>身份证号：</label>
            <form:input path="p2pRegUserCertify.idNumber" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable"
       class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>个人编号</th>
        <th>姓名</th>
        <th>身份证号</th>
        <th>身份认证状态</th>
        <th>操作</th>
        <th>银行卡账户</th>
        <th>开户行</th>
        <th>持卡人</th>
        <%--				<th>预留手机号</th>--%>
        <th>开户行网点</th>
        <%--				<th>银行卡类型</th>--%>
        <th>银行卡认证状态</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="user">
        <tr>
            <td>${status.count }</td>
            <!--个人编号-->
            <td>${user.id}</td>
            <!--姓名-->
            <td>${user.name }</td>
            <!--身份证号-->
            <td>${user.p2pRegUserCertify.idNumber}</td>
            <!--身份认证状态-->
            <td>${fns:getDictLabel(user.p2pRegUserCertify.auditState,'audit_state', '')}</td>
            <!--操作-->
            <td>
                <c:choose>
                    <c:when test="${user.p2pRegUserCertify.auditState == 3}">
                        <shiro:hasPermission name="a">
                            <a href="${ctx}/user/certifyManage/personalCertify?userid=${user.id}">
                                审核
                            </a>
                        </shiro:hasPermission>
                    </c:when>
                    <c:when test="${user.p2pRegUserCertify.auditState == 1 || user.p2pRegUserCertify.auditState == 2}">
                        <a href="${ctx}/user/certifyManage/personalCertify?userid=${user.id}">
                            查看
                        </a>
                    </c:when>
                </c:choose>
            </td>
            <!-- 银行卡账户 -->
            <td>${user.p2pAccount.bankAccount }</td>
            <!-- 开户行 -->
            <td>${user.p2pAccount.bankName }</td>
            <!-- 持卡人 -->
            <td>${user.p2pAccount.openAccountName }</td>
            <!-- 预留手机号 -->
                <%--<td>${user.p2pAccount. }</td>--%>
            <!-- 开户行网点 -->
            <td>${user.p2pAccount.branchBankName }</td>
            <!-- 银行卡类型 -->
                <%--<td>${user.p2pAccount. }</td>--%>
            <!-- 银行卡认证状态 -->
            <td>${fns:getDictLabel(user.p2pAccount.certificateStatus ,'success_failure', '')}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>