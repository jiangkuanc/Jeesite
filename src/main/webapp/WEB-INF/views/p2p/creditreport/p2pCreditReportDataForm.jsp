<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
信用报告指标数据表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>信用报告指标数据表管理</title>
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
    <li><a href="${ctx}/p2p/creditreport/p2pCreditReportData/">信用报告指标数据表列表</a></li>
    <li class="active"><a href="${ctx}/p2p/creditreport/p2pCreditReportData/form?id=${p2pCreditReportData.id}">信用报告指标数据表<shiro:hasPermission
            name="p2p:creditreport:p2pCreditReportData:edit">${not empty p2pCreditReportData.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="p2p:creditreport:p2pCreditReportData:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pCreditReportData" action="${ctx}/p2p/creditreport/p2pCreditReportData/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">信用报告编号：</label>
        <div class="controls">
            <form:input path="creditReportId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">指标编号：</label>
        <div class="controls">
            <form:input path="indexId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">良好：</label>
        <div class="controls">
            <form:input path="good" htmlEscape="false" maxlength="11" class="input-xlarge required digits"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">正常：</label>
        <div class="controls">
            <form:input path="normal" htmlEscape="false" maxlength="11" class="input-xlarge required digits"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">风险：</label>
        <div class="controls">
            <form:input path="risk" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="p2p:creditreport:p2pCreditReportData:edit"><input id="btnSubmit"
                                                                                     class="btn btn-primary"
                                                                                     type="submit"
                                                                                     value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>