<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>融资申请材料管理</title>
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
    <li><a href="${ctx}/financing/p2pApplicationDocuments/">融资申请材料列表</a></li>
    <li class="active"><a
            href="${ctx}/financing/p2pApplicationDocuments/form?id=${p2pApplicationDocuments.id}">融资申请材料<shiro:hasPermission
            name="financing:p2pApplicationDocuments:edit">${not empty p2pApplicationDocuments.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="financing:p2pApplicationDocuments:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pApplicationDocuments"
           action="${ctx}/financing/p2pApplicationDocuments/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">融资信息ID：</label>
        <div class="controls">
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">申请材料(打包上传)，相对路径：</label>
        <div class="controls">
            <form:input path="applicationDocuments" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">材料说明：</label>
        <div class="controls">
            <form:input path="documentsExplain" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">材料提交时间：</label>
        <div class="controls">
            <input name="commitTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pApplicationDocuments.commitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核时间：</label>
        <div class="controls">
            <input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pApplicationDocuments.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核意见：</label>
        <div class="controls">
            <form:input path="auditOpinion" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核人，是某为运营人员的ID：</label>
        <div class="controls">
            <form:input path="auditPersonId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="financing:p2pApplicationDocuments:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                                  type="submit"
                                                                                  value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>