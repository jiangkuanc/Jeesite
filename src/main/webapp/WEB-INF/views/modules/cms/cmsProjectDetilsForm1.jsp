<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>项目信息详情管理</title>
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
    <li><a href="${ctx}/cms/cmsProjectDetils/">项目信息详情列表</a></li>
    <li class="active"><a href="${ctx}/cms/cmsProjectDetils/form?id=${cmsProjectDetils.id}">项目信息详情<shiro:hasPermission
            name="cms:cmsProjectDetils:edit">${not empty cmsProjectDetils.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="cms:cmsProjectDetils:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="cmsProjectDetils" action="${ctx}/cms/cmsProjectDetils/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <div class="control-group">
        <label class="control-label">项目名称：</label>
        <div class="controls">
            <form:input type="text" path="projectName" htmlEscape="false" maxlength="255" class="input-xlarge "
                        readonly="readonly "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资方式：</label>
        <div class="controls">
            <form:input path="investmentWay" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属行业：</label>
        <div class="controls">
            <form:input path="industryInvolved" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目有效期：</label>
        <div class="controls">
            <form:input path="projectValidity" htmlEscape="false" maxlength="16" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目所在地：</label>
        <div class="controls">
            <form:input path="projectLocated" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目简介：</label>
        <div class="controls">
            <form:textarea path="projectEnterprise" htmlEscape="false" rows="4" maxlength="10000"
                           class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">项目展示：</label>
        <div class="controls">
            <form:hidden id="projectDisplay" path="projectDisplay" htmlEscape="false" maxlength="1000"
                         class="input-xlarge"/>
            <sys:ckfinder input="projectDisplay" type="files" uploadPath="/cms/cmsProjectDetils" selectMultiple="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">合作机会：</label>
        <div class="controls">
            <form:textarea path="cooperationOpportunities" htmlEscape="false" rows="4" maxlength="1000"
                           class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="cms:cmsProjectDetils:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                     type="submit"
                                                                     value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>