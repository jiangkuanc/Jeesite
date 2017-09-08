<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
企业信用报告表
@author wangbingqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>企业信用报告表管理</title>
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
    <li><a href="${ctx}/p2p/creditreport/p2pCreditReport/">企业信用报告表列表</a></li>
    <li class="active"><a
            href="${ctx}/p2p/creditreport/p2pCreditReport/form?id=${p2pCreditReport.id}">企业信用报告表<shiro:hasPermission
            name="p2p:creditreport:p2pCreditReport:edit">${not empty p2pCreditReport.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="p2p:creditreport:p2pCreditReport:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pCreditReport" action="${ctx}/p2p/creditreport/p2pCreditReport/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">注册用户ID：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${p2pCreditReport.user.id}" labelName="user.name"
                            labelValue="${p2pCreditReport.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业名称：</label>
        <div class="controls">
            <form:input path="enterpriseName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业类型(enterprise_type)（融资、投资、担保）：</label>
        <div class="controls">
            <form:input path="enterpriseType" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属行业：</label>
        <div class="controls">
            <form:input path="industryCode" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业介绍：</label>
        <div class="controls">
            <form:input path="enterpriseIntroduce" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否删除(yes_no)：</label>
        <div class="controls">
            <form:input path="isDelete" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">报告时间：</label>
        <div class="controls">
            <input name="reportTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pCreditReport.reportTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">评级等级(rating_level)：</label>
        <div class="controls">
            <form:input path="ratingLevel" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">评级时间：</label>
        <div class="controls">
            <input name="ratingTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pCreditReport.ratingTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">评级释义：</label>
        <div class="controls">
            <form:input path="ratingDefinition" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">统一社会信用代码：</label>
        <div class="controls">
            <form:input path="unifiedSocialCreditCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">统一社会信用代码是否提交(yes_no)：</label>
        <div class="controls">
            <form:input path="usccIsCommit" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">组织机构代码：</label>
        <div class="controls">
            <form:input path="organizationCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">组织机构代码是否提交（yes_no）：</label>
        <div class="controls">
            <form:input path="ocIsCommit" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">工商注册号：</label>
        <div class="controls">
            <form:input path="gongshangRegistNum" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">工商注册号是否提交(yes_no)：</label>
        <div class="controls">
            <form:input path="grnIsCommit" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">税务登记代码：</label>
        <div class="controls">
            <form:input path="taxRegistrationNum" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">税务登记代码是否提交(yes_no)：</label>
        <div class="controls">
            <form:input path="trnIsCommit" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">法人是否有变更(yes_no)：</label>
        <div class="controls">
            <form:input path="legalIsChange" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">注册资本是否有变更(yes_no)：</label>
        <div class="controls">
            <form:input path="registeredCapitalIsChange" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业基本信息注释：</label>
        <div class="controls">
            <form:input path="enterpriseBaseInfoComment" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">政府监管信息注释：</label>
        <div class="controls">
            <form:input path="governmentRegulationInfoComment" htmlEscape="false" maxlength="200"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">金融信贷信息注释：</label>
        <div class="controls">
            <form:input path="financialCreditInfoComment" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">行业评价信息注释：</label>
        <div class="controls">
            <form:input path="industryEvaluationInfoComment" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">媒体评价信息注释：</label>
        <div class="controls">
            <form:input path="mediaEvaluationInfoComment" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业运营信息注释：</label>
        <div class="controls">
            <form:input path="enterpriseOperationInfoComment" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">市场反馈信息注释：</label>
        <div class="controls">
            <form:input path="marketFeedbackInfoComment" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="p2p:creditreport:p2pCreditReport:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                                 type="submit"
                                                                                 value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>