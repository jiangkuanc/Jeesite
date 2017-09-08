<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>注册用户的身份认证状态及材料管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/user/p2pRegUserCertify/">注册用户的身份认证状态及材料列表</a></li>
    <li class="active"><a href="${ctx}/user/p2pRegUserCertify/form?id=">注册用户的身份认证状态及材料<shiro:hasPermission
            name="user:p2pRegUserCertify:edit">${not empty p2pRegUserCertify.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="user:p2pRegUserCertify:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form id="inputForm" action="${ctx}/user/p2pRegUserCertify/save" method="post" class="form-horizontal">

    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">注册用户ID：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${sessionScope.p2pRegUserCertify.user.id}"
                            labelName="user.name" labelValue="${sessionScope.p2pRegUserCertify.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true"
                            notAllowSelectParent="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">真实姓名：</label>
        <div class="controls">
            <input type="text" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份证号，仅支持大陆身份证：</label>
        <div class="controls">
            <input type="text" maxlength="18" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">自动认证状态，姓名与身份证号是否匹配：</label>
        <div class="controls">
            <input type="text" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">手持身份证照片，相对路径：</label>
        <div class="controls">
            <input type="text" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份证正面照片，相对路径：</label>
        <div class="controls">
            <input type="text" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份证背面照片，相对路径：</label>
        <div class="controls">
            <input type="text" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否为企业法人：</label>
        <div class="controls">
            <input type="text" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业委托书扫描件，相对路径：</label>
        <div class="controls">
            <input type="text" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">材料提交时间：</label>
        <div class="controls">
            <input name="submitTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pRegUserCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份认证审核状态：认证通过，认证不通过：</label>
        <div class="controls">
            <input type="text" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">认证状态审核说明：</label>
        <div class="controls">
            <input type="text" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核时间：</label>
        <div class="controls">
            <input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pRegUserCertify.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
</form>
</body>
</html>