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
        企业信息申诉审核
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
        <td>初审说明</td>
        <td>${p2pInformationAppeal.firstReviewExplain}</td>
    </tr>
</table>
<form action="${ctx}/creditreport/p2pInformationAppeal/p2pInformationAppealForm" id="" method="post"
      modelAttribute="p2pInformationAppeal">
    <table class="table table-striped table-bordered table-condensed" id="table3">
        <caption><b>初审</b></caption>
        <tr>
            <input type="hidden" name="id" value="${p2pInformationAppeal.id}">
            <td style="text-align: right;">申诉审核状态</td>
            <td>
                <select name="appeal_audit_state" class="input-medium-select"
                        onchange=toSelect(this.options[this.options.selectedIndex].value);>
                    <option value="1">待初审</option>
                    <option value="4">申诉失败</option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align:right;">初审意见</td>
            <textarea rows="4">${p2pInformationAppeal.appealReason}</textarea>
            </td>
        </tr>
    </table>
    <input id="btnSubmit03" class="btn btn-default" type="submit" value="提交"/>
</form>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>