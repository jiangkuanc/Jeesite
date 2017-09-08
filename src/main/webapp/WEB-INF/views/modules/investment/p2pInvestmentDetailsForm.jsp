<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
投资明细表
@author Chace
@version 2016-11-08
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>投资明细管理</title>
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
    <li><a href="${ctx}/investment/p2pInvestmentDetails/">投资明细列表</a></li>
    <li class="active"><a
            href="${ctx}/investment/p2pInvestmentDetails/form?id=${p2pInvestmentDetails.id}">投资明细<shiro:hasPermission
            name="investment:p2pInvestmentDetails:edit">${not empty p2pInvestmentDetails.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="investment:p2pInvestmentDetails:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pInvestmentDetails" action="${ctx}/investment/p2pInvestmentDetails/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">投资信息表id：</label>
        <div class="controls">
            <form:input path="investmentInformationId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资金额：</label>
        <div class="controls">
            <form:input path="investmentAmount" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资时间：</label>
        <div class="controls">
            <input name="investmentTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pInvestmentDetails.investmentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">投资协议id：</label>
        <div class="controls">
            <form:input path="investmentAgreementId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="investment:p2pInvestmentDetails:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                                type="submit"
                                                                                value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>