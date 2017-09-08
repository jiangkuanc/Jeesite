<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业用户列表</title>
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
    <li class="active"><a href="${ctx}/user/p2pEnterpriseCertify/userList">企业</a></li>
    <li><a href="${ctx}/user/p2pUserInformation/bankList">投资机构</a></li>
</ul>
<form:form id="searchForm" modelAttribute="p2pEnterpriseCertify" action="${ctx}/user/p2pEnterpriseCertify/userList"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label>
            <form:input path="user.id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="enterpriseName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
            <%-- <li><label>企业身份：</label>
                <form:select path="user.role.name" class="input-medium-select">
                    <form:option selected="selected" value="">全部</form:option>
                    <form:option value="投资用户">投资用户</form:option>
                    <form:option value="融资用户">融资用户</form:option>
                </form:select>
            </li> --%>
        <li><label>是否实名认证：</label>
            <form:select path="user.p2pRegUserCertify.auditState" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:option value="1">是</form:option>
                <form:option value="2">否</form:option>
                <!--<form:option value="3">否</form:option>-->
            </form:select>
        </li>
            <%--<li><label>认证状态：</label>
            <form:select path="auditState" class="input-medium-select">
                    <form:option value="" label="全部"/>
                    <form:options items="${fns:getDictList('audit_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>

            </li>
            --%>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>企业编号</th><!-- 企业认证ID -->
        <th>企业昵称</th><!-- 用户名 -->
        <th>企业名称</th>
        <th>注册协议</th>
        <th>企业代理人姓名</th>
        <th>企业代理人是否实名认证</th>
        <th>企业代理人是否为法定代表人</th>
        <th>企业法定代表人姓名</th>
        <th>企业是否实名认证</th>
        <th>注册手机号码</th>
        <th>注册日期</th>
        <th>最近登录时间</th>
        <th>登录账号状态</th>
        <th>密码锁定时间</th>
        <%--<th>是否会员</th>--%>
    </tr>
    </thead>
    <tbody style="font-size:5pt">

    <c:forEach items="${page.list}" varStatus="status" var="p2pEnterpriseCertify">

        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!-- 企业编号 -->
            <td>
                    ${p2pEnterpriseCertify.user.id}
            </td>
            <!-- 企业昵称 （用户名）-->
            <td title="${p2pEnterpriseCertify.user.loginName }">
                <a href="${ctx}/user/p2pEnterpriseCertify/otherBaseInfo?id=${p2pEnterpriseCertify.id}">
                        ${fns:abbr(p2pEnterpriseCertify.user.loginName,15)}
                </a>
                    <%--<a href="${ctx}/user/p2pEnterpriseCertify/test?id=${p2pEnterpriseCertify.id}">
                    ${fns:abbr(p2pEnterpriseCertify.user.loginName,6)}
                    </a>
                --%></td>
            <!-- 企业名称 -->
            <td title="${p2pEnterpriseCertify.enterpriseName }">
                <a href="${ctx}/user/p2pEnterpriseCertify/details?id=${p2pEnterpriseCertify.id}">
                        ${fns:abbr(p2pEnterpriseCertify.enterpriseName,30)}

                </a>
            </td>
            <!-- 企业身份 -->
            <td>
                    ${p2pEnterpriseCertify.user.role.name}
            </td>
            <!-- 单位类型 -->
            <td>
                    ${fns:getDictLabel(p2pEnterpriseCertify.unitType, 'unit_type', '')}
            </td>
            <!-- 证件类型 -->
            <td>
                    ${fns:getDictLabel(p2pEnterpriseCertify.certificateType, 'certificate_type', '')}
            </td>
            <!-- 企业代理人姓名 -->
            <td>
                    ${fns:abbr(p2pEnterpriseCertify.user.p2pRegUserCertify.realName,15)}
            </td>
            <!-- 注册手机号码 -->
            <td>
                    ${p2pEnterpriseCertify.user.phone}
            </td>
            <!-- 注册日期 -->
            <td>
                <fmt:formatDate value="${p2pEnterpriseCertify.user.p2pUserInformation.regTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 最近登录时间 -->
            <td>
                <fmt:formatDate value="${p2pEnterpriseCertify.user.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 登录账号状态 -->
            <td>
                    ${fns:getDictLabel(p2pEnterpriseCertify.user.p2pUserInformation.lockState, 'lock_state', '')}
            </td>
            <!-- 密码锁定时间 -->
            <td>
                <fmt:formatDate value="${p2pEnterpriseCertify.user.p2pUserInformation.lockTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                <c:choose>
                    <c:when test="${p2pEnterpriseCertify.user.p2pRegUserCertify.auditState==1}">
                        是
                    </c:when>
                    <c:otherwise>
                        否
                    </c:otherwise>
                </c:choose>
            </td>
            <!-- 企业认证状态 -->
                <%--<td>
                <a href="${ctx}/user/p2pEnterpriseCertify/auditView?id=${p2pEnterpriseCertify.id}">
                    ${fns:getDictLabel(p2pEnterpriseCertify.auditState, 'audit_state', '')}
                </a>
                </td>
            --%></tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

</body>
</html>