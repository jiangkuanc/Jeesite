<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
信用记录维护
@author Zazh
@version 2017-02-20
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>信用记录维护管理</title>
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
<table></table>
<form:form id="inputForm" modelAttribute="creditOverdueInfo" action="${ctx}/creditmanage/creditOverdueInfo/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">企业账户ID：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${creditOverdueInfo.user.id}" labelName="user.name"
                            labelValue="${creditOverdueInfo.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处置机构：</label>
        <div class="controls">
            <form:input path="disposalAgency" htmlEscape="false" maxlength="16" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">币种：</label>
        <div class="controls">
            <form:input path="currency" htmlEscape="false" maxlength="16" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">逾期金额：</label>
        <div class="controls">
            <form:input path="overdueAmount" htmlEscape="false" maxlength="16" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">逾期年月：</label>
        <div class="controls">
            <input name="overdueDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${creditOverdueInfo.overdueDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">逾期持续月数：</label>
        <div class="controls">
            <form:input path="overdueMonths" htmlEscape="false" maxlength="11" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">最近一次还款日期：</label>
        <div class="controls">
            <input name="lastRepaymentDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${creditOverdueInfo.lastRepaymentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处置完成日期：</label>
        <div class="controls">
            <input name="disposalCompletionDate" type="text" readonly="readonly" maxlength="20"
                   class="input-medium Wdate "
                   value="<fmt:formatDate value="${creditOverdueInfo.disposalCompletionDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">笔数：</label>
        <div class="controls">
            <form:input path="pens" htmlEscape="false" maxlength="11" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="creditmanage:creditOverdueInfo:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                               type="submit"
                                                                               value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>