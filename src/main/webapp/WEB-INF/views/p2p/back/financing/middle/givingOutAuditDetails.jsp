<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>放款凭证审核</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fullAuditForm").validate({
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
        });

        $(function () {
            $("#auditingOpinion").attr("readonly", "readonly");
        });
        function toSelect(value) {
            if (value == "1") {
                $("#auditingOpinion").val("");
                $("#auditingOpinion").attr("readonly", "readonly");
            } else if (value = "0") {
                $("#auditingOpinion").removeAttr("readonly");
            }
        }
    </script>
</head>
<body>
<div class="title"><h3>放款凭证审核</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品基本信息</h4>
<table class="table table-striped table-bordered table-condensed mycenter listtable">
    <tbody>
    <tr>
        <th>借贷产品编号</th>
        <th>债务人名称</th>
        <th>借贷产品名称</th>
        <th>借贷产品额度(元)</th>
        <th>借贷产品类型</th>
        <th>期限</th>
        <th>还款方式</th>
        <th>已募集金额(元)</th>
    </tr>
    <tr>
        <td>${p2pFinancingInformation.id}</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
        <td>${p2pFinancingInformation.finacingName}</td>
        <td>
            <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                ${p2pFinancingInformation.applicationAmount}
            </c:if>
            <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                ${p2pFinancingInformation.financingAmount}
            </c:if>
        </td>
        <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
        <td>${ p2pFinancingInformation.hasRaiseAmount}</td>
    </tr>
    </tbody>
</table>
<h4>投资记录</h4>
<table id="contentTable" class="table table-striped table-bordered table-condensed mycenter">
    <thead>
    <tr>
        <th>投资时间</th>
        <th>放款时间</th>
        <th>投资人</th>
        <th>投资人类型</th>
        <th>投资金额（元）</th>
        <th>放款凭证</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><fmt:formatDate value="${p2pFinancingInformation.p2pInvestmentInformation.lastInvestmentTime}"
                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td><fmt:formatDate value="${p2pFinancingInformation.givingOutTime}" pattern="yyyy-MM-dd"/></td>
        <td>${fns:getUserById(p2pFinancingInformation.p2pInvestmentInformation.userId).name}</td>
        <td>机构</td>
        <td><fmt:formatNumber
                pattern="#,##0.00">${p2pFinancingInformation.p2pInvestmentInformation.investmentSumAmount }</fmt:formatNumber></td>
        <td>
            <a href="javascript:void(0)" onclick="modelView('${p2pFinancingInformation.givingOutVoucher }')">
                查看
            </a>
        </td>
    </tr>
    </tbody>
</table>
<c:if test="${p2pFinancingInformation.givingOutState == 2}">
    <h4>审核意见</h4>
    <form id="fullAuditForm" action="${ctx}/inFinancing/givingOutAudit" method="post">
        <table class="table table-striped table-bordered table-condensed mytable">
            <tbody>
            <input type="hidden" name="givingOutVoucher" value="${p2pFinancingInformation.givingOutVoucher}">
            <input type="hidden" name="financingInformationId" value="${p2pFinancingInformation.id}">
            <input type="hidden" name="givingOutTime"
                   value="<fmt:formatDate value='${p2pFinancingInformation.givingOutTime}' pattern='yyyy-MM-dd' />">
            <input type="hidden" name="financingName" value="${p2pFinancingInformation.finacingName}">
            <input type="hidden" name="investmentId" value="${p2pFinancingInformation.p2pInvestmentInformation.userId}">
            <tr>
                <td>评审日期</td>
                <td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></td>
                <td>评审人</td>
                <td>${fns:getUser().name}</td>
            </tr>
            <tr>
                <td>评审意见</td>
                <td>
                    <select name="givingOutState" class="input-medium-select"
                            onchange=toSelect(this.options[this.options.selectedIndex].value);>
                        <option value="1">通过</option>
                        <option value="0">不通过</option>
                    </select>
                </td>
                <td>不通过原因</td>
                <td><input type="text" id="auditingOpinion" name="auditingOpinion"/></td>
            </tr>
            </tbody>
        </table>
        <button id="btnSubmit" class="btn btn-primary" type="submit">确定</button>
    </form>
</c:if>
<c:if test="${not empty list}">
    <h4>历史审核记录</h4>
    <table id="contentTable" class="table table-striped table-bordered table-condensed mycenter">
        <thead>
        <tr>
            <th>序号</th>
            <th>审核时间</th>
            <th>放款凭证</th>
            <th>审核人</th>
            <th>审核意见</th>
            <th>不通过原因</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" varStatus="status" var="p2pGivingOutRecord">
            <tr>
                <td>${status.count }</td>
                <td><fmt:formatDate value="${p2pGivingOutRecord.auditingTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <a href="javascript:void(0)" onclick="modelView('${p2pGivingOutRecord.givingOutVoucher }')">
                        查看
                    </a>
                </td>
                <td>${fns:getUserById(p2pGivingOutRecord.auditor).name}</td>
                <td>${fns:getDictLabel(p2pGivingOutRecord.givingOutState, 'pass_nopass', '')}</td>
                <td>${p2pGivingOutRecord.auditingOpinion}</td>
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
</body>
</html>

