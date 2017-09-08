<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>申请项目详情页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
    </script>
</head>
<body>
<div class="page-header">
    <h4>
        申请债项详情
    </h4>
</div>
<%-- <table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
        <tr>
            <th>债项信息</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td width="10%">企业名称</td><td width="40%">${enterpriseName}</td>
            <td width="10%">债项名称</td><td width="40%">${vo.finacingName}</td>
        </tr>
        <tr>
            <td >申请金额</td>
            <td><c:if test="${!empty vo.financingAmount}"><fmt:formatNumber pattern="#,##0.00">${vo.financingAmount}</fmt:formatNumber>元</c:if></td>
            <td >融资期限</td>
            <td><c:if test="${!empty vo.raiseTimeLimit}">${vo.raiseTimeLimit}天</c:if></td>
        </tr>
        <tr>
            <td>申请人</td><td>${regUserCertify.realName }</td>
            <td>还款方式</td><td>${fns:getDictLabel(vo.repaymentMode,'repayment_mode','')}</td>
        </tr>
        <tr>
            <td>申请利率</td><td>${vo.applicationRate *100} %</td>
            <td>申请利率还款金额</td>
            <td><c:if test="${!empty applyAmount}"><fmt:formatNumber pattern="#,##0.00">${applyAmount}</fmt:formatNumber>元</c:if></td>
        </tr>
        <tr>
            <td>借款时长</td>
            <td><c:if test="${!empty vo.financingMaturity }">${vo.financingMaturity }个月</c:if></td>
            <td>实际利率还款金额</td>
            <td><c:if test="${!empty fic:getRepaymentAmount(vo)}"><fmt:formatNumber pattern="#,##0.00">${fic:getRepaymentAmount(vo)}</fmt:formatNumber>元</c:if></td>
        </tr>
        <tr>
            <td >借款用途类别</td>
            <td>${fns:getDictLabel(vo.purposeClassification,'purpose_classification','')}</td>
            <td>用途说明</td>
            <td>${vo.purposeExplain}</td>
        </tr>
        <tr>
            <td >第一笔还款来源</td>
            <td>${vo.repaymentFirstSource}</td>
            <td >第二笔还款来源</td>
            <td>${vo.repaymentSecondSource}</td>
        </tr>
        <tr>
            <td >第三笔还款来源</td>
            <td>${vo.repaymentThirdSource}</td>
            <td >其他还款来源</td>
            <td>${vo.repaymentOtherSource}</td>
        </tr>
        <tr>
            <td >是否担保</td>
            <td>${fns:getDictLabel(vo.isGuarantee,'is_guarantee','')}</td>
            <td >债项状态</td>
            <td>${fns:getDictLabel(vo.currentStage,'progress_stage','')}</td>
        </tr>
    </tbody>
</table> --%>
<table id="table1" class="table table-striped table-bordered table-condensed">
    <caption>债项信息</caption>
    <tr>
        <td>借款期限*</td>
        <td>${vo.financingMaturity}</td>
        <td>借款金额*</td>
        <td>${vo.applicationAmount}</td>
    </tr>
    <tr>
        <td>筹集期限*</td>
        <td>${vo.raiseTimeLimit}</td>
        <td>还款方式*</td>
        <td>${fns:getDictLabel(vo.repaymentMode,'repayment_mode','')}</td>
    </tr>
</table>
<table id="table2" class="table table-striped table-bordered table-condensed">
    <caption>企业简介</caption>
    <tr>
        <td>企业名称*</td>
        <td>${vo.p2pEnterpriseCertify.enterpriseName}</td>
        <td>注册地址*</td>
        <td>${vo.p2pEnterpriseCertify.registeredAddress}</td>
    </tr>
    <tr>
        <td>企业规模*</td>
        <td>${fns:getDictLabel(vo.p2pEnterpriseCertify.enterpriseScale,'enterprise_scale','')}</td>
        <td>企业性质*</td>
        <td>${fns:getDictLabel(vo.p2pEnterpriseCertify.enterpriseNature,'enterprise_nature','')}</td>
    </tr>
    <tr>
        <td>所属行业*</td>
        <td>${fns:getDictLabel(vo.p2pEnterpriseCertify.industryCode,'industry_code','')}</td>
        <td>所在地*</td>
        <td>
            <%-- ${fns:getDictLabel(vo.p2pEnterpriseCertify.provincialArea,'provincial_area','')}
            ${fns:getDictLabel(vo.p2pEnterpriseCertify.municipalArea,'municipal_area','')} --%>
            ${vo.p2pEnterpriseCertify.provincialArea}${vo.p2pEnterpriseCertify.municipalArea}
        </td>
    </tr>
    <tr>
        <td>企业经营范围*</td>
        <td colspan="4">
            ${vo.p2pEnterpriseCertify.businessScope}
        </td>
    </tr>
</table>
<table id="table3" class="table table-striped table-bordered table-condensed">
    <caption>借款用途</caption>
    <tr>
        <td>用途类别*</td>
        <td>${fns:getDictLabel(vo.purposeClassification,'purpose_classification','')}</td>
        <td>用途说明*</td>
        <td>${vo.purposeExplain}</td>
    </tr>
</table>
<table id="table4" class="table table-striped table-bordered table-condensed">
    <caption>还款来源</caption>
    <tr>
        <td>第一还款来源*</td>
        <td>${vo.repaymentFirstSource}</td>
        <td>第二还款来源*</td>
        <td>${vo.repaymentSecondSource}</td>
    </tr>
    <tr>
        <td>第三还款来源*</td>
        <td>${vo.repaymentThirdSource}</td>
        <td>其他还款来源*</td>
        <td>${vo.repaymentOtherSource}</td>
    </tr>
</table>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>