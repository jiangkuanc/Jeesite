<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css"/>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/manhuaDate.1.0.css">
    <style type="text/css">
        .selected {
            background: #f14349;
            color: #fff;
        }

        .btn:hover {
            color: #fff;
            cursor: default;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资记录页面-->
<!-- 引入账户菜单文件 -->
<%-- <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp"%> --%>
<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${ctx}">首页</a></li>
        <li class="active"><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></li>
    </ol>
</div>
<!--左侧内容区域结束-->
<div class="zh-con">
    <div class="zh-left pull-left">
        <p class="zh-p"><a href="${ctx}/user/p2pUserInformation/accountPermission">账户总览</a></p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="">投资管理</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentGeneral">投资总览</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentIncome">投资收益</a></li>
                    <li class="tz-active"><a
                            href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentRecord">投资记录</a></li>
                </ul>
            </li>

            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bindingPhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=passwordModify">密码管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accountSet">账户设置</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="tzright_top">
            <p class="zl-p">
                累计投资总额<span>${allInvestmentAmount} 元</span>
            </p>
            <div class="zxzt" id="">
                <span>债项状态：</span>
                <a class="btn" href="javascript:void(0)" onclick="repaying();">还款中</a>
                <a class="btn" href="javascript:void(0)" onclick="repayEnd();">已还完</a>
                <a class="btn" href="javascript:void(0)" onclick="overdue();">逾期</a>
                <a class="btn selected" href="javascript:void(0)" onclick="allRecord();">全部</a>
            </div>
            <form id="searchForm" method="post" action="${ctx }/financing/myAccount/investmentRecord">
                <div class="tzsy-rq ">
                    <b class="tzjl-tzrq">投资日期：</b>
                    <input id="beginDate" name="beginDate" type="text" placeholder="请选择日期" class="mh_date"
                           readonly="true" value="${beginDate }">
                    <b>至</b>
                    <input id="endDate" name="endDate" type="text" placeholder="请选择日期" class="mh_date" readonly="true"
                           value="${endDate }">&nbsp;&nbsp;&nbsp;
                    <input style="width:50px;line-height: 1.2;" type="submit" class="btn btn-sm btn-primary"
                           value="查 询"/>
                    <input style="width:50px;line-height: 1.2;" type="button" class="btn btn-sm " value="重置"
                           onclick="r_();"/>
                </div>
            </form>
        </div>
        <div class="zh-right-bottom" id="div1">
            <!--债项  表单-->
            <table class="table table-hover tzzl-table table-striped ">
                <thead>
                <tr class="active list-th">
                    <th width="15%">债项名称</th>
                    <th width="15%">投资额度</th>
                    <th width="10%">投资时间</th>
                    <th width="15%">收益率(年化)</th>
                    <th width="12.5%">信用级别</th>
                    <th width="12.5%">债项状态</th>
                    <th width="20%">募集截止日期</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer1">
                <c:if test="${loadInvestmentList[0] == null}">
                    <tr>
                        <td colspan="8" rowspan="2">
                            <div class="cai-text">暂无投资信息，立即 <a
                                    href="${ctx}/user/p2pUserInformation/investmentPermission">投资。</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${loadInvestmentList[0] != null}">
                    <c:forEach items="${loadInvestmentList }" var="loadInvestmentList">
                        <tr>
                            <td><a href="javascript:void(0);"
                                   title="${loadInvestmentList.finacingName }">${fns:abbr(loadInvestmentList.finacingName,25 )}</a>
                            </td>
                            <td>${loadInvestmentList.p2pGivingOutLoans.givingOutAmount} 元</td>
                            <td><fmt:formatDate
                                    value="${loadInvestmentList.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${loadInvestmentList.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${loadInvestmentList.p2pFinancingRatingInfo.ratingLevel }</td>
                            <td>
                                <button class="btn yqwh">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                            </td>
                            <td><fmt:formatDate value="${loadInvestmentList.raiseDeadTime }"/></td>
                        </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>
            <div class="holder1"></div>
        </div>
        <!-- 还款中 -->
        <div class="zh-right-bottom" id="div2">
            <!--债项  表单-->
            <table class="table table-hover tzzl-table">
                <thead>
                <tr class="active list-th">
                    <th width="15%">债项名称</th>
                    <th width="15%">投资额度</th>
                    <th width="10%">投资时间</th>
                    <th width="15%">收益率(年化)</th>
                    <th width="12.5%">信用级别</th>
                    <th width="12.5%">债项状态</th>
                    <th width="20%">募集截止日期</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer2">
                <c:if test="${loadRepayingInvestmentList[0] == null}">
                    <tr>
                        <td colspan="8" rowspan="2">
                            <div class="cai-text">暂无还款中信息</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${loadRepayingInvestmentList[0] != null}">
                    <c:forEach items="${loadRepayingInvestmentList }" var="repaying">
                        <tr>
                            <td><a href="javascript:void(0);"
                                   title="${repaying.finacingName }">${fns:abbr(repaying.finacingName,25 )}</a></td>
                            <td>${repaying.p2pGivingOutLoans.givingOutAmount} 元</td>
                            <td><fmt:formatDate
                                    value="${repaying.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${repaying.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${repaying.p2pFinancingRatingInfo.ratingLevel }</td>
                            <td>
                                <button class="btn yqwh">${fns:getDictLabel(repaying.currentStage,"progress_stage","") }</button>
                            </td>
                            <td><fmt:formatDate value="${repaying.raiseDeadTime }"/></td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="holder2"></div>
        </div>
        <!-- 已还完列表 -->
        <div class="zh-right-bottom" id="div3">
            <!--债项  表单-->
            <table class="table table-hover tzzl-table">
                <thead>
                <tr class="active list-th">
                    <th width="15%">债项名称</th>
                    <th width="15%">投资额度</th>
                    <th width="10%">投资时间</th>
                    <th width="15%">收益率(年化)</th>
                    <th width="12.5%">信用级别</th>
                    <th width="12.5%">债项状态</th>
                    <th width="20%">募集截止日期</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer3">
                <c:if test="${loadRepayEndInvestmentList[0] == null}">
                    <tr>
                        <td colspan="8" rowspan="2">
                            <div class="cai-text">暂无还款结束信息</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${loadRepayEndInvestmentList[0] != null}">
                    <c:forEach items="${loadRepayEndInvestmentList }" var="repayEnd">
                        <tr>
                            <td><a href="javascript:void(0);"
                                   title="${repayEnd.finacingName }">${fns:abbr(repayEnd.finacingName,25 )}</a></td>
                            <td>${repayEnd.p2pGivingOutLoans.givingOutAmount} 元</td>
                            <td><fmt:formatDate
                                    value="${repayEnd.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${repayEnd.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${repayEnd.p2pFinancingRatingInfo.ratingLevel }</td>
                            <td>
                                <button class="btn yqwh">${fns:getDictLabel(repayEnd.currentStage,"progress_stage","") }</button>
                            </td>
                            <td><fmt:formatDate value="${repayEnd.raiseDeadTime }"/></td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="holder3"></div>
        </div>
        <!-- 逾期列表 -->
        <div class="zh-right-bottom" id="div4">
            <!--债项  表单-->
            <table class="table table-hover tzzl-table">
                <thead>
                <tr class="active list-th">
                    <th width="15%">债项名称</th>
                    <th width="15%">投资额度</th>
                    <th width="10%">投资时间</th>
                    <th width="15%">收益率(年化)</th>
                    <th width="12.5%">信用级别</th>
                    <th width="12.5%">债项状态</th>
                    <th width="20%">募集截止日期</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer4">
                <c:if test="${loadOverdueInvestmentList[0] == null}">
                    <tr>
                        <td colspan="8" rowspan="2">
                            <div class="cai-text">暂无逾期信息</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${loadOverdueInvestmentList[0] != null}">
                    <c:forEach items="${loadOverdueInvestmentList }" var="overdue">
                        <tr>
                            <td><a href="javascript:void(0);"
                                   title="${overdue.finacingName }">${fns:abbr(overdue.finacingName,25 )}</a></td>
                            <td>${overdue.p2pGivingOutLoans.givingOutAmount} 元</td>
                            <td><fmt:formatDate
                                    value="${overdue.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${overdue.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${overdue.p2pFinancingRatingInfo.ratingLevel }</td>
                            <td>
                                <button class="btn yqwh">${fns:getDictLabel(overdue.currentStage,"progress_stage","") }</button>
                            </td>
                            <td><fmt:formatDate value="${overdue.raiseDeadTime }"/></td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="holder4"></div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic }/dist/js/jquery-1.7.2.min.js"></script>
