<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>撮合前债项状态进展表管理</title>
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
    <li><a href="${ctx}/financing/p2pBeforeMatchDebtState/">撮合前债项状态进展表列表</a></li>
    <li class="active"><a href="${ctx}/financing/p2pBeforeMatchDebtState/form?id=${p2pBeforeMatchDebtState.id}">撮合前债项状态进展表<shiro:hasPermission
            name="financing:p2pBeforeMatchDebtState:edit">${not empty p2pBeforeMatchDebtState.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="financing:p2pBeforeMatchDebtState:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pBeforeMatchDebtState"
           action="${ctx}/financing/p2pBeforeMatchDebtState/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">融资申请id：</label>
        <div class="controls">
            <form:input path="finacingInformationId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">进展阶段：</label>
        <div class="controls">
            <form:input path="progressStage" htmlEscape="false" maxlength="16" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">债项状态：</label>
        <div class="controls">
            <form:input path="debtState" htmlEscape="false" maxlength="16" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">状态时间：</label>
        <div class="controls">
            <input name="stateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pBeforeMatchDebtState.stateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">操作人：</label>
        <div class="controls">
            <form:input path="operatorId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处理结果：</label>
        <div class="controls">
            <form:input path="handleResult" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="financing:p2pBeforeMatchDebtState:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                                  type="submit"
                                                                                  value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>