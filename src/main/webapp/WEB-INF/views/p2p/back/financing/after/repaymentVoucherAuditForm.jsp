<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>还款凭证审核页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitForm").validate({
                rules: {
                    repaymentAuditReason: {
                        required: true,
                        maxlength: 200
                    }
                },
                messages: {
                    repaymentAuditReason: {
                        required: "必填信息",
                        maxlength: "不能超过200个字符"
                    }
                },

                submitHandler: function (form) {
                    if (temp == 1) {
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
                    } else {
                        swal("", "", "error");
                    }

                }
            });
        });
    </script>

</head>
<body>
<div class="title"><h3>还款凭证审核</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品基本信息</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>借贷产品编号</th>
        <th>债务人名称</th>
        <th>借贷产品名称</th>
        <th>借贷产品额度</th>
        <th>借贷产品类型</th>
        <th>期限</th>
        <th>还款方式</th>
        <th>已募集金额</th>
    </tr>
    <tr>
        <td>${p2pFinancingInformation.id }</td>
        <td>${p2pFinancingInformation.user.name }</td>
        <td>${p2pFinancingInformation.finacingName }</td>
        <td>
            <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>元
            </c:if>
            <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>元
            </c:if>
        </td>
        <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>元</td>
    </tr>
    </tbody>
</table>
<h4>还款记录</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th rowspan="2">账期</th>
        <th colspan="2">当期还款时间</th>
        <th colspan="2">当期本金（元）</th>
        <th colspan="2">当期利息（元）</th>
        <th colspan="2">当期逾期罚息（元）</th>
        <th colspan="2">当期还款合计（元）</th>
        <th rowspan="2">本期是否还清</th>
        <th rowspan="2">还款凭证</th>
    </tr>
    <tr>
        <th>应还</th>
        <th>实还</th>
        <th>应还</th>
        <th>实还</th>
        <th>应还</th>
        <th>实还</th>
        <th>应还</th>
        <th>实还</th>
        <th>应还</th>
        <th>实还</th>
    </tr>
    <tr>
        <td>${p2pRepaymentRecord.p2pRepaymentPlan.phase }</td>
        <td><fmt:formatDate value="${p2pRepaymentRecord.p2pRepaymentPlan.planRepaymentDate }"
                            pattern="yyyy-MM-dd"/></td>
        <td><fmt:formatDate value="${p2pRepaymentRecord.realRepaymentDate }" pattern="yyyy-MM-dd"/></td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pRepaymentRecord.p2pRepaymentPlan.planRepaymentPrincipal }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pRepaymentRecord.realRepaymentPrincipal }</fmt:formatNumber></td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pRepaymentRecord.p2pRepaymentPlan.planRepaymentInterest }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pRepaymentRecord.realRepaymentInterest}</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pRepaymentRecord.p2pRepaymentPlan.fine }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pRepaymentRecord.realRepaymentFine }</fmt:formatNumber></td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pRepaymentRecord.p2pRepaymentPlan.planRepaymentPrincipal + p2pRepaymentRecord.p2pRepaymentPlan.planRepaymentInterest + p2pRepaymentRecord.p2pRepaymentPlan.fine }</fmt:formatNumber></td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pRepaymentRecord.realRepaymentPrincipal + p2pRepaymentRecord.realRepaymentInterest + p2pRepaymentRecord.realRepaymentFine  }</fmt:formatNumber></td>
        <td>
            <c:if test="${p2pRepaymentRecord.p2pRepaymentPlan.repaymentState == 3 }">
                是
            </c:if>
            <c:if test="${p2pRepaymentRecord.p2pRepaymentPlan.repaymentState != 3 }">
                否
            </c:if>
        </td>
        <td>
            <c:if test="${!empty p2pRepaymentRecord.repaymentVoucher}">
                <a onclick="modelView('${p2pRepaymentRecord.repaymentVoucher}')">查看</a>
            </c:if>
        </td>
    </tr>
    </tbody>
</table>

