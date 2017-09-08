<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>供给信息管理</title>
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
    <li><a href="${ctx}/cms/cmsSupplyInformation/">供给信息列表</a></li>
    <li class="active"><a
            href="${ctx}/cms/cmsSupplyInformation/form?id=${cmsSupplyInformation.id}">供给信息<shiro:hasPermission
            name="cms:cmsSupplyInformation:edit">${not empty cmsSupplyInformation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="cms:cmsSupplyInformation:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="cmsSupplyInformation" action="${ctx}/cms/cmsSupplyInformation/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <div class="control-group">
        <label class="control-label">供给信息名称：</label>
        <div class="controls">
            <form:input type="text" path="informationName" htmlEscape="false" maxlength="64" class="input-xlarge "
                        readonly="readonly "/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">产品价格：</label>
        <div class="controls">
            <form:input path="productPrice" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">联系人：</label>
        <div class="controls">
            <form:input path="contacts" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">职务：</label>
        <div class="controls">
            <form:input path="duty" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话：</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业名称：</label>
        <div class="controls">
            <form:input path="companyName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">有效期至：</label>
        <div class="controls">
            <input name="validity" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${cmsSupplyInformation.validity}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业简介：</label>
        <div class="controls">
            <form:textarea path="companyEnterprise" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业展示：</label>
        <div class="controls">
            <form:hidden id="companyDisplay" path="companyDisplay" htmlEscape="false" maxlength="1000"
                         class="input-xlarge"/>
            <sys:ckfinder input="companyDisplay" type="files" uploadPath="/cms/cmsSupplyInformation"
                          selectMultiple="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">最小起订量：</label>
        <div class="controls">
            <form:input path="minOrder" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="cms:cmsSupplyInformation:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                         type="submit"
                                                                         value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>