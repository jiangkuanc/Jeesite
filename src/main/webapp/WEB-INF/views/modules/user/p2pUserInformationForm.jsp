<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户信息表管理</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<h3>用户详情</h3>
<table class="table table-striped table-bordered table-condensed">

    <tbody>
    <tr>
        <td>用户编号</td>
        <td>${p2pUserInformation.id}</td>
        <td>昵称</td>
        <td>${p2pUserInformation.user.loginName}</td>
        <td rowspan="2">用户头像</td>
        <td rowspan="2"><img width="100px" src="${pageContext.request.contextPath}/${p2pUserInformation.userpic }"/>
            <!-- ${p2pUserInformation.userpic} --></td>

    </tr>
    <tr>
        <td>真实姓名</td>
        <td>${p2pUserInformation.user.name}</td>
        <td>联系方式</td>
        <td>${p2pUserInformation.user.phone}</td>

    </tr>
    <tr>
        <td>主体类型</td>
        <td>${fns:getDictLabel(p2pUserInformation.userBodyType, 'user_body_type', '')}</td>
        <td>实名认证状态</td>
        <td>

            ${fns:getDictLabel(p2pUserInformation.p2pRegUserCertify.auditState, 'audit_state', '')}
        </td>
        <td>邮箱</td>
        <td>${p2pUserInformation.user.email}</td>

    </tr>
    <tr>
        <td>登录IP</td>
        <td>${p2pUserInformation.user.loginIp}</td>
        <td>session_id</td>
        <td>${p2pUserInformation.sessionId}</td>
        <td>注册日期</td>
        <td><fmt:formatDate value="${p2pUserInformation.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
    </tbody>


</table>


<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>

</body>
</html>