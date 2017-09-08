<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>还款记录</title>
    <meta name="decorator" content="default"/>

</head>

<body>
<h3>当期还款金额分配</h3>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th rowspan="2">账期</th>
        <th rowspan="2">债权人</th>
        <th colspan="2">当期还款时间</th>
        <th colspan="2">当期本金</th>
        <th colspan="2">当期利息</th>
        <th colspan="2">当期还款合计</th>
        <th rowspan="2">还款凭证</th>
        <th rowspan="2">本期是否还清</th>
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
    </tr>

    <tr>
        <td>${map.phase }</td>
        <td>${p2pInvestmentInformation.user.name }</td>
        <td><fmt:formatDate value="${map.time }" pattern="yyyy-MM-dd"/></td>
        <td><fmt:formatDate value="${map.realTime }" pattern="yyyy-MM-dd"/></td>
        <td><fmt:formatNumber pattern="#,##0.00">${map.principal }</fmt:formatNumber></td>
        <td><c:if test="${!empty map.realTime}"><fmt:formatNumber
                pattern="#,##0.00">${map.principal }</fmt:formatNumber></c:if></td>
        <td><fmt:formatNumber pattern="#,##0.00">${map.interest }</fmt:formatNumber></td>
        <td><c:if test="${!empty map.realTime}"><fmt:formatNumber pattern="#,##0.00">${map.interest }</fmt:formatNumber></c:if></td>
        <td><fmt:formatNumber pattern="#,##0.00">${map.principal+map.interest }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${map.realAmount }</fmt:formatNumber></td>
        <td><a onclick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${map.repaymentVoucher}')">查看</a>
        </td>
        <td><c:if test="${!empty map.realTime}">是</c:if></td>
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
<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>

</html>