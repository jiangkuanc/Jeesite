<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left">
    <div class="tabs " id="tabs" style="width:100%">
        <ul>
            <li class="two" id="changeZero"><span class="border">待还款列表</span></li>
            <li class="two border" id="changeOne"><span>已还款列表</span></li>
            <li class="two border current currents" id="changeTwo"><span class="border-top">逾期记录</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu" style="margin-top:30px">
            <!--逾期记录-->
            <div style="display: inline;" class="one yuqi">
                <c:choose>
                    <c:when test="${fn:length(list) > 0}">
                        <%-- <ul class="pull-left" style="pointer-events: none;">
                    <li>逾期款项数量：<span><b>${allOverdueCount}笔</b></span>
                    </li>
                    <li>黑名单记录状态：未记录<img src="${ctxStatic}/dist/images/why.png" alt="">
                    </li>
                </ul>
                <ul class="pull-left" >
                    <li style="pointer-events: none;">逾期累计天数：<span><b>${allOverdueDays}天</b></span>
                    </li>
                    <li>最近一次逾期款项：<span style="color:#595959" title="${overdueList[0].p2pFinancingInformation.finacingName}">
                        ${fns:abbr(overdueList[0].p2pFinancingInformation.finacingName,27)}</span>
                    </li>
                </ul> --%>

                        <table class="table table-hover ">
                            <thead style="height:50px">
                            <tr class="active list-th">
                                <th width="22.5%">款项名称</th>
                                <th width="20%">额度(元)</th>
                                <th width="17.5%">罚金(元)</th>
                                <th width="20%">应还款时间</th>
                                <th width="20%">逾期天数</th>
                            </tr>
                            </thead>
                            <tbody id="itemContainer">
                            <c:forEach items="${list}" var="repayment">
                                <tr>
                                    <td><a href="javascript:void(0);" style="color: #333"
                                           title="${repayment.p2pFinancingInformation.finacingName}-${repayment.phase}">${fns:abbr(repayment.p2pFinancingInformation.finacingName,27)}-${repayment.phase}</a>
                                    </td>
                                    <td><fmt:formatNumber
                                            value="${repayment.planRepaymentPrincipal + repayment.planRepaymentInterest}"
                                            pattern="#,##0.00"/></td>
                                    <td><fmt:formatNumber value="${repayment.fine}" pattern="#,##0.00"/></td>
                                    <td><fmt:formatDate value="${repayment.planRepaymentDate}"
                                                        pattern="yyyy/MM/dd"/></td>
                                    <td>${repayment.overdueDays}天</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder"></div>
                    </c:when>
                    <c:otherwise>
                        <div class="daihk" style="margin-left: 8%;width: 65%">
                            <p class="daihai1">暂无逾期记录</p>
                            <p class="daihai2">返回<a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></p>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
            <!--逾期记录结束-->
        </div>
    </div>
</div>
<!--右侧内容区域结束-->
<div class="clearfix"></div>
</div>
<!--内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        $('#changeZero').click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myRepayment&state=0";
        });
        $('#changeOne').click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myRepayment&state=1";
        });
        $('#changeTwo').click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myRepayment&state=2";
        });
    });
</script>
<script type="text/javascript">
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
    $(function () {
        $("input.mh_date").manhuaDate({
            Event: "click",//可选
            Left: 0,//弹出时间停靠的左边位置
            Top: -16,//弹出时间停靠的顶部边位置
            fuhao: "-",//日期连接符默认为-
            isTime: false,//是否开启时间值默认为false
            beginY: 1980,//年份的开始默认为1949
            endY: 2025//年份的结束默认为2049
        });
    });
</script>

</body>
</html>
