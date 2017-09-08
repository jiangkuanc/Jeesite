<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户权限控制表，配置用户能访问的功能管理</title>
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
    <li><a href="${ctx}/user/p2pUserResource/">用户权限控制表，配置用户能访问的功能列表</a></li>
    <li class="active"><a
            href="${ctx}/user/p2pUserResource/form?id=${p2pUserResource.id}">用户权限控制表，配置用户能访问的功能<shiro:hasPermission
            name="user:p2pUserResource:edit">${not empty p2pUserResource.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="user:p2pUserResource:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pUserResource" action="${ctx}/user/p2pUserResource/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">注册用户ID：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${p2pUserResource.user.id}" labelName="user.name"
                            labelValue="${p2pUserResource.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">用户类别：1-投资者、2-融资者，可同时存在：</label>
        <div class="controls">
            <form:input path="userType" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">资源名称，即模块名称，通过Static变量控制：</label>
        <div class="controls">
            <form:input path="resourceName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">资源描述：</label>
        <div class="controls">
            <form:input path="resourceExplain" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="user:p2pUserResource:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                     type="submit"
                                                                     value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>