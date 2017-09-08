<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资机构基本信息</title>
    <meta name="decorator" content="default"/>
</head>

<body>
<h3>投资机构基本信息</h3>
<H4>机构基本信息</H4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td style="width:10%">机构名称</td>
        <td style="width:40%">${p2pUserInformation.bankname}</td>
        <td style="width:10%">机构编号</td>
        <td style="width:40%">${p2pUserInformation.id}</td>
    </tr>
    <tr>
        <td style="width:10%">地址</td>
        <td style="width:40%" colspan="3">${p2pUserInformation.bankaddress}</td>

    </tr>
    </tbody>
</table>
<H4>对接人基本信息</H4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td style="width:10%">姓名</td>
        <td style="width:40%">${p2pUserInformation.user.name}</td>
        <td style="width:10%">电话</td>
        <td style="width:40%">${p2pUserInformation.user.phone}</td>
    </tr>
    <tr>
        <td style="width:10%">邮箱</td>
        <td>${p2pUserInformation.user.email}</td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>


<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>