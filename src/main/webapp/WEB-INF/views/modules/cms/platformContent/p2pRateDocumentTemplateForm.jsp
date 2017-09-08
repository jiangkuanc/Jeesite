<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级材料模板管理</title>
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
    <li><a href="${ctx}/document/p2pRateDocumentTemplate/">评级材料模板列表</a></li>
    <li class="active"><a
            href="${ctx}/document/p2pRateDocumentTemplate/form?id=${p2pRateDocumentTemplate.id}">评级材料模板<shiro:hasPermission
            name="document:p2pRateDocumentTemplate:edit">${not empty p2pRateDocumentTemplate.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="document:p2pRateDocumentTemplate:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pRateDocumentTemplate" action="${ctx}/document/p2pRateDocumentTemplate/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">名称：</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">材料类型：</label>
        <div class="controls">
            <form:select path="type" class="input-medium-select">
                <form:options items="${fns:getDictList('rate_document_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">名称：</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否必填：</label>
        <div class="controls">
            <form:select path="isRequired" class="input-medium-select">
                <form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="document:p2pRateDocumentTemplate:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                                 type="submit"
                                                                                 value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>