<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资机构基本信息</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="title"><h3>投资机构基本信息</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>机构基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>机构名称</td>
        <td>${user.p2pUserInformation.bankname }</td>
        <td>机构编号</td>
        <td>${user.id }</td>
    </tr>
    <tr>
        <td>注册地址</td>
        <td>${user.p2pUserInformation.bankaddress }</td>
        <td>公司详细地址</td>
        <td>${user.p2pUserInformation.companyAddress }</td>
    </tr>
    <tr>
        <td>营业执照</td>
        <td><a onclick="modelView('${user.p2pUserInformation.businessLicense }')">查看</a></td>
        <td>法人身份证信息</td>
        <td><a onclick="modelView('${user.p2pUserInformation.legalPersonIdcard }')">查看</a></td>
    </tr>
    </tbody>
</table>
<h4>对接人基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>姓名</td>
        <td>${user.name }</td>
        <td>性别</td>
        <td>${fns:getDictLabel(user.p2pUserInformation.dockingSex, 'sex', '')}</td>
    </tr>
    <tr>
        <td>电话</td>
        <td>${user.phone }</td>
        <td>部门</td>
        <td>${user.p2pUserInformation.dockingDepartment }</td>
    </tr>
    <tr>
        <td>职位</td>
        <td>${user.p2pUserInformation.dockingJob }</td>
        <td>邮箱</td>
        <td>${user.email }</td>
    </tr>
    <tr>
        <td>对接人身份证信息</td>
        <td><a onclick="modelView('${user.p2pUserInformation.dockingIdscanning }')">查看</a></td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>