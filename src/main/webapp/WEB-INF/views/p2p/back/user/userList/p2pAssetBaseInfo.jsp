<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评估公司基本信息</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div class="title"><h3>评估公司基本信息</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>评估公司基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>公司名称</td>
        <td>${user.p2pAssetValuation.name }</td>
        <td>注册地址</td>
        <td>${user.p2pAssetValuation.address }</td>
    </tr>
    <tr>
        <td>公司电话</td>
        <td>${user.p2pAssetValuation.phone }</td>
        <td>详细地址</td>
        <td>${user.p2pAssetValuation.addressDetail }</td>
    </tr>
    <tr>
        <td>业务范围</td>
        <td>${user.p2pAssetValuation.businessScope }</td>
        <td>公司网址</td>
        <td><a href="${user.p2pAssetValuation.webSite }" target="_blank">${user.p2pAssetValuation.webSite }</a></td>
    </tr>
    <tr>
        <td>公司简介</td>
        <td colspan="3">${user.p2pAssetValuation.introduce }</td>
    </tr>
    <tr>
        <td>营业执照</td>
        <td><a onclick="modelView('${user.p2pAssetValuation.businessLicense }')">查看</a></td>
        <td>法人身份证信息</td>
        <td><a onclick="modelView('${user.p2pAssetValuation.legalPersonIdcard }')">查看</a></td>
    </tr>
    <tr>
        <td>战略合作协议</td>
        <td><a onclick="modelView('${user.p2pAssetValuation.cooperationPlan }')">查看</a></td>
        <td></td>
        <td></td>
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
        <td>${fns:getDictLabel(user.p2pAssetValuation.dockingSex, 'sex', '')}</td>
    </tr>
    <tr>
        <td>电话</td>
        <td>${user.phone }</td>
        <td>部门</td>
        <td>${user.p2pAssetValuation.dockingDepartment }</td>
    </tr>
    <tr>
        <td>职位</td>
        <td>${user.p2pAssetValuation.dockingJob }</td>
        <td>邮箱</td>
        <td>${user.email }</td>
    </tr>
    <tr>
        <td>对接人身份证信息</td>
        <td><a onclick="modelView('${user.p2pAssetValuation.dockingIdscanning }')">查看</a></td>
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