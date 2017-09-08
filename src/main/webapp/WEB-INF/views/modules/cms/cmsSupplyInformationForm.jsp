<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>供给信息管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            jQuery.validator.addMethod("isMobile", function (value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写您的手机号码");

            $("#inputForm").validate({
                rules: {
                    productPrice: {
                        required: true,
                        number: true,
                        min: 0
                    },
                    contacts: {
                        required: true,
                        rangelength: [2, 5]
                    },
                    duty: {
                        required: true,
                        maxlength: 20
                    },
                    phone: {
                        required: true,
                        minlength: 11,
                        isMobile: true
                    },
                    companyName: {
                        required: true,
                        maxlength: 50
                    },
                    companyEnterprise: {
                        required: true,
                        maxlength: 500
                    },
                    minOrder: {
                        required: true,
                        digits: true,
                        min: 0
                    }
                },
                messages: {
                    productPrice: {
                        required: "不能为空",
                        number: "请输入合法数字",
                        min: $.format("请输入一个不小于 {0} 的数字")
                    },
                    contacts: {
                        required: "不能为空",
                        rangelength: $.format("请输入一个长度介于 {0} 和 {1} 之间的字符串")
                    },
                    duty: {
                        required: "不能为空",
                        maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                    },
                    phone: {
                        required: "手机号码不能为空",
                        minlength: "确认手机不能小于11个字符",
                        isMobile: "请正确填写手机号码"
                    },
                    companyName: {
                        required: "不能为空",
                        maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                    },
                    companyEnterprise: {
                        required: "不能为空",
                        maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                    },
                    minOrder: {
                        required: "不能为空",
                        digits: "请输入一个整数",
                        min: $.format("请输入一个不小于 {0} 的数字")
                    }
                },
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
            <select name="productId" class="input-xlarge">
                <c:forEach items="${p2pProductInfoList}" var="vo">
                    <option value="${vo.id}">${vo.productName}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">产品价格：</label>
        <div class="controls">
            <form:input path="productPrice" name="productPrice" htmlEscape="false" maxlength="64"
                        class="input-xlarge "/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">联系人：</label>
        <div class="controls">
            <form:input path="contacts" name="contacts" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">职务：</label>
        <div class="controls">
            <form:input path="duty" name="duty" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">联系电话：</label>
        <div class="controls">
            <form:input path="phone" name="phone" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业名称：</label>
        <div class="controls">
            <form:input path="companyName" name="companyName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
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
            <form:textarea path="companyEnterprise" name="companyEnterprise" htmlEscape="false" rows="4" maxlength="255"
                           class="input-xxlarge "/>
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
            <form:input path="minOrder" name="minOrder" htmlEscape="false" maxlength="32" class="input-xlarge "/>
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