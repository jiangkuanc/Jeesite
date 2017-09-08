<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<html>
<head>
    <title>首页</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css/homepage.css" type="text/css" rel="stylesheet"/>
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
    <style type="text/css">
        .f_left {
            float: left;
        }

        .f_right {
            float: right;
        }
    </style>
</head>
<body>
<div style="margin:0px 10%;">
    <div class="row">
        <div class="f_left">
            <h4>还款中债项预警信息</h4>
            <input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>
    </div>
    <div>
        <table class="table table-striped table-bordered table-condensed">
            <thead>
            <tr>
                <th>序号</th>
                <th>债项名称</th>
                <th>代理人名称</th>
                <th>联系方式</th>
                <th>预警事宜</th>
                <th>发布时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="p2pRepaymentPlan" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${p2pRepaymentPlan.p2pFinancingInformation.finacingName}</td>
                    <td>${p2pRepaymentPlan.p2pFinancingInformation.user.name}</td>
                    <td>${p2pRepaymentPlan.p2pFinancingInformation.user.phone}</td>
                    <td>
                        应还款倒计时${p2pRepaymentPlan.p2pFinancingInformation.warndays}天，${p2pRepaymentPlan.phase}期应还本金<fmt:formatNumber
                            pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentPrincipal}</fmt:formatNumber>元，利息<fmt:formatNumber
                            pattern="#,##0.00">${p2pRepaymentPlan.planRepaymentInterest}</fmt:formatNumber>元
                    </td>
                    <td><fmt:formatDate value="${p2pRepaymentPlan.p2pFinancingInformation.publishTime}"
                                        pattern="yyyy-MM-dd"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="pagination">${page}</div>
    </div>
</div>
</body>
</html>