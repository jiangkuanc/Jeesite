<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>材料上传记录管理</title>
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
    <li><a href="${ctx}/document/p2pDocumentUploadRecord/">材料上传记录列表</a></li>
    <li class="active"><a
            href="${ctx}/document/p2pDocumentUploadRecord/form?id=${p2pDocumentUploadRecord.id}">材料上传记录<shiro:hasPermission
            name="document:p2pDocumentUploadRecord:edit">${not empty p2pDocumentUploadRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="document:p2pDocumentUploadRecord:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pDocumentUploadRecord" action="${ctx}/document/p2pDocumentUploadRecord/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">上传材料ID：</label>
        <div class="controls">
            <form:input path="rateDocumentUploadId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">文件名称：</label>
        <div class="controls">
            <form:input path="fileName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">文件地址：</label>
        <div class="controls">
            <form:input path="fileAddress" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="document:p2pDocumentUploadRecord:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                                 type="submit"
                                                                                 value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>