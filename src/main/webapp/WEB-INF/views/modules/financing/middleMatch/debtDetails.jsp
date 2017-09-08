<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>债项详情</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //日期加上天数得到新的日期
            //dateTemp 需要参加计算的日期，days要添加的天数，返回新的日期，日期格式：yyyy-MM-dd
            var d = new Date($("#publishTime").val());
            var days = parseInt($("#raiseTimeLimit").val());
            d.setDate(d.getDate() + days);
            var m = d.getMonth() + 1;
            //d.getFullYear()+'-'+m+'-'+d.getDate()+' '+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds()
            $("#fullTime").append(d.format("yyyy-MM-dd hh:mm:ss"));

        });

        Date.prototype.format = function (format) {
            var date = {
                "M+": this.getMonth() + 1,
                "d+": this.getDate(),
                "h+": this.getHours(),
                "m+": this.getMinutes(),
                "s+": this.getSeconds(),
                "q+": Math.floor((this.getMonth() + 3) / 3),
                "S+": this.getMilliseconds()
            };
            if (/(y+)/i.test(format)) {
                format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
            }
            for (var k in date) {
                if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1
                        ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
                }
            }
            return format;
        }
    </script>
</head>

<body>
<h3>债项详情</h3>
<h4>债项信息</h4>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业名称</td>
        <td>${fi.enterpriseName}</td>
        <td>债项名称</td>
        <td>${fi.finacingName }</td>
    </tr>
    <tr>
        <td>融资金额（元）</td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.financingAmount }</fmt:formatNumber></td>
        <td>期限（月）</td>
        <td>${fi.financingMaturity }</td>
    </tr>
    <tr>
        <td>还款方式</td>
        <td>${fns:getDictLabel(fi.repaymentMode, 'repayment_mode', '')}</td>
        <td>预计还款金额（元）</td>
        <td><fmt:formatNumber pattern="#,##0.00">${fic:getRepaymentAmount(fi)}</fmt:formatNumber></td>
    </tr>
    <tr>
        <td>借款用途类别</td>
        <td>
            ${fns:getDictLabel(fi.purposeClassification, 'purpose_classification', '')}
        </td>
        <td>用途说明</td>
        <td>${fi.purposeExplain }</td>
    </tr>
    <tr>
        <td>第一笔还款来源</td>
        <td>${fi.repaymentFirstSource }</td>
        <td>第二笔还款来源</td>
        <td>${fi.repaymentSecondSource }</td>
    </tr>
    <tr>
        <td>第三笔还款来源</td>
        <td>${fi.repaymentThirdSource }</td>
        <td>其他还款来源</td>
        <td>${fi.repaymentOtherSource }</td>
    </tr>
    <tr>
        <td>评级级别</td>
        <td>${fns:getDictLabel(fi.p2pFinancingRatingInfo.ratingLevel, 'rating_level', '')}</td>
        <td>利率</td>
        <td>${fi.p2pFinancingRatingInfo.recommendedRate }</td>
    </tr>
    <%--
                <tr>
                    <td>资产评估</td>
                    <td>——</td>
                    <td>是否增信</td>
                    <td>——</td>
                </tr>
            --%></tbody>
</table>
<h4>债项募集情况</h4>
<table class="table table-striped table-bordered table-condensed">
    <tbody>
    <tr>
        <th>发布时间</th>
        <th>募集到期时间</th>
        <th>满标时间</th>
        <th>债项状态</th>
        <th>融资金额（元）</th>
        <th>已募集金额（元）</th>
        <th>剩余募集金额（元）</th>
    </tr>
    <tr>
        <td><fmt:formatDate value="${fi.publishTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td id="fullTime">
            <input id="publishTime" type="hidden"
                   value="<fmt:formatDate value="${fi.publishTime }" pattern="yyyy-MM-dd hh:mm:ss"/>">
            <input id="raiseTimeLimit" type="hidden" value="${fi.raiseTimeLimit }">
        </td>
        <td><fmt:formatDate value="${fic:getDebtStageTime(fi.id,'600')}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td>${fns:getDictLabel(fi.currentStage, 'progress_stage', '')}</td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.financingAmount }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.financingAmount - fi.restRaiseMoney }</fmt:formatNumber></td>
        <td><fmt:formatNumber pattern="#,##0.00">${fi.restRaiseMoney }</fmt:formatNumber></td>
    </tr>
    </tbody>
</table>

<div class="form-actions">
    <input id="btnCancel" class="btn btn-default" type="button"
           value="返 回" onclick="history.go(-1)"/>
</div>

</body>

</html>