<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>需求信息详情管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            jQuery.validator.addMethod("isMobile", function (value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写您的手机号码");

            jQuery.validator.addMethod("yewuje", function (value, element) {
                return this.optional(element) || /^[0-9]{1,37}[.]\d$|^[0-9]{1,36}[.]\d{2}$|^\d{1,38}$/.test(value);
            }, "只能为1-38位数字,可保留两位小数");

            $("#inputForm").validate({
                rules: {
                    hopePrice: {
                        required: true,
                        yewuje: true
                    },
                    budgetAmount: {
                        required: true,
                        yewuje: true
                    },
                    requiredNumber: {
                        required: true,
                        digits: true
                    },
                    companyName: "required",
                    contacts: "required",
                    phone: {
                        required: true,
                        minlength: 11,
                        isMobile: true
                    },
                    requiredEnterprise: "required"
                },
                messages: {
                    hopePrice: {
                        required: "不能为空",
                        yewuje: "请填写正确的期望价格"
                    },
                    budgetAmount: {
                        required: "不能为空",
                        yewuje: "请填写正确的预算金额"
                    },
                    requiredNumber: {
                        required: "不能为空",
                        digits: "请填入整数"
                    },
                    companyName: "不能为空",
                    contacts: "不能为空",
                    phone: {
                        required: "手机号码不能为空",
                        minlength: "确认手机不能小于11个字符",
                        isMobile: "请正确填写手机号码"
                    },
                    requiredEnterprise: "不能为空"
                }
            });

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
    <li><a href="${ctx}/cms/cmsDemandInformation/">需求信息详情列表</a></li>
    <li class="active"><a
            href="${ctx}/cms/cmsDemandInformation/form?id=${cmsDemandInformation.id}">需求信息详情<shiro:hasPermission
            name="cms:cmsDemandInformation:edit">${not empty cmsDemandInformation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="cms:cmsDemandInformation:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="cmsDemandInformation" action="${ctx}/cms/cmsDemandInformation/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <div class="control-group">
        <label class="control-label">产品名称：</label>
        <div class="controls">
            <select name="requirementId" class="input-xlarge">
                <c:forEach items="${demandInformationList}" var="vo">
                    <option value="${vo.id}">${vo.productName}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">期望价格：</label>
        <div class="controls">
            <form:input path="hopePrice" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">预算金额：</label>
        <div class="controls">
            <form:input path="budgetAmount" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所需数量：</label>
        <div class="controls">
            <form:input path="requiredNumber" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业名称：</label>
        <div class="controls">
            <form:input path="companyName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系人：</label>
        <div class="controls">
            <form:input path="contacts" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话：</label>
        <div class="controls">
            <form:input path="phone" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">有效期至：</label>
        <div class="controls">
            <input name="validity" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${cmsDemandInformation.validity}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">需求信息简介：</label>
        <div class="controls">
            <form:textarea path="requiredEnterprise" htmlEscape="false" rows="4" maxlength="255"
                           class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="cms:cmsDemandInformation:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                         type="submit"
                                                                         value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>