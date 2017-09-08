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
<%--
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/user/userList/enterpriseList">企业</a></li>
    <li><a href="${ctx}/user/userList/agencyList">投资机构</a></li>
    <li><a href="${ctx}/user/userList/personalList">个人</a></li>
</ul>
--%>
<form:form id="searchForm" modelAttribute="user" action="${ctx}/user/userList/enterpriseList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>企业编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>

        <li><label>企业是否实名认证：</label>
            <form:select path="p2pEnterpriseCertify.auditState" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:option value="1">是</form:option>
                <form:option value="2">否</form:option>
                <!--<form:option value="3">否</form:option>-->
            </form:select>
        </li>
        <li><label>注册手机号：</label>
            <form:input path="phone" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>企业编号</th><!-- 用户ID -->
        <th>企业昵称</th><!-- 用户名 -->
        <th>企业名称</th>
        <th>注册协议</th>
        <th>是否绑定银行卡</th>
        <th>代理人姓名</th>
        <th>代理人是否实名认证</th>
        <th>代理人是否为法定代表人</th>
        <th>企业法人姓名</th>
        <th>企业是否实名认证</th>
        <th>企业是否会员</th>
        <th>注册手机号码</th>
        <th>注册日期</th>
        <th>最近登录时间</th>
        <!-- <th>登录账号状态</th>
        <th>密码锁定时间</th> -->
        <%--<th>是否会员</th>--%>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${page.list}" varStatus="status" var="user">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <!-- 企业编号 -->
            <td>
                    ${user.id}
            </td>
            <!-- 企业昵称 （用户名）-->
            <td title="${user.loginName }">
                <a href="${ctx}/user/userList/otherBaseInfo?userid=${user.id}">
                        ${user.loginName}
                </a>
            </td>
            <!-- 企业名称 -->
            <td title="${user.p2pEnterpriseCertify.enterpriseName }">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${user.id}">
                        ${fns:abbr(user.p2pEnterpriseCertify.enterpriseName,15)}
                </a>
            </td>
            <!-- 注册协议 -->
            <td><a href="${ctx}/p2p/config/p2pAgreement/agreementShow?agreementType=4">平台服务协议</a></td>
            <!-- 是否绑定银行卡 -->
            <td>${fns:getDictLabel(user.p2pUserInformation.isBindBankCard, 'yes_no', '')}</td>
            <!-- 企业代理人姓名 -->
            <td>
                    ${user.p2pRegUserCertify.realName}
            </td>
            <!-- 企业代理人是否实名认证 -->
            <td>
                <c:choose>
                    <c:when test="${user.p2pRegUserCertify.auditState==1}">
                        <a href="${ctx}/user/certifyManage/enterpriseAgentCertify?userid=${user.id}">是</a>
                    </c:when>
                    <c:otherwise>否</c:otherwise>
                </c:choose>
            </td>
            <!--企业代理人是否为法定代表人-->
            <td>
                    ${fns:getDictLabel(user.p2pEnterpriseCertify.isEntLegalRep, 'yes_no', '')}
            </td>
            <!-- 企业法定代表人姓名 -->
            <td>${user.p2pEnterpriseCertify.nameOf} </td>
            <!-- 企业是否实名认证 -->
            <td>
                <c:choose>
                    <c:when test="${user.p2pEnterpriseCertify.auditState==1}">
                        <a href="${ctx}/user/certifyManage/enterpriseCertify?userid=${user.id}">是</a>
                    </c:when>
                    <c:otherwise>否</c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${user.p2pUserInformation.certificateState>=400}">
                        是
                    </c:when>
                    <c:otherwise>否</c:otherwise>
                </c:choose>
            </td>
            <!-- 注册手机号码 -->
            <td>${user.phone}</td>
            <!-- 注册日期 -->
            <td>
                <fmt:formatDate value="${user.p2pUserInformation.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 最近登录时间 -->
            <td>
                <fmt:formatDate value="${user.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <!-- 登录账号状态 -->
                <%-- <td >
                    ${fns:getDictLabel(user.p2pUserInformation.lockState, 'lock_state', '')}
                </td>
                <!-- 密码锁定时间 -->
                <td >
                    <fmt:formatDate value="${user.p2pUserInformation.lockTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td> --%>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

</body>
</html>