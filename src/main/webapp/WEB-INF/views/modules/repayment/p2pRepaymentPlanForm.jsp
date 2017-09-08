<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
还款计划表
@author Quincy
@version 2016-11-03
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>还款计划管理</title>
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
    <li><a href="${ctx}/repayment/p2pRepaymentPlan/">还款计划列表</a></li>
    <li class="active"><a
            href="${ctx}/repayment/p2pRepaymentPlan/form?id=${p2pRepaymentPlan.id}">还款计划<shiro:hasPermission
            name="repayment:p2pRepaymentPlan:edit">${not empty p2pRepaymentPlan.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="repayment:p2pRepaymentPlan:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pRepaymentPlan" action="${ctx}/repayment/p2pRepaymentPlan/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">融资信息id：</label>
        <div class="controls">
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">账期：</label>
        <div class="controls">
            <form:input path="phase" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">计划还款日期：</label>
        <div class="controls">
            <input name="planRepaymentDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pRepaymentPlan.planRepaymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">计划还款本金：</label>
        <div class="controls">
            <form:input path="planRepaymentPrincipal" htmlEscape="false" class="input-xlarge  number"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">计划还款利息：</label>
        <div class="controls">
            <form:input path="planRepaymentInterest" htmlEscape="false" class="input-xlarge  number"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">逾期天数：</label>
        <div class="controls">
            <form:input path="overdueDays" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">逾期级别（overdue_level）：</label>
        <div class="controls">
            <form:input path="overdueLevel" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">罚金：</label>
        <div class="controls">
            <form:input path="fine" htmlEscape="false" class="input-xlarge  number"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">还款状态(repayment_state)：</label>
        <div class="controls">
            <form:input path="repaymentState" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="repayment:p2pRepaymentPlan:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                           type="submit"
                                                                           value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>