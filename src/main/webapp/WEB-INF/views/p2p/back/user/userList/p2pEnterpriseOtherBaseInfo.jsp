<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业其他基本信息页</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="title"><h3>企业其他基本信息页</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>

<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业编号</td>
        <td>${user.id}</td>
        <td>企业名称</td>
        <td>${user.p2pEnterpriseCertify.enterpriseName}</td>
    </tr>
    <tr>
        <td>安全头像</td>
        <td>
            <img style="width:100px" src="${user.p2pUserInformation.userpic}">
        </td>
        <td>手机是否认证</td>
        <td>暂无此功能</td>
    </tr>
    <tr>
        <td>注册手机号码</td>
        <td>${user.phone}</td>
        <td>代理人是否实名认证</td>
        <td>
            <c:choose>
                <c:when test="${user.p2pRegUserCertify.auditState==1}">
                    是
                </c:when>
                <c:otherwise>否</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td>代理人姓名</td>
        <td>${user.p2pRegUserCertify.realName}</td>
        <td>代理人身份证号</td>
        <td>${user.p2pRegUserCertify.idNumber }</td>
    </tr>
    <tr>
        <td>代理人邮箱是否认证</td>
        <td>暂无此功能</td>
        <td>代理人邮箱</td>
        <td>${user.email}</td>
    </tr>
    <tr>
        <td>企业是否认证</td>
        <td>
            <c:choose>
                <c:when test="${user.p2pEnterpriseCertify.auditState==1}">
                    是
                </c:when>
                <c:otherwise>否</c:otherwise>
            </c:choose>
        </td>
        <td>联系人</td>
        <td>${user.p2pUserInformation.contactName}</td>
    </tr>
    <tr>
        <td>联系电话</td>
        <td>${user.p2pUserInformation.contactPhone }</td>
        <td>联系地址</td>
        <td>${user.p2pUserInformation.contactAddress }</td>
    </tr>
    <tr>
        <td>邮编</td>
        <td>${user.p2pUserInformation.contactPost }</td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>

</body>
</html>