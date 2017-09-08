<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
举报信息审核表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>举报信息审核表管理</title>
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
    <li><a href="${ctx}/p2p/creditreport/p2pReportInformationAudit/">举报信息审核表列表</a></li>
    <li class="active"><a
            href="${ctx}/p2p/creditreport/p2pReportInformationAudit/form?id=${p2pReportInformationAudit.id}">举报信息审核表<shiro:hasPermission
            name="p2p:creditreport:p2pReportInformationAudit:edit">${not empty p2pReportInformationAudit.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="p2p:creditreport:p2pReportInformationAudit:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pReportInformationAudit"
           action="${ctx}/p2p/creditreport/p2pReportInformationAudit/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">举报人编号：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${p2pReportInformationAudit.user.id}" labelName="user.name"
                            labelValue="${p2pReportInformationAudit.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">信用报告编号：</label>
        <div class="controls">
            <form:input path="creditReportId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">信用信息类型(credit_info_type)：</label>
        <div class="controls">
            <form:input path="creditInfoType" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">指标编号：</label>
        <div class="controls">
            <form:input path="indexId" htmlEscape="false" maxlength="128" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">举报类别(report_category)：</label>
        <div class="controls">
            <form:input path="reportCategory" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">举报类别明细：</label>
        <div class="controls">
            <form:input path="reportCategoryDetails" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">举报内容：</label>
        <div class="controls">
            <form:input path="reportContent" htmlEscape="false" maxlength="500" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">上传附件：</label>
        <div class="controls">
            <form:input path="uploadFile" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">初审意见(success_failure)：</label>
        <div class="controls">
            <form:input path="firstOpinion" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">初审员：</label>
        <div class="controls">
            <form:input path="firstStaff" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">初审说明：</label>
        <div class="controls">
            <form:input path="firstExplain" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">初审时间：</label>
        <div class="controls">
            <input name="firstTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pReportInformationAudit.firstTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">复审意见(success_failure)：</label>
        <div class="controls">
            <form:input path="reviewOpinion" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">复审员：</label>
        <div class="controls">
            <form:input path="reviewOfficer" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">复审说明：</label>
        <div class="controls">
            <form:input path="reviewExplain" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">复审时间：</label>
        <div class="controls">
            <input name="reviewTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pReportInformationAudit.reviewTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">举报审核状态(report_audit_state)待初审、待复审、举报成功、举报失败：</label>
        <div class="controls">
            <form:input path="reportAuditState" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否通知被举报人(yes_no)：</label>
        <div class="controls">
            <form:input path="isNoticeReported" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="p2p:creditreport:p2pReportInformationAudit:edit"><input id="btnSubmit"
                                                                                           class="btn btn-primary"
                                                                                           type="submit"
                                                                                           value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>