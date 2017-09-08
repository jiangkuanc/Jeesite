<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>贷款发放记录管理</title>
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
    <li><a href="${ctx}/financing/p2pGivingOutLoans/">贷款发放记录列表</a></li>
    <li class="active"><a
            href="${ctx}/financing/p2pGivingOutLoans/form?id=${p2pGivingOutLoans.id}">贷款发放记录<shiro:hasPermission
            name="financing:p2pGivingOutLoans:edit">${not empty p2pGivingOutLoans.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="financing:p2pGivingOutLoans:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pGivingOutLoans" action="${ctx}/financing/p2pGivingOutLoans/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">融资信息ID：</label>
        <div class="controls">
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资信息ID：</label>
        <div class="controls">
            <form:input path="investmentInformationId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资人账户：</label>
        <div class="controls">
            <form:input path="investorAccount" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资人用户ID：</label>
        <div class="controls">
            <form:input path="givingOutPerson" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">放款金额：</label>
        <div class="controls">
            <form:input path="givingOutAmount" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">放款时间：</label>
        <div class="controls">
            <input name="givingOutTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pGivingOutLoans.givingOutTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资人账户：</label>
        <div class="controls">
            <form:input path="financierAccount" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资人用户ID：</label>
        <div class="controls">
            <form:input path="receiveAmoutPerson" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">收款金额：</label>
        <div class="controls">
            <form:input path="receiveAmount" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">收款时间：</label>
        <div class="controls">
            <input name="receiveAmountTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pGivingOutLoans.receiveAmountTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">tripartite_agreement：</label>
        <div class="controls">
            <form:input path="tripartiteAgreement" htmlEscape="false" maxlength="200" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">contract_sign_time：</label>
        <div class="controls">
            <input name="contractSignTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pGivingOutLoans.contractSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="financing:p2pGivingOutLoans:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                            type="submit"
                                                                            value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>