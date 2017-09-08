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
    <script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
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
    <script type="text/javascript">
        var SysSecond2;
        var InterValObj2;
        $(function () {
            var inRaiseState = '${p2p.inRaiseState}';//募集运行状态
            var t3 = '${p2p.hasRaiseTime}';//已募集时间

            t3 = t3 * 1000;
            var raiseTimeLimit = '${p2p.raiseTimeLimit}';//总募集期限
            var t1 = parseInt(raiseTimeLimit);

            t1 = t1 * 24 * 3600 * 1000;
            if (inRaiseState == 1) {
                var t4 = (t1 - t3) / 1000;
                SysSecond2 = parseInt(t4);
                SetRemainTime2();
            } else {

                var t2 = $('#lastPublishTime').html();//最新发布时间

                if (t2 != null) {
                    var arr = t2.split("/");
                    t2 = new Date(arr[0], arr[1] - 1, arr[2], arr[3], arr[4], arr[5]);
                    var t5 = new Date();
                    var t4 = (t1 - (t5.getTime() - t2.getTime() + t3)) / 1000;
                    SysSecond2 = parseInt(t4); //这里获取倒计时的起始时间
                    InterValObj2 = window.setInterval(SetRemainTime2, 1000); //间隔函数，1秒执行
                }
            }
        });
        //将时间减去1秒，计算天、时、分、秒
        function SetRemainTime2() {
            if (SysSecond2 > 0) {
                SysSecond2 = SysSecond2 - 1;
                var second = Math.floor(SysSecond2 % 60);             // 计算秒
                var minite = Math.floor((SysSecond2 / 60) % 60);      //计算分
                var hour = Math.floor((SysSecond2 / 3600) % 24);      //计算小时
                var day = Math.floor((SysSecond2 / 3600) / 24);        //计算天

                $(".remainTime2").html(day + "天" + hour + "小时" + minite + "分" + second + "秒");
            } else {//剩余时间小于或等于0的时候，就停止间隔函数
                window.clearInterval(InterValObj2);
                //这里可以添加倒计时时间为0后需要执行的事件
            }
        }
    </script>
    <style type="text/css">
        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }
    </style>
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
            <li id="changeZero" class="two currents "><span class="border border-top">募集中的借款项目</span></li>
            <li id="changeOne" class="two border"><span>还款中的借款项目</span></li>
            <li id="changeTwo" class="two border "><span>已完成的借款项目</span></li>
            <li id="changeThree" class="two border"><span>流标借款项目</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu" style="margin-top:30px">
            <!--募集中的债项-->

            <c:choose>
                <c:when test="${p2p != null}">
                    <div class="one current2 zh-right-bottom  ">
                        <div class="mj-ul">
                            <ul class="pull-left mj-ul1">
                                <li>借款项目名称：<span><b
                                        title="${p2p.finacingName}">${fns:abbr(p2p.finacingName,20)}</b></span></li>
                                <li>借款利率(年化)：<span><fmt:formatNumber
                                        pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%</span>
                                </li>
                                <li style="width: 50%">期限：<b>${p2p.financingMaturity}个月</b></li>
                            </ul>
                            <div class="hidden" id="lastPublishTime"><fmt:formatDate value="${p2p.lastPublishTime}"
                                                                                     pattern="yyyy/MM/dd/HH/mm/ss"/></div>
                            <ul class="pull-left">
                                <li>信用等级：<span><b>${p2p.p2pFinancingRatingInfo.ratingLevel}</b></span><a
                                        href="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?fid=${p2p.id}">
                                    <button class="btn ckbg">下载评级报告</button>
                                </a></li>
                                <li>开始时间：<b id="publishTime"><fmt:formatDate value="${p2p.publishTime}"
                                                                             pattern="yyyy/MM/dd"/></b></li>
                                <li style="margin-left: -10%" class="noWrap">剩余募集时间：<span class="remainTime2 "></span>
                                </li>
                            </ul>
                            <ul class="pull-left">
                                <li>还款方式：<b>${fns:getDictLabel(p2p.repaymentMode, 'repayment_mode', '')}</b></li>
                                <li>借款金额：<span>
			                            <c:choose>
                                            <c:when test="${p2p.applicationAmount >= p2p.p2pFinancingRatingInfo.recommendedAmount}">
                                                <fmt:formatNumber
                                                        value="${p2p.p2pFinancingRatingInfo.recommendedAmount}"
                                                        pattern="###,###"/>元
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${p2p.applicationAmount}" pattern="###,###"/>元
                                            </c:otherwise>
                                        </c:choose>
			                            </span></li>
                                <li>已融资金额：<span><c:choose>
                                    <c:when test="${p2p.hasRaiseAmount != null}">
                                        <fmt:formatNumber value="${p2p.hasRaiseAmount}" pattern="###,###"/>
                                    </c:when>
                                    <c:otherwise>0</c:otherwise>
                                </c:choose>元 </span></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                        <!--进度条-->
                        <div class="progress plan div-plan" style="margin-bottom: 30px">
                            <div id="jindu" class="progress-bar" role="progressbar" role="progressbar" aria-valuenow="0"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 0%;height:18px;">
			                            <span class="pro-plan"
                                              style="color: black;padding-left: 0px;text-align: center">
			                            <c:choose>
                                            <c:when test="${p2p.applicationAmount > p2p.p2pFinancingRatingInfo.recommendedAmount}">
                                                <fmt:formatNumber pattern="#0.00"
                                                                  value="${p2p.hasRaiseAmount/p2p.p2pFinancingRatingInfo.recommendedAmount*100}"/>%
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber pattern="#0.00"
                                                                  value="${p2p.hasRaiseAmount/p2p.applicationAmount*100}"/>%
                                            </c:otherwise>
                                        </c:choose>
			                            
			                            </span>
                            </div>
                        </div>
                        <div class="tz rongzi">
                            <p class="tzjl-text" style="color:#999">投资记录</p>
                            <p class="rzxm pull-right">
                                加入人次<span>${investmentCount}</span>人次
                            </p>
                            <p class="ljrzje pull-right">
                                总投标金额：<span><c:choose>
                                <c:when test="${p2p.hasRaiseAmount != null}">
                                    <fmt:formatNumber value="${p2p.hasRaiseAmount}" pattern="###,###"/>
                                </c:when>
                                <c:otherwise>0</c:otherwise>
                            </c:choose>元</span>
                            </p>
                        </div>
                        <div class="rz-time">
                            <span class="chaxun">按时间查询：</span>
                            <form action="${ctx}/user/p2pUserInformation/accountPermission"
                                  style="margin:0px;display:inline;" onsubmit="return checkinput()">
                                <input type="hidden" name="mode" value="myDebt"/>
                                <input type="hidden" name="state" value="0"/>
                                <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date"
                                       readonly>
                                <b>至</b>
                                <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date"
                                       readonly>
                                <input type="submit" value="查 询"/>
                            </form>
                        </div>
                        <table class="table table-hover rongz-table">
                            <thead style="height:50px">
                            <tr class="active list-th">
                                <th width="10%">序号</th>
                                <th width="22.5%">投标人</th>
                                <th width="17.5%">借款利息(年化)</th>
                                <th width="20%">投资金额(元)</th>
                                <th width="20%">投资时间</th>
                            </tr>
                            </thead>
                            <tbody id="itemContainer">
                            <c:forEach items="${investmentList}" var="a" varStatus="i">
                                <tr>
                                    <td>${i.index+1}</td>
                                    <td>
                                        <c:if test="${a.user.role.id == 101}">${a.p2pUserInformation.bankname}</c:if>
                                        <c:if test="${a.user.role.id == 104}">${a.p2pRegUserCertify.realName}</c:if>
                                    </td>
                                    <td><fmt:formatNumber
                                            pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                                    </td>
                                    <td><fmt:formatNumber value="${a.investmentSumAmount}" pattern="#,###,###"/></td>
                                    <td><fmt:formatDate value="${a.lastInvestmentTime}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder"></div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="one current2 ckmj-div">
                        <p class="hkzx">暂无募集中借款项目</p>
                    </div>
                </c:otherwise>
            </c:choose>
            <!--募集中的债项结束-->
            <script type="text/javascript">

                //按时间查询前验证
                function checkinput() {
                    var beginTime = new Date($("#beginTime").val());
                    var endTime = new Date($("#endTime").val());
                    if (beginTime > endTime) {
                        alert("起始时间不得大于截止时间！")
                        return false;
                    }
                    return true;

                }

                /**
                 *控制进度条变化
                 */
                var jindu = $("#jindu").find('span').text();
                jindu = parseFloat(jindu);
                $("#jindu").attr("aria-valuenow", jindu)
                    .css("width", jindu + "%");
            </script>
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
        $("#changeZero").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=0"
        });
        $("#changeOne").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=1"
        });
        $("#changeTwo").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=2"
        });
        $("#changeThree").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=3"
        });
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
</body>
</html>
