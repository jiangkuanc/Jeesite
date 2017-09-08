<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>认证审核记录管理</title>
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
    <li><a href="${ctx}/user/p2pAuditRecord/">认证审核记录列表</a></li>
    <li class="active"><a href="${ctx}/user/p2pAuditRecord/form?id=${p2pAuditRecord.id}">认证审核记录<shiro:hasPermission
            name="user:p2pAuditRecord:edit">${not empty p2pAuditRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="user:p2pAuditRecord:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pAuditRecord" action="${ctx}/user/p2pAuditRecord/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">认证类别：身份认证、企业认证：</label>
        <div class="controls">
            <form:input path="auditType" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">认证ID，即用户身份认证表或企业认证表ID：</label>
        <div class="controls">
            <form:input path="referenceId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核人员ID：</label>
        <div class="controls">
            <form:input path="auditPersonId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核时间：</label>
        <div class="controls">
            <input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pAuditRecord.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核结论：</label>
        <div class="controls">
            <form:input path="auditResult" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核意见：</label>
        <div class="controls">
            <form:input path="auditOpinion" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="user:p2pAuditRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                                    value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>