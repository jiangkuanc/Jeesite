<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%--
平台运营数据披露表
@author Zeus
@version 2016-11-25
版权所有: 大公信用软件有限公司
http://www.dagongsoftware.com
--%>
<html>
<head>
    <title>平台运营数据披露表管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#inputForm").validate({
                //debug:true,//进行调试模式（表单不提交）
                rules: {

                    //交易总额
                    tradeTotalAmount: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    //交易总笔数
                    tradeTotalNumber: {
                        digits: true,
                        required: true,
                        max: 99999
                    },
                    //融资总人数
                    financingTotalPeople: {
                        digits: true,
                        required: true,
                        max: 99999
                    },
                    //投资人总数
                    investmentTotalPeople: {
                        digits: true,
                        required: true,
                        max: 99999
                    },
                    //代偿金额
                    compensatoryAmount: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 逾期金额
                    overdueAmount: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 总项目个数
                    projectTotalNumber: {
                        digits: true,
                        required: true,
                        max: 99999
                    },
                    // 项目逾期率
                    projectOverdueRate: {
                        number: true,
                        required: true,
                        rateNumber: true
                    },
                    // 金额逾期率
                    amountOverdueRate: {
                        number: true,
                        required: true,
                        rateNumber: true
                    },
                    // 逾期项目数
                    overdueProjectNumber: {
                        digits: true,
                        required: true,
                        max: 99999
                    },
                    // 人均累计融资金额
                    renjunFinancingAmount: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 人均累计投资金额
                    renjunInvestmentAmount: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 笔均融资金额
                    bijunFinancingAmount: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 最大单户融资余额
                    maxSingleRzye: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 最大十户融资余额
                    maxTenRzye: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 最大单户融资余额占比
                    maxSingleRzyezb: {
                        number: true,
                        required: true,
                        rateNumber: true
                    },
                    // 最大十户融资余额占比
                    maxTenRzyezb: {
                        number: true,
                        required: true,
                        rateNumber: true
                    },
                    // 投资收益
                    financingEarn: {
                        number: true,
                        required: true,
                        moneyNumber: true
                    },
                    // 历史年化收益率
                    historicalAnnualYield: {
                        number: true,
                        required: true,
                        rateNumber: true
                    },
                    //外网注册总人数
                    registerCount: {
                        digits: true,
                        required: true,
                        max: 99999
                    }
                },
                messages: {},
                submitHandler: function (form) {
                    swal({
                        title: "确认保存修改吗？",
                        showCancelButton: true,
                        type: "info",
                    }, function (inputValue) {
                        if (inputValue === false) {
                            return false;
                        }
                        form.submit();
                    });

                }
            });


        });
    </script>
</head>
<body>
<%--<ul class="nav nav-tabs">
    <li><a href="${ctx}/operation/p2pPlatformOperationDataShow/">平台运营数据披露表</a></li>
    <li class="active"><a>平台运营数据披露表修改</a></li>
</ul><br/>
--%>
<div class="title"><h3>修改平台运营数据披露信息</h3></div>
<form:form id="inputForm" modelAttribute="p2pPlatformOperationDataShow"
           action="${ctx}/operation/p2pPlatformOperationDataShow/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="pull-left" style="width:50%">
            <%--<div class="control-group">
                <label class="control-label">日期：</label>
                <div class="controls">

                    <input name="historyDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                        value="<fmt:formatDate value="${p2pPlatformOperationDataShow.historyDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                </div>
            </div>--%>
        <div class="control-group">
            <label class="control-label">交易总额：</label>
            <div class="controls">
                <form:input path="tradeTotalAmount" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">交易总笔数：</label>
            <div class="controls">
                <form:input path="tradeTotalNumber" htmlEscape="false" maxlength="11" class="input-xlarge"/>&nbsp;笔
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">融资人总数：</label>
            <div class="controls">
                <form:input path="financingTotalPeople" htmlEscape="false" maxlength="11" class="input-xlarge"/>&nbsp;人
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">投资人总数：</label>
            <div class="controls">
                <form:input path="investmentTotalPeople" htmlEscape="false" maxlength="11" class="input-xlarge"/>&nbsp;人
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">代偿金额：</label>
            <div class="controls">
                <form:input path="compensatoryAmount" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">逾期金额：</label>
            <div class="controls">
                <form:input path="overdueAmount" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">总项目个数：</label>
            <div class="controls">
                <form:input path="projectTotalNumber" htmlEscape="false" maxlength="11" class="input-xlarge"/>&nbsp;个
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">项目逾期率：</label>
            <div class="controls">
                <form:input path="projectOverdueRate" htmlEscape="false" class="input-xlarge"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">金额逾期率：</label>
            <div class="controls">
                <form:input path="amountOverdueRate" htmlEscape="false" class="input-xlarge"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">逾期项目数：</label>
            <div class="controls">
                <form:input path="overdueProjectNumber" htmlEscape="false" maxlength="11" class="input-xlarge"/>&nbsp;个
            </div>
        </div>
    </div>
    <div class="pull-left" style="width:50%">
        <div class="control-group">
            <label class="control-label">人均累计融资金额：</label>
            <div class="controls">
                <form:input path="renjunFinancingAmount" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">人均累计投资金额：</label>
            <div class="controls">
                <form:input path="renjunInvestmentAmount" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">笔均融资金额：</label>
            <div class="controls">
                <form:input path="bijunFinancingAmount" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">最大单户融资余额：</label>
            <div class="controls">
                <form:input path="maxSingleRzye" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">最大十户融资余额：</label>
            <div class="controls">
                <form:input path="maxTenRzye" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">最大单户融资余额占比：</label>
            <div class="controls">
                <form:input path="maxSingleRzyezb" htmlEscape="false" class="input-xlarge"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">最大十户融资余额占比：</label>
            <div class="controls">
                <form:input path="maxTenRzyezb" htmlEscape="false" class="input-xlarge"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">投资收益：</label>
            <div class="controls">
                <form:input path="financingEarn" htmlEscape="false" class="input-xlarge"/>&nbsp;元
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">历史年化收益率：</label>
            <div class="controls">
                <form:input path="historicalAnnualYield" htmlEscape="false" class="input-xlarge"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">外网注册总人数：</label>
            <div class="controls">
                <form:input path="registerCount" htmlEscape="false" maxlength="11" class="input-xlarge"/>&nbsp;人
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>