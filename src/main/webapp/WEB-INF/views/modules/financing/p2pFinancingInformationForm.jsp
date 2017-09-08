<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>融资信息表管理</title>
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
    <li><a href="${ctx}/financing/p2pFinancingInformation/">融资信息表列表</a></li>
    <li class="active"><a
            href="${ctx}/financing/p2pFinancingInformation/form?id=${p2pFinancingInformation.id}">融资信息表<shiro:hasPermission
            name="financing:p2pFinancingInformation:edit">${not empty p2pFinancingInformation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="financing:p2pFinancingInformation:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="p2pFinancingInformation"
           action="${ctx}/financing/p2pFinancingInformation/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">申请人ID，是平台注册用户的ID：</label>
        <div class="controls">
            <form:input path="applicantsId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">债项名称：</label>
        <div class="controls">
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">当前阶段，用数字代号表示：提交、审核、评级、发布：</label>
        <div class="controls">
            <form:input path="currentStage" htmlEscape="false" maxlength="16" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资申请提交时间：</label>
        <div class="controls">
            <input name="commitTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pFinancingInformation.commitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资发布时间：</label>
        <div class="controls">
            <input name="publishTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资期限，单位为月数，如：6个月、12个月、24个月：</label>
        <div class="controls">
            <form:input path="financingMaturity" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">is_guarantee：</label>
        <div class="controls">
            <form:input path="isGuarantee" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资金额，最低5万，金额为100的倍数：</label>
        <div class="controls">
            <form:input path="financingAmount" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">募集期限，单位为天数，如：3天、10天、15天：</label>
        <div class="controls">
            <form:input path="raiseTimeLimit" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">还款方式，字典项，如：一次性还本付息、按月付息到期还本：</label>
        <div class="controls">
            <form:input path="repaymentMode" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业名称：</label>
        <div class="controls">
            <form:input path="enterpriseName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">注册地址：</label>
        <div class="controls">
            <form:input path="registeredAddress" htmlEscape="false" maxlength="128" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业规模，字典项，以员工数量为维度，如：50人以下、50人-100人：</label>
        <div class="controls">
            <form:input path="enterpriseScale" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">企业性质，字典项，如：合资企业、独资企业、国有企业、私营企业等：</label>
        <div class="controls">
            <form:input path="enterpriseNature" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属行业代码，使用标准国民经济行业分类：</label>
        <div class="controls">
            <form:input path="industryCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属地区代码，使用国家行政区域代码：</label>
        <div class="controls">
            <form:input path="govAreaCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所在地--省级：</label>
        <div class="controls">
            <form:input path="provincialArea" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所在地--市级：</label>
        <div class="controls">
            <form:input path="municipalArea" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所在地--县级：</label>
        <div class="controls">
            <form:input path="countyArea" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资用途分类，字典项，如：用于投资、新建工程、补充流动资金等：</label>
        <div class="controls">
            <form:input path="purposeClassification" htmlEscape="false" maxlength="32" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">融资用途说明：</label>
        <div class="controls">
            <form:input path="purposeExplain" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">第一还款来源的说明：</label>
        <div class="controls">
            <form:input path="repaymentFirstSource" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">第二还款来源的说明：</label>
        <div class="controls">
            <form:input path="repaymentSecondSource" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">第三还款来源的说明：</label>
        <div class="controls">
            <form:input path="repaymentThirdSource" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">其他还款来源的说明：</label>
        <div class="controls">
            <form:input path="repaymentOtherSource" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">剩余募集金额：</label>
        <div class="controls">
            <form:input path="restRaiseMoney" htmlEscape="false" maxlength="10" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">剩余还款金额：</label>
        <div class="controls">
            <form:input path="restRepaymetMoney" htmlEscape="false" maxlength="10" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="financing:p2pFinancingInformation:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                                  type="submit"
                                                                                  value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>