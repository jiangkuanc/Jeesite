<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>债项立项审核页</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(function () {
        });
    </script>
</head>
<body>
<div class="title"><h3>评级报告发布</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<h4>借贷产品基本信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}</td>
        <td>借贷产品名称</td>
        <td>${p2pFinancingInformation.finacingName}</td>
    </tr>
    <tr>
        <td>融资申请额度(元)</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber></td>
        <td>申请借贷产品期限</td>
        <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity , 'financing_maturity', '')}</td>
    </tr>
    <tr>
        <td>申请借贷产品利率</td>
        <td><fmt:formatNumber pattern="#0.00">${p2pFinancingInformation.applicationRate*100}</fmt:formatNumber>%</td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
<c:if test="${not empty p2pFinancingInformation.p2pFinancingRatingInfo}">
    <h4>评级结果录入</h4>
    <table class="table table-striped table-bordered table-condensed mytable">
        <tbody>
        <tr>
            <td>借贷产品评级级别</td>
            <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</td>
            <td>简版评级报告</td>
            <td>
                <a href="${ctx}/financing/download2?id=${p2pFinancingInformation.p2pFinancingRatingInfo.id}&type=1">${p2pFinancingInformation.p2pFinancingRatingInfo.commitReportName}</a>
            </td>
        </tr>
        <tr>
            <td>批复额度(元)</td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedAmount}</fmt:formatNumber></td>
            <td>借贷产品利率(%)</td>
            <td><fmt:formatNumber
                    pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
            </td>
        </tr>
        <tr>
            <td>是否需要增信</td>
            <td>${fns:getDictLabel(p2pFinancingInformation.p2pFinancingRatingInfo.wetherRep , 'yes_no', '')}</td>
            <td>增信额度(元)</td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.repCount}</fmt:formatNumber></td>
        </tr>
        </tbody>
    </table>
</c:if>
<c:choose>
    <c:when test="${p2pFinancingInformation.currentStage == 225}">
        <form action="${ctx}/financing/publicRecord" id="publicRecord" method="post">
            <h4>产品信息</h4>
            <input type="hidden" name="id" value="${p2pFinancingInformation.id}"/>
            <input type="hidden" name="isHandRateCost" value="${p2pFinancingInformation.isHandRateCost}"/>
            <input type="hidden" name="p2pFinancingRatingInfo.ratingLevel"
                   value="${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}"/>
            <table class="table table-striped table-bordered table-condensed opinion" id="table3">
                <tr>
                    <td>产品类别</td>
                    <td>
                        <select name="markType" class="input-medium-select">
                            <c:forEach items="${fns:getDictList('mark_type')}" var="item">
                                <option value="${item.value }">${item.label }</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>产品名称</td>
                    <td>
                        <input required="required" type="text" name="productName" maxlength="32"/>
                        <!-- 					<select name="productName" class="input-medium-select"> -->
                        <!-- 						<c:forEach items="${fns:getDictList('product_name')}" var="item"> -->
                        <!-- 							<option value="${item.value }">${item.label }</option> -->
                        <!-- 						</c:forEach> -->
                        <!-- 					</select> -->
                    </td>
                </tr>
            </table>
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="确定"/>
            <input id="btnCancel" class="btn btn-primary" type="button" value="取消" onclick="history.go(-1)"/>
        </form>
    </c:when>
    <c:otherwise>
        <h4>产品信息</h4>
        <table class="table table-striped table-bordered table-condensed mytable">
            <tbody>
            <tr>
                <td>产品类别</td>
                <td>${fns:getDictLabel(p2pFinancingInformation.markType,'mark_type', '')}</td>
                <td>产品名称</td>
                <td>${p2pFinancingInformation.productName}</td>
            </tr>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>