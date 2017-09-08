<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投资信息管理</title>
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
    <li><a href="${ctx}/investment/p2pInvestmentInformation/">投资信息列表</a></li>
    <li class="active"><a
            href="${ctx}/investment/p2pInvestmentInformation/form?id=${p2pInvestmentInformation.id}">投资信息<shiro:hasPermission
            name="investment:p2pInvestmentInformation:edit">${not empty p2pInvestmentInformation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="investment:p2pInvestmentInformation:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pInvestmentInformation"
           action="${ctx}/investment/p2pInvestmentInformation/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">融资信息ID：</label>
        <div class="controls">
            <form:input path="financingInformationId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资人，即投资人用户ID：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${p2pInvestmentInformation.user.id}" labelName="user.name"
                            labelValue="${p2pInvestmentInformation.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资金额：</label>
        <div class="controls">
            <form:input path="investmentAmount" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">确认投资协议：</label>
        <div class="controls">
            <form:input path="investmentAgreement" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">确认投资协议时间：</label>
        <div class="controls">
            <input name="investmentAgreementTime" type="text" readonly="readonly" maxlength="20"
                   class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pInvestmentInformation.investmentAgreementTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
        <shiro:hasPermission name="investment:p2pInvestmentInformation:edit"><input id="btnSubmit"
                                                                                    class="btn btn-primary"
                                                                                    type="submit"
                                                                                    value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>