<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
信用信息购买表
@author wangbignqi
@version 2016-11-07
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>信用信息购买表管理</title>
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
    <li><a href="${ctx}/p2p/creditreport/p2pCreditReportBuy/">信用信息购买表列表</a></li>
    <li class="active"><a
            href="${ctx}/p2p/creditreport/p2pCreditReportBuy/form?id=${p2pCreditReportBuy.id}">信用信息购买表<shiro:hasPermission
            name="p2p:creditreport:p2pCreditReportBuy:edit">${not empty p2pCreditReportBuy.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="p2p:creditreport:p2pCreditReportBuy:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pCreditReportBuy" action="${ctx}/p2p/creditreport/p2pCreditReportBuy/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">用户编号：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${p2pCreditReportBuy.user.id}" labelName="user.name"
                            labelValue="${p2pCreditReportBuy.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">信用报告编号：</label>
        <div class="controls">
            <form:input path="creditReportId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">信用信息类型(credit_info_type)：</label>
        <div class="controls">
            <form:input path="creditInfoType" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">费用：</label>
        <div class="controls">
            <form:input path="cost" htmlEscape="false" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">购买时间：</label>
        <div class="controls">
            <input name="buyTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pCreditReportBuy.buyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="p2p:creditreport:p2pCreditReportBuy:edit"><input id="btnSubmit"
                                                                                    class="btn btn-primary"
                                                                                    type="submit"
                                                                                    value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>