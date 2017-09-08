<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
还款记录表
@author Quincy
@version 2016-11-03
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>还款记录管理</title>
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
    <li><a href="${ctx}/repayment/p2pRepaymentRecord/">还款记录列表</a></li>
    <li class="active"><a
            href="${ctx}/repayment/p2pRepaymentRecord/form?id=${p2pRepaymentRecord.id}">还款记录<shiro:hasPermission
            name="repayment:p2pRepaymentRecord:edit">${not empty p2pRepaymentRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="repayment:p2pRepaymentRecord:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pRepaymentRecord" action="${ctx}/repayment/p2pRepaymentRecord/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">还款计划表id：</label>
        <div class="controls">
            <form:input path="repaymentPlanId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">实际还款日期：</label>
        <div class="controls">
            <input name="realRepaymentDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pRepaymentRecord.realRepaymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">实际还款本金：</label>
        <div class="controls">
            <form:input path="realRepaymentPrincipal" htmlEscape="false" class="input-xlarge  number"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">实际还款利息：</label>
        <div class="controls">
            <form:input path="realRepaymentInterest" htmlEscape="false" class="input-xlarge  number"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">实际还款罚金：</label>
        <div class="controls">
            <form:input path="realRepaymentFine" htmlEscape="false" class="input-xlarge  number"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">还款账户：</label>
        <div class="controls">
            <form:input path="repaymentAccount" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">还款凭证：</label>
        <div class="controls">
            <form:input path="repaymentVoucher" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="repayment:p2pRepaymentRecord:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                             type="submit"
                                                                             value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>