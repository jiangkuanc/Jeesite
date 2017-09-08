<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>撮合后借贷产品列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            //****************计算倒计时*******************
            _fresh();
            window.setInterval(function () {
                _fresh()
            }, 1000); //间隔函数，1秒执行


            //利率查询小数处理
            changeRate("p2pFinancingRatingInfo.recommendedRate");

        });
        function _fresh() {
            var json = '${json}';
            var data = eval('(' + json + ')');
            for (var j in data) {
                var remainTime;
                //  ${p2pFinancingInformation.p2pRepaymentPlan.phase }
                //p2pFinancingInformation.p2pRepaymentPlan.planRepaymentDate
                var nowtime = new Date();//当前时间
                if (typeof(data[j]["p2pRepaymentPlan"]) == "undefined") {
                    continue;//跳出本次循环
                }
                var endtime = new Date(data[j]["p2pRepaymentPlan"]["planRepaymentDate"]);//还款时间
                var leftsecond = parseInt((endtime.getTime() - nowtime.getTime()) / 1000); //剩余时间
                if (data[j]["currentStage"] == 800) {
                    var _d = parseInt(leftsecond / 3600 / 24); //计算天
                    var _h = parseInt((leftsecond / 3600) % 24); //计算时
                    var _m = parseInt((leftsecond / 60) % 60); //计算分
                    var _s = parseInt(leftsecond % 60); //计算秒
                    remainTime = _d + "天" + _h + "小时" + _m + "分" + _s + "秒";
                }
                if (data[j]["currentStage"] == 900) {
                    remainTime = "借贷产品完成";
                }
                $("#daojishi" + data[j]["id"]).text(remainTime);
                if (_d < 5) {
                    $("#daojishi" + data[j]["id"]).css("background-color", "yellow");
                }
                //逾期变为红色
                if (leftsecond < 0) {
                    $("#daojishi" + data[j]["id"]).css("background-color", "red");
                }


            }
        }
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }

    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="p2pFinancingInformation" action="${ctx}/after/financing/afterFinancingList"
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
                <form:option selected="selected" value="">全部</form:option>
                <form:options items="${fns:getDictList('rating_level')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li style="position:relative;"><label>利率：</label>
            <form:input id="rate" path="p2pFinancingRatingInfo.recommendedRate" htmlEscape="false" maxlength="64"
                        class="input-medium"/><span style="position: absolute;right:10px;top:3px;">%</span>
        </li>
        <li><label>借贷产品状态：</label>
            <form:select path="currentStage" class="input-medium-select">
                <form:option selected="selected" value="">全部</form:option>
                <form:option value="800">还款中</form:option>
                <form:option value="900">已完成</form:option>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<div>
</div>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed listtable">
    <thead>
    <tr>
        <th>序号</th>
        <th>借贷产品编号</th>
        <th>借贷产品名称</th>
        <th>借贷产品类别</th>
        <th>企业名称</th>
        <th>借贷产品期限</th>
        <th>评级级别</th>
        <th>利率</th>
        <th>还款方式</th>
        <th>全部应还款（元）</th>
        <th>已还款（元）</th>
        <th>当前期数</th>
        <th>还款日倒计时（天）</th>
        <th>本期应还本金（元）</th>
        <th>本期应还利息（元）</th>
        <th>本期应还总金额（元）</th>
        <th>借贷产品状态</th>
        <th>逾期次数</th>
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
            <td title="${p2pFinancingInformation.finacingName}">
                <a href="${ctx}/investment/subscribeRecord/debtDetails?id=${p2pFinancingInformation.id}">
                        ${fns:abbr(p2pFinancingInformation.finacingName,15)}
                </a>
            </td>
            <td>${fns:getDictLabel(p2pFinancingInformation.markType, 'mark_type', '')}</td>
            <td title="${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName}">
                <a href="${ctx}/user/userList/enterpriseDetails?userid=${p2pFinancingInformation.applicantsId}">
                        ${fns:abbr(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName,15)}
                </a>
            </td>
            <td>
                <a href="${ctx}/after/financing/repaymentPlan?id=${p2pFinancingInformation.id}">${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</a>
            </td>
            <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel}</td>
            <td><fmt:formatNumber
                    pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
            </td>
            <td>${fns:getDictLabel(p2pFinancingInformation.repaymentMode, 'repayment_mode', '')}</td>
            <td><fmt:formatNumber pattern="#,##0.00">${p2pFinancingInformation.qbyhk }</fmt:formatNumber></td>
            <td><a href="${ctx}/after/financing/repaymentRecord?id=${p2pFinancingInformation.id}"><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.yhzjz }</fmt:formatNumber></a></td>
            <td>${p2pFinancingInformation.p2pRepaymentPlan.phase }</td>
            <td id="daojishi${p2pFinancingInformation.id}"></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pRepaymentPlan.planRepaymentPrincipal }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pRepaymentPlan.planRepaymentInterest }</fmt:formatNumber></td>
            <td><fmt:formatNumber
                    pattern="#,##0.00">${p2pFinancingInformation.p2pRepaymentPlan.planRepaymentPrincipal+p2pFinancingInformation.p2pRepaymentPlan.planRepaymentInterest }</fmt:formatNumber></td>
            <td>${fns:getDictLabel(p2pFinancingInformation.currentStage, 'progress_stage', '')}</td>
            <td>${p2pFinancingInformation.overdueNum }</td>
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