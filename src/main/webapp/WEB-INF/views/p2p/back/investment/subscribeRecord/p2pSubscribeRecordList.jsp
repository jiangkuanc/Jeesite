<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>认购记录</title>
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
<form:form id="searchForm" modelAttribute="p2pInvestmentInformation"
           action="${ctx}/investment/subscribeRecord/subscribeRecordList" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>投资方名称：</label>
            <form:input path="user.name" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>订单号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品状态：</label>
            <form:select path="p2pFinancingInformation.currentStage" class="input-medium-select">
                <form:option value="" label="全部"/>
                <c:forEach items="${fns:getDictList('progress_stage')}" var="list">
                    <c:if test="${list.value >= 500}">
                        <form:option value="${list.value }" label="${list.label }"/>
                    </c:if>
                </c:forEach>
            </form:select>
        </li>
        <li><label>投资方类型：</label>
            <form:select path="p2pUserInformation.userBodyType" class="input-medium-select">
                <form:option value="" label="全部"/>
                <form:option value="2" label="个人"/>
                <form:option value="3" label="投资机构"/>
                <%--<form:options items="${fns:getDictList('user_body_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>序号</th>
        <th>订单号</th>
        <th>投资方名称</th>
        <th>投资方类型</th>
        <th>投资借贷产品名称</th>
        <th>投资借贷产品是否增信</th>
        <%--
        <th>合同签订时间</th>
        <th>合同编号</th>
        <th>合同名称</th>
        --%>
        <th>借贷产品状态</th>
        <th>支付时间</th>
        <th>投资金额（元）</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pInvestmentInformation">
        <tr>
            <!--序号-->
            <td>${status.count }</td>
            <!--订单号-->
            <td>${p2pInvestmentInformation.id }</td>
            <!--投资方名称-->
            <td>
                <c:if test="${p2pInvestmentInformation.p2pUserInformation.userBodyType == 2 }">
                    <!-- 个人 -->
                    <a href="${ctx}/user/userList/personalBaseInfo?userid=${p2pInvestmentInformation.userId}">${p2pInvestmentInformation.user.name }</a>
                </c:if>
                <c:if test="${p2pInvestmentInformation.p2pUserInformation.userBodyType == 3 }">
                    <!-- 机构 -->
                    <a href="${ctx}/user/userList/agencyBaseInfo?userid=${p2pInvestmentInformation.userId}">${p2pInvestmentInformation.user.name }</a>
                </c:if>
            </td>
            <!--投资方类型-->
            <td>
                    ${fns:getDictLabel(p2pInvestmentInformation.p2pUserInformation.userBodyType,'user_body_type','')}
            </td>
            <!--投资债项名称-->
            <td>
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pInvestmentInformation.financingInformationId}">${p2pInvestmentInformation.p2pFinancingInformation.finacingName }</a>
            </td>
            <!--投资债项是否增信-->
            <td>
                    ${fns:getDictLabel(p2pInvestmentInformation.p2pFinancingRatingInfo.wetherRep,'yes_no','')}
            </td>
                <%--
                <!--合同签订时间-->
                <td></td>
                <!--合同编号-->
                <td></td>
                <!--合同名称-->
                <td></td>
                --%>
            <!--债项状态-->
            <td>${fns:getDictLabel(p2pInvestmentInformation.p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
            <!--支付时间-->
            <td>
                <!-- 投资机构 -->
                <c:if test="${p2pInvestmentInformation.p2pUserInformation.userBodyType == 3 }">
                    <fmt:formatDate value="${p2pInvestmentInformation.p2pFinancingInformation.givingOutTime}"
                                    pattern="yyyy-MM-dd"/>
                </c:if>
                <!-- 个人 -->
                <c:if test="${p2pInvestmentInformation.p2pUserInformation.userBodyType == 2 }">
                    <fmt:formatDate value="${p2pInvestmentInformation.lastInvestmentTime}" pattern="yyyy-MM-dd"/>
                </c:if>


            </td>
            <!--投资金额（元）-->
            <td>
                <fmt:formatNumber value="${p2pInvestmentInformation.investmentSumAmount }"
                                  pattern="#,##0.00"></fmt:formatNumber>
            </td>
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