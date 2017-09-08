<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>还款计划</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            /*Calendar calendar = Calendar.getInstance();
             calendar.add(Calendar.DATE,0);//得到当前一天（如果前一天就-1）
             calendar.add(Calendar.MONTH, +2);//得到2个月（如题，就是+2）
             Date date=calendar.getTime();
             String num=DateUtil.getDateTime("yyyyMMddhhmmss", date);
             alert(num);*/
            $("#aaa").change(function () {

            });
        });


    </script>
</head>

<body>
<h3>还款计划</h3>
<h4>债项详情</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <td>债项编号</td>
        <td>${fi.id}</td>
        <td>债项类型</td>
        <td>信用标</td>
        <td>还款方式</td>
        <td>${fns:getDictLabel(fi.repaymentMode, 'repayment_mode', '')}</td>
        <td>级别</td>
        <td>${fns:getDictLabel(fi.p2pFinancingRatingInfo.ratingLevel, 'rating_level', '')}</td>
    </tr>
    <tr>
        <td>债项名称</td>
        <td>${fi.finacingName }</td>
        <td>期限</td>
        <td>${fi.financingMaturity }个月</td>
        <td>债项额度（元）</td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.financingAmount }</fmt:formatNumber></td>
        <td>利率</td>
        <td>${fi.p2pFinancingRatingInfo.recommendedRate*100 }%</td>
    </tr>
    <tr>
        <td>应还款总额（元）</td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumPrincipal+sumMap.sumInterest }</fmt:formatNumber></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    </tbody>
</table>
<h4>还款计划</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>期数</th>
        <th>还款时间</th>
        <th>应还本金（元）</th>
        <th>应还利息（元）</th>
    </tr>
    <c:forEach varStatus="status" items="${list }" var="map">
        <tr>
            <td>${map.phase }</td>
            <td><fmt:formatDate value="${map.time }" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatNumber pattern="#,##0.00">${map.principal }</fmt:formatNumber></td>
            <td><fmt:formatNumber pattern="#,##0.00">${map.interest }</fmt:formatNumber></td>
        </tr>
    </c:forEach>
    <tr>
        <td>合计</td>
        <td></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumPrincipal }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${sumMap.sumInterest }</fmt:formatNumber></td>
    </tr>
    </tbody>
</table>

<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>

</html>