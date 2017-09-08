<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>信用记录维护</title>
    <meta name="decorator" content="default"/>
    <style>
        .fanhui {
            position: absolute;
            top: 1px;
            right: 20px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#inputForm").validate();
        });
    </script>
</head>
<body>
<a class="btn fanhui" href="${ctx}/creditmanage/creditRecordInfo">返回</a>
<h4>企业基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${p2pEnterpriseCertify.enterpriseName}</td>
        <td>企业组织结构代码</td>
        <td>${p2pEnterpriseCertify.organizationCode}</td>
    </tr>
    <tr>
        <td>注册号</td>
        <td>${p2pEnterpriseCertify.unifiedSocialCreditCode}</td>
        <td>企业法人</td>
        <td>${p2pEnterpriseCertify.nameOf}</td>
    </tr>
    <tr>
        <td>注册资本</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pEnterpriseCertify.registeredCapital}</fmt:formatNumber>元</td>
        <td>企业类型</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.unitType,'unit_type','')}</td>
    </tr>
    <tr>
        <td>经营范围</td>
        <td>${p2pEnterpriseCertify.businessScope}</td>
        <td>代理人姓名</td>
        <td>${p2pEnterpriseCertify.user.p2pRegUserCertify.realName}</td>
    </tr>
    <tr>
        <td>代理人身份证号码</td>
        <td>${p2pEnterpriseCertify.user.p2pRegUserCertify.idNumber}</td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
<iframe id="mainIframe" style="border:0;width:100%;height:400px;margin:1% auto;"
        src="${ctx}/creditmanage/creditOverdueInfo/list?remarks=${p2pEnterpriseCertify.remarks}&user.id=${p2pEnterpriseCertify.user.id}"></iframe>
</body>
</html>
