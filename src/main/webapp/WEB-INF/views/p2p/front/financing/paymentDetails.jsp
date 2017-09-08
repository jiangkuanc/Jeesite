<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist-gyh/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist-gyh/css/zhzl.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist-gyh/js/zhzl.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left zhzl_wdhk">
    <div class="yhkxq_h">
        <p class="hkxq clearfix">
            <span class="pull-left">已还款款项详情</span>
            <!-- <a href="#" class="pull-right"><< 返回</a> -->
        </p>
        <p class="zxmc">债项名称：${p2p.finacingName}</p>
        <span id="givingOutTime" class="hidden"><fmt:formatDate value="${p2p.givingOutTime}"
                                                                pattern="yyyy/MM/dd"/></span>
    </div>
    <div class="yhkxq_info">
        <ul class="clearfix">
            <li class="pull-left">满标金额：<span><fmt:formatNumber value="${p2p.p2pFinancingRatingInfo.recommendedAmount}"
                                                               pattern="#,###"/> 元</span></li>
            <li class="pull-left">借款利率（年化）：<span><fmt:formatNumber
                    pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%</span></li>
            <li class="pull-left">还款方式：<span>${fns:getDictLabel(p2p.repaymentMode, 'repayment_mode', '')}</span></li>
            <li class="pull-left">满标时间：<span> <fmt:formatDate value="${fullTime}" pattern="yyyy/MM/dd"/></span></li>
            <li class="pull-left">借款期限：<span id="financingMaturity">${p2p.financingMaturity}</span>个月</li>
            <li class="pull-left">到期时间：<span id="finalTime"></span></li>
        </ul>
        <table class="table wdhk_table">
            <thead>
            <tr>
                <th>款项名称</th>
                <th>应还款时间</th>
                <th>应还款金额（元）</th>
                <th>实际还款时间</th>
                <th>实际还款金额（元）</th>
                <th>状态</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="text-align: center;">${plan.p2pFinancingInformation.finacingName}-${plan.phase}</td>
                <td><fmt:formatDate value="${plan.planRepaymentDate}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatNumber value="${plan.planRepaymentPrincipal + plan.planRepaymentInterest + plan.fine}"
                                      pattern="#,###.0#"/></td>
                <td><fmt:formatDate value="${plan.p2pRepaymentRecord.realRepaymentDate}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatNumber value="${plan.p2pRepaymentRecord.realRepaymentPrincipal + plan.p2pRepaymentRecord.realRepaymentInterest
                        	+ plan.p2pRepaymentRecord.realRepaymentFine}" pattern="#,###.0#"/></td>
                <td>已还款</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="skfjl_box">
        <p><span class="skfjl">收款方记录</span>共<span class="skfjl_num"> ${investmentCount} </span>人次</p>
        <table class="table skfjl_table">
            <thead>
            <tr>
                <th>序号</th>
                <th>投标人</th>
                <th>收益率（年化）</th>
                <th>收益金额（元）</th>
                <th>到账时间</th>
            </tr>
            </thead>
            <tbody id="itemContainer">
            <c:forEach items="${list}" var="p" varStatus="i">
                <tr>
                    <td>${i.index + 1}</td>
                    <td>
                        <c:if test="${p.user.role.id == 101}">${p.p2pUserInformation.bankname}</c:if>
                        <c:if test="${p.user.role.id == 104}">${p.p2pRegUserCertify.realName}</c:if>
                    </td>
                    <td><fmt:formatNumber
                            pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                    </td>
                    <td><fmt:formatNumber
                            value="${p.p2pReceiveRecord.realReceiveInterest + p.p2pReceiveRecord.realReceiveFine}"
                            pattern="#,###.0#"/></td>
                    <td><fmt:formatDate value="${p.p2pReceiveRecord.realReceiveDate}" pattern="yyyy/MM/dd"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="holder"></div>
    </div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->


<script>
    $(function () {
        function fenye(content, id) {
            $(content).jPages({
                containerID: id, //显示数据所在的块的ID
                first: '首页',
                last: '尾页',
                previous: '上页',
                next: '下页',
                perPage: 10, //每页显示数据为多少行
                startPage: 1, //起始页
                startRange: 2, //开始页码为2个
                midRange: 6, //最多显示几个页码页码,其余用..代替e
                ndRange: 10, //结束页码为2个
                keyBrowse: true,
                delay: 20 //分页时动画持续时间，0表示无动画
            });
        }

        fenye("div.holder", "itemContainer");
    });
</script>
<script type="text/javascript">
    //计算到期时间
    $(function () {
        var financingMaturity = $('#financingMaturity').html();
        financingMaturity = parseInt(financingMaturity);
        var givingOutTime = $('#givingOutTime').html();
        if (givingOutTime != null) {
            var arr = givingOutTime.split("/");
            var finalTime = new Date(arr[0], arr[1] - 1 + financingMaturity, arr[2]);
            finalTime = finalTime.Format('yyyy/MM/dd');
            $('#finalTime').html(finalTime);
        }
    });
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
</body>
</html>
