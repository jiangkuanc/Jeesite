<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>满标审核</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fullAuditForm").validate({
                submitHandler: function (form) {
                    var isHandRateCost = ${p2pFinancingInformation.isHandRateCost};
                    if (isHandRateCost == 0) {
                        swal("该借贷产品尚未缴评级费，请通知企业尽快缴费!", "", "error");
                    } else {
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

                }
            });
        });


        $(function () {
            //*******计算到期时间**********
            var lastPublishTime = $("#lastPublishTime").val();//最新发布时间
            if (lastPublishTime == "") {
                $("#daoqi").text('0');
            } else {
                var deadLine = '${p2pFinancingInformation.raiseTimeLimit}';//募集期限
                var arr = lastPublishTime.split('-');
                var date = new Date(arr[0], arr[1] - 1, arr[2], arr[3], arr[4], arr[5]);
                var hasRaiseTime = '${p2pFinancingInformation.hasRaiseTime}';//已募集时间
                var expireDate = deadLine * 24 * 3600 * 1000 + (date.getTime() - hasRaiseTime * 1000);
                expireDate = new Date(expireDate);
                expireDate = expireDate.format("yyyy-MM-dd hh:mm:ss");
                $("#daoqi").text(expireDate);
            }
            //*******计算到期时间**********
        })
        function checkIsHandRateCost() {
            var isHandRateCost = ${p2pFinancingInformation.isHandRateCost};
            if (isHandRateCost == 0) {

            }
        }
    </script>
</head>
<body>
<div class="title"><h3>借贷产品基本信息</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品信息</h4>
<table class="table table-striped table-bordered table-condensed mycenter listtable">
    <tbody>
    <tr>
        <th>借贷产品编号</th>
        <th>企业名称</th>
        <th>借贷产品名称</th>
        <th>融资金额(元)</th>
        <th>借贷产品类型</th>
        <th>期限</th>
        <th>还款方式</th>
    </tr>
    <tr>
        <td>${ p2pFinancingInformation.id}</td>
        <td>${ p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
        <td>${ p2pFinancingInformation.finacingName}</td>
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
    </tr>
    <tr>
        <th>借贷产品评级</th>
        <th>借贷产品利率</th>
        <th>发布时间</th>
        <th>到期时间</th>
        <th>借贷产品状态</th>
        <th>已募集金额(元)</th>
        <th>剩余募集金额(元)</th>
    </tr>
    <tr>
        <td>${ p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</td>
        <td><fmt:formatNumber
                pattern="#0.00">${ p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
        </td>
        <td>
            <fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd"/>
            <input id="lastPublishTime" type="hidden"
                   value="<fmt:formatDate value='${p2pFinancingInformation.lastPublishTime}' pattern='yyyy-MM-dd-HH-mm-ss'/>"/>
        </td>
        <td id="daoqi"></td>
        <td>${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
        <td>${p2pFinancingInformation.hasRaiseAmount}</td>
        <td>${ p2pFinancingInformation.restRaiseMoney}</td>
    </tr>
    </tbody>
</table>
<h4>投资记录</h4>
<c:if test="${p2pFinancingInformation.markType == 1}">
    <table id="contentTable" class="table table-striped table-bordered table-condensed mycenter">
        <thead>
        <tr>
            <th>序号</th>
            <th>投资日期</th>
            <th>投资人</th>
            <th>投资人类型</th>
            <th>投资金额（元）</th>
            <c:if test="${p2pFinancingInformation.currentStage == 800}">
                <th>放款凭证</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">
            <tr>
                <!-- 序号 -->
                <td>
                        ${status.count }
                </td>
                <td><fmt:formatDate value="${p2pInvestmentInformation.p2pInvestmentDetails.investmentTime}"
                                    pattern="yyyy-MM-dd"/></td>
                <td>${p2pInvestmentInformation.user.name}</td>
                <td>${fns:getDictLabel(p2pInvestmentInformation.p2pUserInformation.userBodyType, 'user_body_type', '')}</td>
                <td><fmt:formatNumber
                        pattern="#,##0.00">${p2pInvestmentInformation.p2pInvestmentDetails.investmentAmount }</fmt:formatNumber></td>
                <c:if test="${p2pFinancingInformation.currentStage == 800}">
                    <td>
                        <a onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pFinancingInformation.givingOutVoucher }')">
                            查看
                        </a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
<c:if test="${p2pFinancingInformation.markType == 2}">
    <table id="contentTable" class="table table-striped table-bordered table-condensed mycenter">
        <thead>
        <tr>
            <th>序号</th>
            <th>投资日期</th>
            <th>投资人</th>
            <th>投资金额（元）</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">
            <tr>
                <!-- 序号 -->
                <td>
                        ${status.count }
                </td>
                <td><fmt:formatDate value="${p2pInvestmentInformation.p2pInvestmentDetails.investmentTime}"
                                    pattern="yyyy-MM-dd"/></td>
                <td>${p2pInvestmentInformation.user.name}</td>
                <td><fmt:formatNumber
                        pattern="#,##0.00">${p2pInvestmentInformation.p2pInvestmentDetails.investmentAmount }</fmt:formatNumber></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
<h4>放款审核</h4>
<c:choose>
    <c:when test="${p2pFinancingInformation.currentStage == 600}">
        <form id="fullAuditForm" action="${ctx}/inFinancing/p2pFullAudit" method="post"
              onsubmit="return checkIsHandRateCost();">
            <table class="table table-striped table-bordered table-condensed mytable">
                <tbody>
                <tr>
                    <td>确标人<input type="hidden" name="financingInformationId" value="${p2pFinancingInformation.id}">
                    </td>
                    <td><input type="hidden" name="userId" value="${fns:getUser().id}"/>${fns:getUser().name}</td>
                    <td>确标时间</td>
                    <td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
                <tr>
                    <td>确标意见<input type="hidden" name="markType" value="${p2pFinancingInformation.markType}"></td>
                    <td>确标划款</td>
                    <c:if test="${p2pFinancingInformation.isHandRateCost != 1 }">
                        <td>是否缴纳评级费</td>
                        <td>${fns:getDictLabel(p2pFinancingInformation.isHandRateCost, 'yes_no', '')}</td>
                    </c:if>
                    <td>审核意见</td>
                    <td><input type="text" name="opinion"/></td>
                </tr>
                </tbody>
            </table>
            <c:choose>
                <c:when test="${p2pFinancingInformation.isHandRateCost == 1 }">
                    <button id="btnSubmit" class="btn btn-primary" type="submit">满标确认</button>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-primary">未缴纳评级费</button>
                </c:otherwise>
            </c:choose>
        </form>
    </c:when>
    <c:otherwise>
        <table class="table table-striped table-bordered table-condensed mytable">
            <tbody>
            <tr>
                <td>确标人</td>
                <td>${p2pBeforeMatchDebtState.user.name}</td>
                <td>确标时间</td>
                <td><fmt:formatDate value="${p2pBeforeMatchDebtState.stateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
            <tr>
                <td>确标意见</td>
                <td>确标划款</td>
                <td>审核意见</td>
                <td>${p2pBeforeMatchDebtState.handleResult}</td>
            </tr>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

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

