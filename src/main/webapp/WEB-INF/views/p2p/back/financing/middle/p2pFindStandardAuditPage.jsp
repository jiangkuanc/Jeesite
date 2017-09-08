<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>流标审核</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#standardAuditForm").validate({
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
<h4>流标审核</h4>
<form id="standardAuditForm" action="${ctx}/inFinancing/p2pStandardAudit" method="post">
    <table class="table table-striped table-bordered table-condensed mytable opinion">
        <tbody>
        <tr>
            <td>操作人<input type="hidden" name="financingInformationId" value="${p2pFinancingInformation.id}"></td>
            <td><input type="hidden" name="userId" value="${fns:getUser().id}"/>${fns:getUser().name}</td>
            <td>操作时间</td>
            <td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
            <td>流标操作<input type="hidden" name="markType" value="${p2pFinancingInformation.markType}"></td>
            <td>流标结项</td>
            <td>说明</td>
            <td><input type="text" name="opinion"/></td>
        </tr>
        </tbody>
    </table>
    <button id="btnSubmit" class="btn btn-primary" type="submit">流标确认</button>
</form>
</body>
</html>

