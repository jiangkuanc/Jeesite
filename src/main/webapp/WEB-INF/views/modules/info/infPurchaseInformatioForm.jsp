<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户求购信息管理</title>
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
    <li><a href="${ctx}/info/infPurchaseInformatio/">用户求购信息列表</a></li>
    <li class="active"><a
            href="${ctx}/info/infPurchaseInformatio/form?id=${infPurchaseInformatio.id}">用户求购信息<shiro:hasPermission
            name="info:infPurchaseInformatio:edit">${not empty infPurchaseInformatio.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="info:infPurchaseInformatio:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="infPurchaseInformatio" action="${ctx}/info/infPurchaseInformatio/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">求购产品名称：</label>
        <div class="controls">
            <form:input path="productName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">期望价格：</label>
        <div class="controls">
            <form:input path="expectedPrice" htmlEscape="false" maxlength="50" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">预算金额：</label>
        <div class="controls">
            <form:input path="budgetAmount" htmlEscape="false" maxlength="50" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所需数量：</label>
        <div class="controls">
            <form:input path="requiredQuantity" htmlEscape="false" maxlength="50" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业名称：</label>
        <div class="controls">
            <form:input path="enterpriseName" htmlEscape="false" maxlength="100" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人：</label>
        <div class="controls">
            <form:input path="contactsPerson" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话：</label>
        <div class="controls">
            <form:input path="telphone" htmlEscape="false" maxlength="11" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">有效期至：</label>
        <div class="controls">
            <input name="termOfValidity" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${infPurchaseInformatio.termOfValidity}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">发布时间：</label>
        <div class="controls">
            <input name="publishTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${infPurchaseInformatio.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">附注说明：</label>
        <div class="controls">
            <form:input path="notes" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">产品图片：</label>
        <div class="controls">
            <form:input path="productPicture" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="info:infPurchaseInformatio:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                           type="submit"
                                                                           value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>