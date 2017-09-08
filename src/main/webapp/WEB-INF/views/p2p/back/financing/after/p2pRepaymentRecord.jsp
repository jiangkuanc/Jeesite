<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>还款记录</title>
    <meta name="decorator" content="default"/>


    <script type="text/javascript">
        $(document).ready(function () {
            var length = '${fn:length(list)}';
            for (var i = 1; i <= 8; i++) {
                var sum = 0;
                for (var j = 1; j <= length; j++) {
                    sum += parseFloat($("#n" + i + j).text().replace(',', ''));
                }
                $("#m" + i).text(formatCurrency(sum));
            }
        });
        function currentRepaymentDetails(financingInformationId, phase) {
            $.ajax({
                url: '${ctx}/after/financing/currentRepaymentDetails?financingInformationId=' + financingInformationId + '&&phase=' + phase,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#currentRepaymentDetails").html(data);
                    $("#currentRepaymentDetails").modal();
                }
            });
        }
    </script>
</head>
<body>

<div class="title"><h3>还款记录</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="self.location=document.referrer;"/>
<h4>借贷产品详情</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>借贷产品编号</th>
        <th>债务人名称</th>
        <th>借贷产品名称</th>
        <th>借贷产品类型</th>
        <th>期限</th>
        <th>还款方式</th>
        <th>借贷产品额度（元）</th>
        <th>应还款总额（元）</th>
        <th>已还金额（元）</th>
        <th>剩余还款总额（元）</th>
        <th>逾期次数</th>
        <th>逾期累计金额（元）</th>
    </tr>
    <tr>
        <td>${p2pFinancingInformation.id }</td>
        <td>${p2pFinancingInformation.user.name }</td>
        <td>${p2pFinancingInformation.finacingName }</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
        <td>
            <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
            </c:if>
            <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>
            </c:if>
        </td>
        <td><fmt:formatNumber pattern="#,##0.00">${a1 }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${a2 }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${a3 }</fmt:formatNumber></td>
        <td>${a4 }</td>
        <td><fmt:formatNumber pattern="#,##0.00">${a5 }</fmt:formatNumber></td>
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
    <c:forEach varStatus="status" items="${list }" var="p2pRepaymentPlan">
        <tr>
            <td>${p2pRepaymentPlan.phase }</td>
            <td><fmt:formatDate value="${p2pRepaymentPlan.planRepaymentDate }" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentDate }"
                                pattern="yyyy-MM-dd"/></td>
            <td id="n1${status.count }">
                <fmt:formatNumber pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentPrincipal }</fmt:formatNumber>
            </td>
            <td id="n2${status.count }">
                <c:choose>
                    <c:when test="${p2pRepaymentPlan.repaymentState == 3 }">
                        <fmt:formatNumber
                                pattern="#,##0.00">${p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentPrincipal }</fmt:formatNumber>
                    </c:when>
                    <c:otherwise>
                        0.00
                    </c:otherwise>
                </c:choose>
            </td>
            <td id="n3${status.count }">
                <fmt:formatNumber pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentInterest }</fmt:formatNumber>
            </td>
            <td id="n4${status.count }">
                <c:choose>
                    <c:when test="${p2pRepaymentPlan.repaymentState == 3 }">
                        <fmt:formatNumber
                                pattern="#,##0.00">${p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentInterest }</fmt:formatNumber>
                    </c:when>
                    <c:otherwise>
                        0.00
                    </c:otherwise>
                </c:choose>
            </td>
            <td id="n5${status.count }">
                <fmt:formatNumber pattern="#,##0.00">${p2pRepaymentPlan.fine }</fmt:formatNumber>
            </td>
            <td id="n6${status.count }">
                <c:choose>
                    <c:when test="${p2pRepaymentPlan.repaymentState == 3 }">
                        <c:choose>
                            <c:when test="${empty p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentFine }">
                                0.00
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber
                                        pattern="#,##0.00">${p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentFine }</fmt:formatNumber>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        0.00
                    </c:otherwise>
                </c:choose>
            </td>
            <td id="n7${status.count }"><fmt:formatNumber
                    pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentPrincipal+p2pRepaymentPlan.planRepaymentInterest+p2pRepaymentPlan.fine  }</fmt:formatNumber></td>
            <td id="n8${status.count }">
                <c:choose>
                    <c:when test="${p2pRepaymentPlan.repaymentState == 3 }">
                        <a onclick="currentRepaymentDetails('${p2pFinancingInformation.id }','${p2pRepaymentPlan.phase }')">
                            <fmt:formatNumber
                                    pattern="#,##0.00">${p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentPrincipal+p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentInterest+p2pRepaymentPlan.p2pRepaymentRecord.realRepaymentFine }</fmt:formatNumber>
                        </a>
                    </c:when>
                    <c:otherwise>
                        0.00
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:if test="${p2pRepaymentPlan.repaymentState == 3 }">
                    是
                </c:if>
                <c:if test="${p2pRepaymentPlan.repaymentState != 3 }">
                    否
                </c:if>
            </td>
            <td>
                <c:if test="${!empty p2pRepaymentPlan.p2pRepaymentRecord.repaymentVoucher }">
                    <a onclick="modelView('${p2pRepaymentPlan.p2pRepaymentRecord.repaymentVoucher}')">查看</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td>合计</td>
        <td></td>
        <td></td>
        <td id="m1"></td>
        <td id="m2"></td>
        <td id="m3"></td>
        <td id="m4"></td>
        <td id="m5"></td>
        <td id="m6"></td>
        <td id="m7"></td>
        <td id="m8"></td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>


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
<!-- 模态框（Modal） -->
<div style="width: 900px;margin-left: -450px;" class="modal fade" id="currentRepaymentDetails" tabindex="-1"
     role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
</div>
</body>

</html>