<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>个人身份认证数据库管理</title>
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
    <li><a href="${ctx}/user/p2pCertificationDatabase/">个人身份认证数据库列表</a></li>
    <li class="active"><a
            href="${ctx}/user/p2pCertificationDatabase/form?id=${p2pCertificationDatabase.id}">个人身份认证数据库<shiro:hasPermission
            name="user:p2pCertificationDatabase:edit">${not empty p2pCertificationDatabase.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="user:p2pCertificationDatabase:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pCertificationDatabase" action="${ctx}/user/p2pCertificationDatabase/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">真实姓名：</label>
        <div class="controls">
            <form:input path="realName" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份证号：</label>
        <div class="controls">
            <form:input path="idNumber" htmlEscape="false" maxlength="18" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">更新时间：</label>
        <div class="controls">
            <input name="updatetime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
                   value="<fmt:formatDate value="${p2pCertificationDatabase.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="user:p2pCertificationDatabase:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                              type="submit"
                                                                              value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>