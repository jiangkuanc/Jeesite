<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>资产评估审核页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitForm").validate({
                rules: {
                    rejectReason: {
                        required: true,
                        maxlength: 200
                    }
                },
                messages: {
                    rejectReason: {
                        required: "必填信息",
                        maxlength: "不能超过200个字符"
                    }
                },
                submitHandler: function (form) {
                    swal({
                        title: "确认提交吗？",
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


            $("select[name='isReject']").change(function () {
                var obj = $("textarea[name='rejectReason']");
                if (this.value == 1) {
                    obj.val("");
                    obj.attr("disabled", "disabled");
                }
                if (this.value == 2 || this.value == 3) {
                    obj.removeAttr("disabled");
                    obj.attr("required", "required");
                }
            });
        });
    </script>

</head>
<body>
<div class="title"><h3>资产评估审核页</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>企业信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName }</td>
        <td>申请金额（元）</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount }</fmt:formatNumber></td>
    </tr>
    <tr>
        <td>借贷产品期限</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>还款方式</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
    </tr>
    </tbody>
</table>
<h4>评级信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>评级级别</th>
        <th>批复利率</th>
        <th>批复额度（元）</th>
        <th>是否增信</th>
        <th>增信额度（元）</th>
        <th>标的类型</th>
        <th>增信类型</th>
    </tr>
    <tr>
        <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel }</td>
        <td><fmt:formatNumber pattern="#0.00">${p2pFinancingInformation.recommendedRate*100}</fmt:formatNumber>%</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber></td>
        <td>${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.wetherRep, 'yes_no', '')}</td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.repCount}</fmt:formatNumber></td>
        <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
        <td>抵质押</td>
    </tr>
    </tbody>
</table>
<h4>评估结果</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>评估结果时间</td>
        <td><fmt:formatDate value="${p2pAssetValuationRecord.commitTime }" pattern="yyyy-MM-dd"/></td>
        <td>联系人</td>
        <td>${p2pAssetValuationRecord.p2pAssetValuation.user.name }</td>
    </tr>
    <tr>
        <td>资产评估额（元）</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pAssetValuationRecord.assetValuation}</fmt:formatNumber></td>
        <td>资产评估报告</td>
        <td>
            <a onclick="modelView('${p2pAssetValuationRecord.assessmentReport }')">
                ${p2pAssetValuationRecord.assessmentReportName }
            </a>
        </td>
    </tr>
    <tr>
        <td>资产评估合同</td>
        <td>
            <a onclick="modelView('${p2pAssetValuationRecord.evaluationContract }')">
                ${p2pAssetValuationRecord.evaluationContractName }
            </a>
        </td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
<form id="submitForm" action="${ctx}/before/buxin/assetValuationAudit" method="post">
    <h4>审核意见</h4>
    <input name="id" type="hidden" value="${p2pAssetValuationRecord.id }">
    <input name="financingInformationId" type="hidden" value="${p2pAssetValuationRecord.financingInformationId }">
    <input name="assetValuation" type="hidden" value="${p2pAssetValuationRecord.assetValuation }">
    <input name="markType" type="hidden" value="${p2pFinancingInformation.markType }">
    <c:choose>
        <c:when test="${p2pAssetValuationRecord.isReject == 0}">
            <table id="contentTable" class="table table-striped table-bordered table-condensed opinion">
                <tr>
                    <td>审核意见</td>
                    <td>
                        <select name="isReject" class="input-medium-select">
                            <option value="1" selected="selected">通过</option>
                            <option value="2">不通过</option>
                            <option value="3">借贷产品结束</option>
                        </select>
                    </td>
                    <td>不通过原因</td>
                    <td><textarea name="rejectReason" disabled="disabled"></textarea></td>
                </tr>
                <tr>
                    <td>操作人</td>
                    <td><input type="hidden" name="rejectPerson"
                               value="${fns:getUser().id}"/> ${fns:getUser().name}</td>
                    <td>操作时间</td>
                    <td><input name="rejectTime" type="text" readonly="readonly"
                               maxlength="20" class="input-medium Wdate "
                               value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/></td>
                </tr>
            </table>
            <div class="row" id="button">
                <div class="text-center">
                    <input id="btnSubmit" class="btn btn-primary" type="submit" value="确定"/>
                    <input id="btnCancel" class="btn btn-primary" type="button" value="取消" onclick="history.go(-1)"/>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <table id="contentTable" class="table table-striped table-bordered table-condensed opinion">
                <tr>
                    <td>审核意见</td>
                    <td>${fns:getDictLabel(p2pAssetValuationRecord.isReject , 'buxin_state', '')}</td>
                    <td>不通过原因</td>
                    <td>${p2pAssetValuationRecord.rejectReason }</td>
                </tr>
                <tr>
                    <td>操作人</td>
                    <td>${fns:getUserById(p2pAssetValuationRecord.rejectPerson).name }</td>
                    <td>操作时间</td>
                    <td><fmt:formatDate value="${p2pAssetValuationRecord.rejectTime }"
                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
            </table>
        </c:otherwise>
    </c:choose>
</form>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>