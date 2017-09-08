<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>募集期风控管理列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            var json = '${json}';
            var data = eval('(' + json + ')');
            //****************计算倒计时*******************
            var InterValObj = window.setInterval(function () {
                _fresh()
            }, 1000); //间隔函数，1秒执行
            function _fresh() {
                for (var j in data) {
                    var remainTime;
                    var obj = data[j]['raiseTimeLimit'];//截止日期
                    var lastPublishTime = data[j]['lastPublishTime'];//最新发布时间
                    var hasRaiseTime = data[j]['hasRaiseTime'];//已募集时间
                    var inRaiseState = data[j]['inRaiseState'];//募集中状态
                    var currentStage = data[j]['currentStage'];//借贷产品状态
                    var nowtime;//当前时间
                    var endtime;//结束时间
                    var leftsecond;//剩余时间秒数
                    endtime = obj * 24 * 3600;
                    nowtime = new Date();
                    var leftsecond = parseInt(endtime - (nowtime.getTime() - lastPublishTime + hasRaiseTime * 1000) / 1000); //剩余时间
                    if (currentStage == 500 && inRaiseState == 0) {
                        if (leftsecond > 0) {
                            var _d = parseInt(leftsecond / 3600 / 24); //计算天
                            var _h = parseInt((leftsecond / 3600) % 24); //计算时
                            var _m = parseInt((leftsecond / 60) % 60); //计算分
                            var _s = parseInt(leftsecond % 60); //计算秒
                            remainTime = _d + "天" + _h + "小时" + _m + "分" + _s + "秒";
                        } else {
                            remainTime = "募集已结束";
                        }
                    } else if (currentStage == 500 && inRaiseState == 1) {
                        remainTime = "募集已暂停";
                    } else {

                        remainTime = "募集已结束";
                    }

                    $("#daojishi" + data[j]['id']).text("" + remainTime);
                }
            }

            //******************计算倒计时*********************
            //*******************计算截止时间*****************
            for (var i in data) {
                var deadLine = data[i]['raiseTimeLimit'];//募集期限
                var hasRaiseTime = data[i]['hasRaiseTime'];//已募集时间
                var ids = data[i]['id'];
                var lastTime = $("#lastPublishTime" + ids).val();//最新发布时间
                if (lastTime == "") {
                    $("#jiezhi" + ids).text('0');
                } else {
                    var arr = lastTime.split('-');
                    var date = new Date(arr[0], arr[1] - 1, arr[2], arr[3], arr[4], arr[5]);
                    var expireDate = deadLine * 24 * 3600 * 1000 + (date.getTime() - hasRaiseTime * 1000);
                    expireDate = new Date(expireDate);
                    expireDate = expireDate.format("yyyy-MM-dd hh:mm:ss");
                    $("#jiezhi" + ids).text(expireDate);
                }
            }
            //*******************计算截止时间*****************
            //利率查询小数处理
            changeRate("p2pFinancingRatingInfo.recommendedRate");
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
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/inFinancing/getRiskManagementPage"
           method="post" onsubmit="return checksubmit()" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>借贷产品编号：</label>
            <form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>借贷产品名称：</label>
            <form:input path="finacingName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>企业名称：</label>
            <form:input path="p2pEnterpriseCertify.enterpriseName" htmlEscape="false" maxlength="64"
                        class="input-medium"/>
        </li>
        <li><label>评级级别：</label>
            <form:select path="p2pFinancingRatingInfo.ratingLevel" htmlEscape="false" maxlength="64"
                         class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:options items="${fns:getDictList('rating_level')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li style="position: relative;"><label>利率：</label>
            <form:input path="p2pFinancingRatingInfo.recommendedRate" htmlEscape="false" maxlength="64"
                        class="input-medium"/><span style="position: absolute;right:10px;top:3px;">%</span>
        </li>
        <li><label>借贷产品状态：</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option selected="selected" value="">---请选择---</form:option>
                <form:option value="500">募集期</form:option>
                <form:option value="600">待满标审核</form:option>
                <form:option value="700">待放款</form:option>
                <form:option value="901">待流标</form:option>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<!-- 	<sys:message content="${message}"/> -->
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>借贷产品名称</th>
        <th>借贷产品类别</th>
        <th>企业名称</th>
        <th>评级级别</th>
        <th>利率</th>
        <th>借贷产品期限</th>
        <th>融资金额（元）</th>
        <th>已募集金额（元）</th>
        <th>融资进度</th>
        <th>募集期倒计时（天）</th>
        <th>发布时间</th>
        <th>募集期截止时间</th>
        <th>是否缴评级费</th>
        <th>借贷产品状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" varStatus="status" var="p2pFinancingInformation">
        <tr>
            <!-- 序号 -->
            <td>
                    ${status.count }
            </td>
            <td>
                    ${p2pFinancingInformation.id}
            </td>
            <td>
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${p2pFinancingInformation.finacingName}
                </a>
            </td>
            <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
            <td>
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        ${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}
                </a>
            </td>
            <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</td>
            <td><fmt:formatNumber
                    pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
            </td>
            <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    ${p2pFinancingInformation.applicationAmount}
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    ${p2pFinancingInformation.financingAmount}
                </c:if>
            </td>
            <td>
                <a href="${ctx}/inFinancing/getInvestRecordPage?id=${p2pFinancingInformation.id}">
                        ${p2pFinancingInformation.hasRaiseAmount}
                </a>
            </td>
            <td>
                <c:if test="${p2pFinancingInformation.financingAmount >= p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber
                            pattern="#0.00">${(p2pFinancingInformation.hasRaiseAmount/p2pFinancingInformation.applicationAmount)*100}</fmt:formatNumber> %
                </c:if>
                <c:if test="${p2pFinancingInformation.financingAmount < p2pFinancingInformation.applicationAmount}">
                    <fmt:formatNumber
                            pattern="#0.00">${(p2pFinancingInformation.hasRaiseAmount/p2pFinancingInformation.financingAmount)*100}</fmt:formatNumber> %
                </c:if>
            </td>
            <td id="daojishi${p2pFinancingInformation.id}"></td>
            <td>
                <fmt:formatDate value="${p2pFinancingInformation.publishTime}" pattern="yyyy-MM-dd"/>
                <input id="lastPublishTime${p2pFinancingInformation.id}" type="hidden"
                       value="<fmt:formatDate value='${p2pFinancingInformation.lastPublishTime}' pattern='yyyy-MM-dd-HH-mm-ss'/>"/>
            </td>
            <td id="jiezhi${p2pFinancingInformation.id}">募集期截止时间</td>
            <td>${fns:getDictLabel(p2pFinancingInformation.isHandRateCost, 'yes_no', '')}</td>
            <td>${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
            <td>
                <c:if test="${p2pFinancingInformation.inRaiseState == 0}">
                    <shiro:hasPermission name="loan:suspension"><a
                            href="${ctx}/inFinancing/p2pRiskManagementOff?id=${p2pFinancingInformation.id}">暂停</a></shiro:hasPermission>
                </c:if>
                <c:if test="${p2pFinancingInformation.inRaiseState == 1}">
                    <shiro:hasPermission name="loan:recovery"><a
                            href="${ctx}/inFinancing/p2pRiskManagementRecover?id=${p2pFinancingInformation.id}">恢复</a></shiro:hasPermission>/<shiro:hasPermission
                        name="loan:termination"><a
                        href="${ctx}/inFinancing/p2pRiskManagementEnd?id=${p2pFinancingInformation.id}">终止</a></shiro:hasPermission>
                </c:if>
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
<script type="text/javascript">
    $(function () {

    })


</script>
</html>