<script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic }/dist/js/left.js"></script>
<script src="${ctxStatic }/dist/js/jPages.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>

<script type="text/javascript">
    function r_() {
        $('#beginDate').val("");
        $('#endDate').val("");
        window.location.href = "${ctx }/financing/myAccount/investmentRecord";
    }

    $(function () {
        $("#div1").show();
        $("#div2").hide();
        $("#div3").hide();
        $("#div4").hide();
    });
    //还款中
    function repaying() {
        $("#div1").hide();
        $("#div2").show();
        $("#div3").hide();
        $("#div4").hide();
    }
    //已还完
    function repayEnd() {
        $("#div1").hide();
        $("#div2").hide();
        $("#div3").show();
        $("#div4").hide();
    }
    //逾期
    function overdue() {
        $("#div1").hide();
        $("#div2").hide();
        $("#div3").hide();
        $("#div4").show();
    }
    //全部
    function allRecord() {
        $("#div1").show();
        $("#div2").hide();
        $("#div3").hide();
        $("#div4").hide();
    }
    $(function () {
        $(".zxzt a").click(function () {
            $(this).addClass("selected").siblings().removeClass("selected");
            $(this).css("background", "#f14349");
            $(this).css("color", "#ffffff");
            $(this).siblings().css("background", "none");
            $(this).siblings().css("color", "#999");
        })
    });
    //按时间条件过滤结果
    function dateQuery() {
        $('.tr').hide();
        var arr = $('#beginDate').val().split("-");
        var beginDate = new Date(arr[0], arr[1] - 1, arr[2]);
        var arrs = $('#endDate').val().split("-");
        var endDate = new Date(arrs[0], arrs[1] - 1, arrs[2]);
        var times = $('.time');
        for (var i = 0; i < times.length; i++) {
            var arrs2 = times[i].innerHTML.split("-");
            var time = new Date(arrs2[0], arrs2[1] - 1, arrs2[2]);
            if (time > beginDate && time < endDate) {
                var a = $(this);

                //times.index(target).parentNode.show();
            }
            console.log(a)
        }
    }
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
    /*js实现页面分页*/
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
    fenye("div.holder1", "itemContainer1")
    fenye("div.holder2", "itemContainer2")
    fenye("div.holder3", "itemContainer3")
    fenye("div.holder4", "itemContainer4")
</script>


</body>
</html>