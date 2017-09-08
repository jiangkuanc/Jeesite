<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业认证列表</title>
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
    <li class="active"><a href="${ctx}/user/certifyManage/enterpriseCertifyList">企业</a></li>
    <li><a href="${ctx}/user/certifyManage/personalCertifyList">个人</a></li>
</ul>
--%>
<form:form id="searchForm" modelAttribute="user"
           action="${ctx}/user/certifyManage/enterpriseCertifyList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label> <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label> <form:input path="p2pEnterpriseCertify.enterpriseName"
                                             htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>代理人身份认证状态：</label>
            <form:select path="p2pRegUserCertify.auditState" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('audit_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>企业认证状态：</label>
            <form:select path="p2pEnterpriseCertify.auditState" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('audit_state')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
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
        <th>企业编号</th>
        <th>企业名称</th>
        <!-- <th>企业分类</th>
        <th>单位类型</th> -->
        <th>企业代理人姓名</th>
        <th>企业代理人是否为法定代表人</th>
        <th>企业法定代表人姓名</th>
        <th>代理人身份认证状态</th>
        <th>代理人身份审核操作</th>
        <th>企业认证状态</th>
        <th>企业认证审核操作</th>
        <th>银行卡认证状态</th>
        <th>银行卡认证</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="user">
        <tr>
            <td>${status.count }</td>
            <!--企业编号-->
            <td>${user.id}</td>
            <!--企业名称-->
            <td>
                    <%--						<a href="${ctx}/user/userList/enterpriseDetails?userid=${user.id}">--%>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${user.id}">
                        ${user.p2pEnterpriseCertify.enterpriseName}
                </a>
            </td>
            <!--企业分类-->
            <!-- 					<td>${fns:getDictLabel(user.p2pUserInformation.userBodyType,'user_body_type','')}</td> -->
            <!--单位类型-->
            <!-- 					<td>${fns:getDictLabel(user.p2pEnterpriseCertify.unitType,'unit_type','')}</td> -->
            <!--企业代理人姓名-->
            <td>${user.p2pRegUserCertify.realName}</td>
            <!--企业代理人是否为法定代表人-->
            <td>${fns:getDictLabel(user.p2pEnterpriseCertify.isEntLegalRep,'yes_no','')}</td>
            <!--企业法定代表人姓名-->
            <td>${user.p2pEnterpriseCertify.nameOf}</td>
            <!--代理人身份认证状态-->
            <td>${fns:getDictLabel(user.p2pRegUserCertify.auditState,'audit_state', '')}</td>
            <!--代理人身份审核操作-->
            <td>
                <c:choose>
                    <c:when test="${user.p2pRegUserCertify.auditState == 3}">
                        <shiro:hasPermission name="agent:audit">
                            <a href="${ctx}/user/certifyManage/enterpriseAgentCertify?userid=${user.id}">
                                审核
                            </a>
                        </shiro:hasPermission>
                    </c:when>
                    <c:when test="${user.p2pRegUserCertify.auditState == 1 || user.p2pRegUserCertify.auditState == 2}">
                        <shiro:hasPermission name="enterprise:view">
                            <a href="${ctx}/user/certifyManage/enterpriseAgentCertify?userid=${user.id}">
                                查看
                            </a>
                        </shiro:hasPermission>
                    </c:when>
                </c:choose>
            </td>
            <!--企业认证状态-->
            <td>${fns:getDictLabel(user.p2pEnterpriseCertify.auditState,'audit_state', '')} </td>
            <!--企业认证审核操作-->
            <td>
                <c:if test="${user.p2pRegUserCertify.auditState == 1}">
                    <c:choose>
                        <c:when test="${user.p2pEnterpriseCertify.auditState == 3}">
                            <shiro:hasPermission name="enterprise:audit">
                                <a href="${ctx}/user/certifyManage/enterpriseCertify?userid=${user.id}">
                                    审核
                                </a>
                            </shiro:hasPermission>
                        </c:when>
                        <c:when test="${user.p2pEnterpriseCertify.auditState == 1 || user.p2pEnterpriseCertify.auditState == 2}">
                            <shiro:hasPermission name="enterprise:view">
                                <a href="${ctx}/user/certifyManage/enterpriseCertify?userid=${user.id}">
                                    查看
                                </a>
                            </shiro:hasPermission>
                        </c:when>
                    </c:choose>
                </c:if>
            </td>
            <!--银行卡认证状态-->
            <td></td>
            <!--银行卡认证-->
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>