<c:if test="${temp == 1 }">
    <form id="submitForm" action="${ctx }/after/repaymentVoucherAudit/audit" method="post">
        <h4>审核意见</h4>
        <input type="hidden" name="financingInformationId" value="${p2pFinancingInformation.id }">
        <input type="hidden" name="phase" value="${p2pRepaymentRecord.p2pRepaymentPlan.phase }">
        <input type="hidden" name="repaymentRecordId" value="${p2pRepaymentRecord.id }">
        <input type="hidden" name="repaymentVoucher" value="${p2pRepaymentRecord.repaymentVoucher }">
        <input type="hidden" name="repaymentAuditPerson" value="${fns:getUser().id}">
        <input type="hidden" name="realRepaymentDate"
               value="<fmt:formatDate value="${p2pRepaymentRecord.realRepaymentDate }" pattern="yyyy-MM-dd"/>">
        <input type="hidden" name="planRepaymentDate"
               value="<fmt:formatDate value="${p2pRepaymentRecord.p2pRepaymentPlan.planRepaymentDate }" pattern="yyyy-MM-dd"/>">

        <table id="contentTable" class="table table-striped table-bordered table-condensed opinion">
            <tr>
                <td>评审日期</td>
                <td>
                    <input name="repaymentAuditTime" type="text" readonly="readonly"
                           maxlength="20" class="input-medium Wdate "
                           value="${fns:getDate('yyyy-MM-dd HH:mm:ss')}"/>
                </td>
                <td>评审人</td>
                <td>${fns:getUser().name}</td>
            </tr>
            <tr>
                <td>审核意见</td>
                <td>
                    <select onchange="repaymentAuditStateRadioChange()" id="repaymentAuditState"
                            name="repaymentAuditState" class="input-medium-select">
                        <option value="2" selected="selected">通过</option>
                        <option value="3">不通过</option>
                    </select>
                </td>
                <td>不通过原因</td>
                <td><textarea id="repaymentAuditReason" name="repaymentAuditReason" disabled="disabled"></textarea></td>
            </tr>
        </table>
        <div class="text-center">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="确定"/>
            <input id="btnCancel" class="btn btn-primary" type="button" value="取消" onclick="history.go(-1)"/>
        </div>
    </form>
</c:if>
<c:if test="${temp == 2 }">
    <table id="contentTable" class="table table-striped table-bordered table-condensed opinion">
        <tr>
            <td>评审日期</td>
            <td><fmt:formatDate value="${p2pRepaymentRecord.repaymentAuditTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>评审人</td>
            <td>${fns:getUserById(p2pRepaymentRecord.repaymentAuditPerson).name}</td>
        </tr>
        <tr>
            <td>审核意见</td>
            <td>
                <c:choose>
                    <c:when test="${p2pRepaymentRecord.repaymentAuditState == 2 }">通过</c:when>
                    <c:when test="${p2pRepaymentRecord.repaymentAuditState == 3 }">不通过</c:when>
                </c:choose>
            </td>
            <td>不通过原因</td>
            <td>${p2pRepaymentRecord.repaymentAuditReason}</td>
        </tr>
    </table>
</c:if>
<c:if test="${!empty p2pRepaymentVoucherAuditList }">
    <h4>历史审核记录</h4>
    <table class="table table-striped table-bordered table-condensed">
        <tbody>
        <tr>
            <th>序号</th>
            <th>审核时间</th>
            <th>还款凭证</th>
            <th>审核人</th>
            <th>审核意见</th>
            <th>不通过原因</th>
        </tr>
        <c:forEach items="${p2pRepaymentVoucherAuditList}" varStatus="status" var="p2pRepaymentVoucherAudit">
            <tr>
                <td>${status.count }</td>
                <td>
                    <c:if test="${!empty p2pRepaymentVoucherAudit.repaymentAuditTime}">
                        <fmt:formatDate value="${p2pRepaymentVoucherAudit.repaymentAuditTime}"
                                        pattern="yyyy-MM-dd HH:mm:ss"/>
                    </c:if>
                </td>
                <td>
                    <c:if test="${!empty p2pRepaymentVoucherAudit.repaymentVoucher}">
                        <a onclick="modelView('${p2pRepaymentVoucherAudit.repaymentVoucher}')">查看</a>
                    </c:if>
                </td>
                <td>${fns:getUserById(p2pRepaymentVoucherAudit.repaymentAuditPerson).name}</td>
                <td><c:choose>
                    <c:when test="${p2pRepaymentVoucherAudit.repaymentAuditState == 2 }">通过</c:when>
                    <c:when test="${p2pRepaymentVoucherAudit.repaymentAuditState == 3 }">不通过</c:when>
                </c:choose>
                </td>
                <td>${p2pRepaymentVoucherAudit.repaymentAuditReason}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>

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
<script type="text/javascript">
    function repaymentAuditStateRadioChange() {
        var obj = $("#repaymentAuditReason");
        if ($("#repaymentAuditState").val() == 2) {
            obj.val("");
            obj.attr("disabled", "disabled");
        }
        if ($("#repaymentAuditState").val() == 3) {
            obj.removeAttr("disabled");
        }
    }
</script>
</body>
</html>