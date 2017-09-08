<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
信用报告指标表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>信用报告指标表管理</title>
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
    <li><a href="${ctx}/p2p/creditreport/p2pCreditReportIndex/">信用报告指标表列表</a></li>
    <li class="active"><a href="${ctx}/p2p/creditreport/p2pCreditReportIndex/form?id=${p2pCreditReportIndex.id}">信用报告指标表<shiro:hasPermission
            name="p2p:creditreport:p2pCreditReportIndex:edit">${not empty p2pCreditReportIndex.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="p2p:creditreport:p2pCreditReportIndex:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pCreditReportIndex"
           action="${ctx}/p2p/creditreport/p2pCreditReportIndex/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">信用信息类型(credit_info_type)：</label>
        <div class="controls">
            <form:input path="creditInfoType" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">指标名称：</label>
        <div class="controls">
            <form:input path="indexName" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">排序：</label>
        <div class="controls">
            <input name="sort" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
                   value="<fmt:formatDate value="${p2pCreditReportIndex.sort}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否启用(yes_no)：</label>
        <div class="controls">
            <form:input path="isUse" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="p2p:creditreport:p2pCreditReportIndex:edit"><input id="btnSubmit"
                                                                                      class="btn btn-primary"
                                                                                      type="submit"
                                                                                      value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>