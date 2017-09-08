<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>批量发布借贷产品详情页</title>
    <meta name="decorator" content="default"/>
    <style type="text/css">
        table tr td {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#batchRelease").validate({
                rules: {
                    publishTime: {
                        required: true
                    }

                },
                messages: {},
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });

    </script>
</head>
<body>
<div class="page-header">
    <h4>批量发布借贷产品审核详情页</h4>
</div>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>借贷产品名称</th>
        <th>企业名称</th>
        <th>借贷产品级别</th>
        <th>借贷产品利率</th>
        <th>融资金额(元)</th>
        <th>融资期限</th>
        <th>还款方式</th>
        <th>申请时间</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${p2pList}" varStatus="status" var="p2pFinancingInformation">
        <tr style="text-align:center;">
            <!-- 序号 -->
            <td>
                    ${status.count}
            </td>
            <!-- 融资申请编号 -->
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <!-- 申请债项名称 -->
            <td title="${p2pFinancingInformation.finacingName}">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${fns:abbr(p2pFinancingInformation.finacingName ,25)}
                </a>
            </td>
            <!-- 融资企业名称-->
            <td title="${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        <%--					<a href="${ctx}/user/p2pEnterpriseCertify/detailsTwo?id=${p2pFinancingInformation.id}&id2=${p2pFinancingInformation.p2pEnterpriseCertify.id}">--%>
                        ${fns:abbr(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName ,25)}
                </a>
            </td>
            <!-- 债项级别-->
            <td>
                    ${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}
            </td>
            <!-- 债项利率 -->
            <td>
                <c:if test="${!empty p2pFinancingInformation.recommendedRate }">
                    <fmt:formatNumber pattern="#0.00">${p2pFinancingInformation.recommendedRate*100}</fmt:formatNumber>%
                </c:if>

            </td>
            <!-- 融资额度(元) -->
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.applicationAmount}</fmt:formatNumber>
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.financingAmount}</fmt:formatNumber>
                </c:if>
            </td>
            <!-- 融资期限 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.financingMaturity,'financing_maturity','')}
            </td>
            <!-- 还款方式 -->
            <td>
                    ${fns:getDictLabel(p2pFinancingInformation.repaymentMode,'repayment_mode','')}
            </td>
            <!-- 融资申请时间 -->
            <td>
                <fmt:formatDate value="${p2pFinancingInformation.commitTime}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<form action="${ctx}/financing/p2pFinancingInformation/batchRelease" id="batchRelease" method="post"
      modelAttribute="p2pFinancingInformation">
    <h4>发布意见</h4>
    <table id="table09" class="table table-striped table-bordered table-condensed opinion">
        <tr style="text-align: center;">
            <input type="hidden" name="idsStr" value="${idsStr}"/>
            <input type="hidden" value="${fns:getUser().id}" name="operatorId"/>
            <td>发布人</td>
            <td>
                <input type="text" value="${fns:getUser().name}" readonly="readonly"/>
            </td>
            <td>发布时间</td>
            <td>
                <input name="publishTime" type="text" readonly="readonly" maxlength="20" id="publishTime"
                       class="input-medium Wdate"
                       value="<fmt:formatDate value="${vo.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
            </td>
        </tr>
        <tr style="text-align:center;">
            <td>发布意见</td>
            <td>
                <input type="text" value="发布" readonly="readonly"/>
            </td>
            <td>项目介绍</td>
            <td><textarea name="productDescription"></textarea></td>
        </tr>
    </table>
    <input type="submit" value="发布" class="btn btn-default"/>
</form>
<div class="form-actions">
    <input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
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