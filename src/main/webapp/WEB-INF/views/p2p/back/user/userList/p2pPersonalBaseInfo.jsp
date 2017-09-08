<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>个人用户基本信息</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="title"><h3>个人用户基本信息</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>用户编号</td>
        <td>${user.id }</td>
        <td>昵称</td>
        <td>${user.loginName }</td>
        <td>邮箱</td>
        <td>${user.email }</td>
    </tr>

    <tr>
        <td>真实姓名</td>
        <td>${user.name }</td>
        <td>身份证号</td>
        <td>${user.p2pRegUserCertify.idNumber }</td>
        <td rowspan="3">安全头像</td>
        <td rowspan="3"><img style="width:100px" src="${user.p2pUserInformation.userpic }"></td>
    </tr>
    <tr>
        <td>联系电话</td>
        <td>${user.phone }</td>
        <td>是否实名认证</td>
        <td><c:choose>
            <c:when test="${user.p2pRegUserCertify.auditState==1}">
                <a href="${ctx}/user/certifyManage/personalCertify?userid=${user.id}">是</a>
            </c:when>
            <c:otherwise>否</c:otherwise>
        </c:choose>
        </td>
    </tr>
    <tr>
        <td>银行卡是否认证</td>
        <td>${fns:getDictLabel(user.p2pUserInformation.isBindBankCard, 'yes_no', '')}</td>
        <td>银行卡卡号</td>
        <td>${user.p2pAccount.bankAccount}</td>
    </tr>
    </tbody>
</table>
</body>
</html>

