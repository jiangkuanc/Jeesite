<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>产品需求信息管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            debug:true,
                $("#inputForm").validate({
                    rules: {
                        productName: {
                            required: true,
                            maxlength: 50
                        },
                        demandEnterprise: {
                            required: true,
                            maxlength: 50
                        },
                        productPrice: {
                            required: true,
                            number: true,
                            min: 0
                        },
                        demandQuantity: {
                            required: true,
                            digits: true,
                            min: 0
                        },
                        periodForDelivery: {
                            required: true,
                            digits: true,
                            range: [0, 500]
                        }
                    },
                    messages: {
                        productName: {
                            required: "不能为空",
                            maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                        },
                        demandEnterprise: {
                            required: "不能为空",
                            maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                        },
                        productPrice: {
                            required: "不能为空",
                            number: "请输入合法数字",
                            min: $.format("请输入一个不小于 {0} 的数字")
                        },
                        demandQuantity: {
                            required: "不能为空",
                            digits: "请输入一个整数",
                            min: $.format("请输入一个不小于 {0} 的数字")
                        },
                        periodForDelivery: {
                            required: "不能为空",
                            digits: "请输入一个整数",
                            range: $.format("请输入一个介于 {0} 和 {1} 之间的值")
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
    <li><a href="${ctx}/cms/cmsRequirementInformation/">产品需求信息列表</a></li>
    <li class="active"><a
            href="${ctx}/cms/cmsRequirementInformation/form?id=${cmsRequirementInformation.id}">产品需求信息<shiro:hasPermission
            name="cms:cmsRequirementInformation:edit">${not empty cmsRequirementInformation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="cms:cmsRequirementInformation:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="cmsRequirementInformation" action="${ctx}/cms/cmsRequirementInformation/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">产品名称：</label>
        <div class="controls">
            <form:input path="productName" name="productName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">需求企业：</label>
        <div class="controls">
            <form:input path="demandEnterprise" name="demandEnterprise" htmlEscape="false" maxlength="255"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">产品单价(元)：</label>
        <div class="controls">
            <form:input path="productPrice" name="productPrice" htmlEscape="false" maxlength="32"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">需求数量：</label>
        <div class="controls">
            <form:input path="demandQuantity" name="demandQuantity" htmlEscape="false" maxlength="255"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">发货期限(天)：</label>
        <div class="controls">
            <form:input path="periodForDelivery" name="periodForDelivery" htmlEscape="false" maxlength="16"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="cms:cmsRequirementInformation:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                              type="submit"
                                                                              value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>