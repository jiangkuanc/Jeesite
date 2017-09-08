<%@page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>申请债项详情</title>
    <meta name="decorator" content="default"/>
    <style>
        table tr td {
            width: 105px;
        }
    </style>
</head>
<body>
<!-- 申请债项详情 -->
<h4>申请债项详情</h4>
<!-- 债项信息 -->
<table class="table table-striped table-bordered table-condensed">
    <caption>债项信息</caption>
    <tbody>
    <tr>
        <td>借款期限*</td>
        <td>${p2pFinancingInformation.financingMaturity}</td>
        <td>借款金额*</td>
        <td>${p2pFinancingInformation.financingAmount}</td>
    </tr>
    <tr>
        <td>筹集期限*</td>
        <td>${p2pFinancingInformation.raiseTimeLimit}</td>
        <td>还款方式*</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, '	repayment_mode', '')}</td>
    </tr>
    </tbody>
</table>
<!-- 企业简介 -->
<table class="table table-striped table-bordered">
    <caption>企业简介</caption>
    <tbody>
    <tr>
        <td>企业名称*</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
        <td>注册地址*</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.registeredAddress}</td>
    </tr>
    <tr>
        <td>企业规模*</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseScale, 'enterprise_scale', '')}</td>
        <td>企业性质*</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseNature, 'enterprise_nature', '')}</td>
    </tr>
    <tr>
        <td>所属行业*</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.industryCode, 'industry_code', '')}</td>
        <td>所在地*</td>
        <td>
            ${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.provincialArea, 'provincial_area', '')}
            ${fns:getDictLabel(p2pFinancingInformation.p2pEnterpriseCertify.municipalArea, 'municipal_area', '')}
        </td>
    </tr>
    <tr>
        <td>企业经营范围*</td>
        <td colspan="3">
            ${p2pFinancingInformation.p2pEnterpriseCertify.businessScope}
        </td>
    </tr>
    </tbody>
</table>
<!-- 借款用途 -->
<table class="table table-striped table-bordered table-condensed">
    <caption>企业简介</caption>
    <tbody>
    <tr>
        <td>用途类别*</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.purposeClassification, 'purpose_classification', '')}</td>
        <td>用途说明*</td>
        <td>
            ${p2pFinancingInformation.purposeExplain}
        </td>
    </tr>
    </tbody>
</table>
<table class="table table-striped table-bordered table-condensed">
    <caption>还款来源</caption>
    <tbody>
    <tr>
        <td>第一还款来源*</td>
        <td>
            ${p2pFinancingInformation.repaymentFirstSource}
        </td>
        <td>第二还款来源*</td>
        <td>
            ${p2pFinancingInformation.repaymentSecondSource}
        </td>
    </tr>
    <tr>
        <td>第三还款来源*</td>
        <td>
            ${p2pFinancingInformation.repaymentThirdSource}
        </td>
        <td>其他还款来源*</td>
        <td>
            ${p2pFinancingInformation.repaymentOtherSource}
        </td>
    </tr>
    </tbody>
</table>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>