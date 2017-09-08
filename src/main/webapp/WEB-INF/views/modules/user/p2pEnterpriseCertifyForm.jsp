<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>注册用户绑定企业，需进行企业认证管理</title>
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

            $("#input").on("click", function () {
                var flag = $(this).prop("checked");
                console.log(flag);
                if (flag) {
                    $("#wrap").show()
                } else {
                    $("#wrap").hide()
                }
            })
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/user/p2pEnterpriseCertify/">注册用户绑定企业，需进行企业认证列表</a></li>
    <li class="active"><a
            href="${ctx}/user/p2pEnterpriseCertify/form?id=${p2pEnterpriseCertify.id}">注册用户绑定企业，需进行企业认证<shiro:hasPermission
            name="user:p2pEnterpriseCertify:edit">${not empty p2pEnterpriseCertify.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="user:p2pEnterpriseCertify:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pEnterpriseCertify" action="${ctx}/user/p2pEnterpriseCertify/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">注册用户ID：</label>
        <div class="controls">
            <sys:treeselect id="user" name="user.id" value="${p2pEnterpriseCertify.user.id}" labelName="user.name"
                            labelValue="${p2pEnterpriseCertify.user.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="required" allowClear="true"
                            notAllowSelectParent="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">单位类型：个体工商户、企业：</label>
        <div class="controls">
            <form:input path="unitType" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">证件类型：0-普通营业执照、1-多证合一营业执照：</label>
        <div class="controls">
            <form:input path="certificateType" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">统一社会信用代码(营业执照注册号)：</label>
        <div class="controls">
            <form:input path="unifiedSocialCreditCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">组织机构代码：</label>
        <div class="controls">
            <form:input path="organizationCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">税务登记证号：</label>
        <div class="controls">
            <form:input path="taxRegistrationNum" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业名称：</label>
        <div class="controls">
            <form:input path="enterpriseName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">证照所在地，字典，省级区域：</label>
        <div class="controls">
            <form:input path="certificateLocation" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group" style="position: relative;">
        <label class="control-label">营业期限，(年月日)，如为(长期)，此字段为空：</label>
        <div class="controls">
            <input name="operationPeriod" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pEnterpriseCertify.operationPeriod}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
        <div id="wrap" style="position:absolute;display:none;top:0;left:0;opacity: 0;width: 157px;height: 30px;"></div>
    </div>
    <div class="control-group">
        <label class="control-label">营业期限是否为长期：</label>
        <div class="controls">
            <form:input path="isLongTerm" id="input" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">注册地址：</label>
        <div class="controls">
            <form:input path="registeredAddress" htmlEscape="false" maxlength="128" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">注册资金：</label>
        <div class="controls">
            <form:input path="registeredCapital" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话：</label>
        <div class="controls">
            <form:input path="telephoneNum" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">营业范围：</label>
        <div class="controls">
            <form:input path="businessScope" htmlEscape="false" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">营业执照副本扫描件，相对路径：</label>
        <div class="controls">
            <form:input path="businessLicense" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">代理人是否为法人，如不是，则需提供代理人身份信息：</label>
        <div class="controls">
            <form:input path="isEntLegalRep" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业法人姓名：</label>
        <div class="controls">
            <form:input path="nameOf" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业法人身份证号码：</label>
        <div class="controls">
            <form:input path="idNumberOf" htmlEscape="false" maxlength="18" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业法人身份证正面，路径：</label>
        <div class="controls">
            <form:input path="idCardFront" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业法人身份证背面，路径：</label>
        <div class="controls">
            <form:input path="idCardBack" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业法人联系电话：</label>
        <div class="controls">
            <form:input path="telephoneNumOf" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">材料提交时间：</label>
        <div class="controls">
            <input name="submitTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pEnterpriseCertify.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">认证审核状态：</label>
        <div class="controls">
            <form:input path="auditState" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">状态说明：</label>
        <div class="controls">
            <form:input path="auditExplain" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">材料提交时间：</label>
        <div class="controls">
            <input name="auditTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pEnterpriseCertify.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">审核人员编号：</label>
        <div class="controls">
            <form:input path="auditPersonId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="user:p2pEnterpriseCertify:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                          type="submit"
                                                                          value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>