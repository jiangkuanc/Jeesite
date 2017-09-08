<%@ page language="java" import="java.*,java.util.*"
         contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<h3>企业其他基本信息页</h3>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <td>企业编号</td>
        <td>${p2pEnterpriseCertify.user.p2pUserInformation.id}</td>
        <td>企业名称</td>
        <td>${p2pEnterpriseCertify.enterpriseName}</td>
    </tr>
    <!-- <tr>
        <td>安全头像</td><td>——</td>
        <td>手机是否认证</td><td>——</td>
    </tr> -->
    <tr>
        <td>注册手机号码</td>
        <td>${p2pEnterpriseCertify.user.phone}</td>
        <td>代理人是否实名认证</td>
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
    </tr>
    <tr>
        <td>代理人姓名</td>
        <td>${p2pEnterpriseCertify.user.p2pRegUserCertify.realName}</td>
        <td>代理人身份证号</td>
        <td>${p2pEnterpriseCertify.user.p2pRegUserCertify.idNumber }</td>
    </tr>
    <%--<tr>
        <td>企业银行卡账号1是否认证</td><td>——</td>
        <td>企业银行卡账户1</td><td>——</td>
    </tr>
    <tr>
        <td>企业银行卡账号2是否认证</td><td>——</td>
        <td>企业银行卡账户2</td><td>——</td>
    </tr>
    <tr>
        <td>代理人邮箱是否认证</td><td>——</td>
        <td>代理人邮箱</td><td>——</td>
    </tr>
    --%>
    <tr>
        <td>企业认证状态</td>
        <td>

        </td>
        <td>联系电话</td>
        <td>${p2pEnterpriseCertify.telephoneNum}</td>
        <%--<td>联系人</td><td>——</td>
    --%></tr>
    <tr>

        <td>联系地址</td>
        <td colspan="3">${p2pEnterpriseCertify.registeredAddress}</td>
    </tr>
    <%--<tr>
        <td>邮编</td><td>——</td>
        <td></td><td></td>
    </tr>
--%></tbody>


</table>


<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
