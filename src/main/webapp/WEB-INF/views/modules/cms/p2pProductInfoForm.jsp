<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>产品供给信息管理</title>
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
                        productPrice: {
                            required: true,
                            number: true,
                            min: 0
                        },
                        supplyEnterprise: {
                            required: true,
                            maxlength: 50
                        },
                        minOrder: {
                            required: true,
                            digits: true,
                            min: 0
                        },
                        maxSupplyAmount: {
                            required: true,
                            digits: true,
                            min: 0
                        },
                        productInfo: {
                            required: true,
                            maxlength: 500
                        },
                        periodForDelivery: {
                            required: true,
                            digits: true,
                            range: [0, 500]
                        },
                        supplyEnterpriseInfo: {
                            required: true,
                            maxlength: 500
                        }
                    },
                    messages: {
                        productName: {
                            required: "不能为空",
                            maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                        },
                        productPrice: {
                            required: "不能为空",
                            number: "请输入合法数字",
                            min: $.format("请输入一个不小于 {0} 的数字")
                        },
                        supplyEnterprise: {
                            required: "不能为空",
                            maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                        },
                        minOrder: {
                            required: "不能为空",
                            digits: "请输入一个整数",
                            min: $.format("请输入一个不小于 {0} 的数字")
                        },
                        maxSupplyAmount: {
                            required: "不能为空",
                            digits: "请输入一个整数",
                            min: $.format("请输入一个不小于 {0} 的数字")
                        },
                        productInfo: {
                            required: "不能为空",
                            maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
                        },
                        periodForDelivery: {
                            required: "不能为空",
                            digits: "请输入一个整数",
                            range: $.format("请输入一个介于 {0} 和 {1} 之间的值")
                        },
                        supplyEnterpriseInfo: {
                            required: "不能为空",
                            maxlength: $.format("请输入一个长度最多是 {0} 的字符串")
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
    <li><a href="${ctx}/cms/p2pProductInfo/">产品供给信息列表</a></li>
    <li class="active"><a href="${ctx}/cms/p2pProductInfo/form?id=${p2pProductInfo.id}">产品供给信息<shiro:hasPermission
            name="cms:p2pProductInfo:edit">${not empty p2pProductInfo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="cms:p2pProductInfo:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pProductInfo" action="${ctx}/cms/p2pProductInfo/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">产品名称：</label>
        <div class="controls">
            <form:input path="productName" name="productName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
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
        <label class="control-label">供给企业：</label>
        <div class="controls">
            <form:input path="supplyEnterprise" name="supplyEnterprise" htmlEscape="false" maxlength="255"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">最小起订量：</label>
        <div class="controls">
            <form:input path="minOrder" name="minOrder" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">最大供货量：</label>
        <div class="controls">
            <form:input path="maxSupplyAmount" name="maxSupplyAmount" htmlEscape="false" maxlength="32"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">产品信息：</label>
        <div class="controls">
            <form:textarea path="productInfo" name="productInfo" htmlEscape="false" rows="4" maxlength="1000"
                           class="input-xxlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">发货期限(天)：</label>
        <div class="controls">
            <form:input path="periodForDelivery" name="periodForDelivery" htmlEscape="false" maxlength="16"
                        class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">供货企业信息简介：</label>
        <div class="controls">
            <form:textarea path="supplyEnterpriseInfo" name="supplyEnterpriseInfo" htmlEscape="false" rows="4"
                           maxlength="1000" class="input-xxlarge "/>
        </div>
    </div>
    <!-- <div class="control-group"> -->
    <!-- <label class="control-label">产品图片：</label> -->
    <!-- <div class="controls"> -->
    <!-- <form:input path="productPic" htmlEscape="false" maxlength="255" class="input-xlarge "/> -->
    <!-- </div> -->
    <!-- </div> -->
    <!-- <div class="control-group"> -->
    <!-- <label class="control-label">备注信息：</label> -->
    <!-- <div class="controls"> -->
    <!-- <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/> -->
    <!-- </div> -->
    <!-- </div> -->
    <div class="form-actions">
        <shiro:hasPermission name="cms:p2pProductInfo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                                   value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>