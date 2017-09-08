<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>借贷产品立项审核页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(function () {
            $('textarea').attr("readonly", "readonly");
        });
        function toSelect(value) {
            if (value == "1") {
                $('textarea').val("");
                $('textarea').attr("readonly", "readonly");
            } else if (value = "0") {
                $('textarea').removeAttr("readonly");
            }
        }
    </script>
</head>
<body>
<div class="title"><h3>借贷产品立项审核</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>借款期限</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>申请金额</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount }</fmt:formatNumber>元</td>
    </tr>
    <tr>
        <td>筹集期限</td>
        <td>${p2pFinancingInformation.raiseTimeLimit}天</td>
        <td>还款方式</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode , 'repayment_mode', '')}</td>
    </tr>
    </tbody>
</table>
<h4>企业简介</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName }</td>
        <td>注册地址</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.registeredAddress }</td>
    </tr>
    <tr>
        <td>企业规模</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseScale , 'enterprise_scale', '')}</td>
        <td>企业性质</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseNature , 'enterprise_nature', '')}</td>
    </tr>
    <tr>
        <td>所属行业</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.industryCode}</td>
        <td>实缴资本</td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pFinancingInformation.p2pEnterpriseCertify.realCapital}</fmt:formatNumber>元
        </td>
    </tr>
    <tr>
        <td>经营区域</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.businessArea}</td>
        <td>所在地</td>
        <td>${area}</td>
    </tr>
    <tr>
        <td>企业经营范围</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.businessScope}</td>
        <td>是否存在境外交易</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.isOffshoreTransaction,'yes_no','')}</td>
    </tr>
    <tr>
        <td>营业执照登记机关</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.registrationAuthority}</td>
        <td>营业执照登记状态</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.registrationState,'registration_state','')}</td>
    </tr>
    <tr>
        <td style="text-align:right;">营业执照核准日期</td>
        <td colspan="4"><fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${p2pFinancingInformation.p2pEnterpriseCertify.quasiNuclearDate}"/></td>
    </tr>
    </tbody>
</table>
<h4>借款用途</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>用途类别</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.purposeClassification , 'purpose_classification', '')}</td>
        <td>用途说明</td>
        <td>${p2pFinancingInformation.purposeExplain }</td>
    </tr>
    </tbody>
</table>
<h4>还款来源</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>第一还款来源<b style="color:#C1181D;font-size:16px;">&nbsp*</b></td>
        <td>${p2pFinancingInformation.repaymentFirstSource }</td>
        <td>第二还款来源</td>
        <td>${p2pFinancingInformation.repaymentSecondSource }</td>
    </tr>
    <tr>
        <td>第三还款来源</td>
        <td>${p2pFinancingInformation.repaymentThirdSource }</td>
        <td>其他还款来源</td>
        <td>${p2pFinancingInformation.repaymentOtherSource }</td>
    </tr>
    </tbody>
</table>

<form action="${ctx}/financing/p2pBeforeMatchDebtState/debtProjectAudit" id="renzhengFinal" method="post">
    <h4>立项意见</h4>
    <input type="hidden" name="finacingInformationId" value="${p2pFinancingInformation.id}"/>
    <table class="table table-striped table-bordered table-condensed opinion" id="table3">
        <tr>
            <td>操作人</td>
            <td>
                <input type="text" value="${fns:getUser().name}" readonly="readonly"/>
            </td>
            <td>操作时间</td>
            <td>
                <input name="date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                       value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">立项意见</td>
            <td>
                <select name="progress_stage" class="input-medium-select"
                        onchange=toSelect(this.options[this.options.selectedIndex].value);>
                    <option value="1">同意立项</option>
                    <option value="0">不同意立项，结项</option>
                </select>
            </td>
            <td style="text-align:right;">不同意意见</td>
            <td><textarea rows="4" name="handleResult"></textarea>
            </td>
        </tr>
    </table>
    <input id="btnSubmit03" class="btn btn-default" type="submit" value="提交"/>
</form>
</body>
</html>