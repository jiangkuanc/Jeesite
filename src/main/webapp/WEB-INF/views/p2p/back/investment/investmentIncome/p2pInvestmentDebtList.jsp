<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>投资债项列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

    </script>
</head>
<body>
<div class="title"><h3>投资债项列表</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed mytable1">
    <tr>
        <td>投资方名称</td>
        <td>${user.name }</td>
        <td>认购债项总数</td>
        <td>${accumulativeAmount }</td>
        <td>预计总收益</td>
        <td>${planSumIncome }元</td>
        <td>实际总收益</td>
        <td>${realSumIncome }元</td>
    </tr>
</table>
<h4>认购记录</h4>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>订单号</th>
        <th>认购时间</th>
        <th>认购债项名称</th>
        <th>认购状态</th>
        <th>投资总金额（元）</th>
        <th>预计总收益（元）</th>
        <th>实际总收益（元）</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>${p2pInvestmentInformation.id }</td>
            <td><fmt:formatDate value="${p2pInvestmentInformation.lastInvestmentTime }"
                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${p2pInvestmentInformation.p2pFinancingInformation.finacingName }</td>
            <td>${fns:getDictLabel(p2pInvestmentInformation.p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pInvestmentInformation.investmentSumAmount }</fmt:formatNumber></td>
            <td><fmt:formatNumber pattern="#,##0.00">${p2pInvestmentInformation.expectEarn }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pInvestmentInformation.accumulativeIncome }</fmt:formatNumber></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>

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