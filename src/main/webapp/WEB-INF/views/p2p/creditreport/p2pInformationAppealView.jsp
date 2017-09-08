<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业信息申诉表管理审核</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        /* $(function(){
         alert('${p2pBeforeMatchDebtState.progressStage}');
         }); */
    </script>
</head>
<body>
<div class="page-header">
    <h4>
        企业信息申诉查看
    </h4>
</div>
<table id="table1" class="table table-striped table-bordered table-condensed">

    <tr>
        <td>企业用户编号*</td>
        <td>${p2pInformationAppeal.user.id}</td>
        <td>信用报告编号*</td>
        <td>${p2pInformationAppeal.creditReportId}</td>
    </tr>
    <tr>
        <td>信用信息类型*</td>
        <td>${fns:getDictLabel(p2pInformationAppeal.creditInfoType,'credit_info_type','')}</td>
        <td>指标编号*</td>
        <td>${p2pInformationAppeal.indexId}</td>
    </tr>
    <tr>
        <td>申诉类型*</td>
        <td>${p2pInformationAppeal.appealCategory}</td>
        <td>申诉理由*</td>
        <td>${p2pInformationAppeal.appealReason}</td>
    </tr>
    <tr>
        <td>申请时间*</td>
        <td>${p2pInformationAppeal.appealReason}</td>
        <td>附件名*</td>
        <td>${p2pInformationAppeal.appealReason}</td>
    </tr>
    <tr>
        <td>上传附件地址*</td>
        <td>${p2pInformationAppeal.appealReason}</td>
    </tr>
</table>

<table class="table table-striped table-bordered table-condensed" id="table3">
    <caption><b>初审</b></caption>
    <tr style="text-align: center;">
        <td>初审意见</td>
        <td>${p2pInformationAppeal.appealReason}</td>
        <td>初审员</td>
        <td>
            ${p2pInformationAppeal.firstReviewStaff}</td>
        </td>
    </tr>
    <tr style="text-align: center;">
        <td>申诉审核状态</td>
        <td>
            <c:choose>
                <c:when test="${p2pInformationAppeal.appealAuditState=='1'}">待初审</c:when>
                <c:when test="${p2pInformationAppeal.appealAuditState=='4'}">申诉失败</c:when>
            </c:choose>
        </td>
        <td>初审说明</td>
        <td>${p2pInformationAppeal.firstReviewExplain}</td>
    </tr>
</table>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>