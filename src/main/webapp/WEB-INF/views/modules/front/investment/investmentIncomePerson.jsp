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

        a {
            cursor: pointer;
        }

        .btna {
            -moz-user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            cursor: pointer;
            display: inline-block;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857;
            margin-bottom: 0;
            padding: 6px 12px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
        }

        .weizhi {
            float: right;
        }

        .btn:hover {
            color: #fff;
            cursor: default;
        }

        /*     	table{table-layout: fixed;} */
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资收益页面-->
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
<!--左侧内容区域结束-->
<div class="zh-con">
    <div class="zh-left pull-left">
        <p class="zh-p" style="background: #eaeaea;">
            <a href="${ctx}/user/myAccountinformation/allInformation">账户总览</a>
        </p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">我的投资</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/overview">投资总览</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/income">投资收益</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/record">投资记录</a></li>
                </ul>
            </li>
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">资金记录</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/spendRecord">费用记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/chargeRecord">充值记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/cashRecord">提现记录</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bindingPhone">绑定手机号</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=p2pRegUserCertify">身份认证</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bankMsg">管理银行卡</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=riskEvaluation">风险测评</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=passwordModify">密码管理</a>
                    </li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">举报管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=msgCenter">消息中心<span
                            class="badge" style="margin-left:2px;background-color:red;color:white;">4</span></a></li>
                </ul>
            </li>

            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">交易助手</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">计算器</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="tzright_top">
            <p class="zl-p">
                未到账收益总额 <span>
                <fmt:formatNumber
                        value="${fic:getBankPlanTotalEarnInterest(user.id)-fic:getBankRealTotalEarnInterest(user.id)}"
                        pattern="0.00"/> 元
                </span>
            </p>
            <p class="zl-p">
                累计收益 <span><fmt:formatNumber value="${fic:getBankRealTotalEarnInterest(user.id)}"
                                             pattern="0.00"/> 元</span>
            </p>
            <div class="zxzt">
                <span>债项状态：</span>
                <a class="btna" href="javascript:void(0)" onclick="repaying();">还款中</a>
                <a class="btna" href="javascript:void(0)" onclick="repayEnd();">已还完</a>
                <a class="btna" href="javascript:void(0)" onclick="overdue();">逾期</a>
                <a class="btna selected" href="javascript:void(0)" onclick="allRecord();">全部</a>
            </div>
            <form id="searchForm" method="post" action="${ctx }/financing/myAccount/investmentIncome">
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
            <table class="table table-hover tzzl-table table-striped table-condensed">
                <thead>
                <tr class="active list-th">
                    <th width="15%">债项名称</th>
                    <th width="9.9%">收益率(年化)</th>
                    <th width="9.8%">借款期限(月)</th>
                    <th width="9.80%">投资额度(元)</th>
                    <th width="11.0%">投资时间</th>
                    <th width="9.0%">债项状态</th>
                    <th width="9.5%">收益总额度(元)</th>
                    <th width="11.63%">收款总额度(元)</th>
                    <th width="19.63%">到账时间</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer1">
                <c:if test="${earnRecordList[0] == null}">
                    <tr>
                        <td colspan="9" rowspan="2">
                            <div class="cai-text">暂无投资信息，立即 <a
                                    href="${ctx}/user/p2pUserInformation/investmentPermission">投资。</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${earnRecordList[0] != null}">
                    <c:forEach items="${earnRecordList }" var="earnRecordList">
                        <tr>
                            <td>
                                <a href="${ctx}/financing/p2pFinancingInformation/getRepaymentRecordById?id=${earnRecordList.id}"
                                   title="${earnRecordList.finacingName }"></a></td>
                            <!-- 			                    <td><a onclick ="view('${earnRecordList.id}')" data-toggle="modal" data-target="#myModal">${earnRecordList.finacingName }</a></td> -->
                            <td><fmt:formatNumber
                                    pattern="#0.00">${earnRecordList.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${earnRecordList.financingMaturity}</td>
                            <td>${earnRecordList.p2pGivingOutLoans.givingOutAmount} </td>
                            <td><fmt:formatDate
                                    value="${earnRecordList.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td>
                                <button class="btn yqwh"></button>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
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
                    <th width="9.9%">收益率(年化)</th>
                    <th width="9.8%">借款期限(月)</th>
                    <th width="9.80%">投资额度(元)</th>
                    <th width="11.0%">投资时间</th>
                    <th width="9.0%">债项状态</th>
                    <th width="9.5%">收益总额度(元)</th>
                    <th width="11.63%">收款总额度(元)</th>
                    <th width="19.63%">到账时间</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer2">
                <c:if test="${loadRepayingInvestmentList[0] == null}">
                    <tr>
                        <td colspan="9" rowspan="2">
                            <div class="cai-text">暂无还款中信息</div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${loadRepayingInvestmentList[0] != null}">
                    <c:forEach items="${loadRepayingInvestmentList }" var="repaying">
                        <tr>
                            <td>
                                <a href="${ctx}/financing/p2pFinancingInformation/getRepaymentRecordById?id=${repaying.id}""
                                title="${repaying.finacingName }"></a></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${repaying.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${repaying.financingMaturity}</td>
                            <td>${repaying.p2pGivingOutLoans.givingOutAmount} </td>
                            <td><fmt:formatDate
                                    value="${repaying.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td>
                                <button class="btn yqwh"></button>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="holder2"></div>
        </div>
        <!-- 已还完 -->
        <div class="zh-right-bottom" id="div3">
            <!--债项  表单-->
            <table class="table table-hover tzzl-table">
                <thead>
                <tr class="active list-th">
                    <th width="15%">债项名称</th>
                    <th width="9.9%">收益率(年化)</th>
                    <th width="9.8%">借款期限(月)</th>
                    <th width="9.80%">投资额度(元)</th>
                    <th width="11.0%">投资时间</th>
                    <th width="9.0%">债项状态</th>
                    <th width="9.5%">收益总额度(元)</th>
                    <th width="11.63%">收款总额度(元)</th>
                    <th width="19.63%">到账时间</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer3">
                <c:if test="${loadRepayEndInvestmentList[0] == null}">
                    <tr>
                        <td colspan="9" rowspan="2">
                            <div class="cai-text">暂无还款结束信息</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${loadRepayEndInvestmentList[0] != null}">
                    <c:forEach items="${loadRepayEndInvestmentList }" var="repayEnd">
                        <tr>
                            <td>
                                <a href="${ctx}/financing/p2pFinancingInformation/getRepaymentRecordById?id=${repayEnd.id}""
                                title="${repayEnd.finacingName }"></a></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${repayEnd.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${repayEnd.financingMaturity}</td>
                            <td>${repayEnd.p2pGivingOutLoans.givingOutAmount} </td>
                            <td><fmt:formatDate
                                    value="${repayEnd.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td>
                                <button class="btn yqwh"></button>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="holder3"></div>
        </div>
        <!-- 逾期 -->
        <div class="zh-right-bottom" id="div4">
            <!--债项  表单-->
            <table class="table table-hover tzzl-table">
                <thead>
                <tr class="active list-th">
                    <th width="15%">债项名称</th>
                    <th width="9.9%">收益率(年化)</th>
                    <th width="9.8%">借款期限(月)</th>
                    <th width="9.80%">投资额度(元)</th>
                    <th width="11.0%">投资时间</th>
                    <th width="9.0%">债项状态</th>
                    <th width="9.5%">收益总额度(元)</th>
                    <th width="11.63%">收款总额度(元)</th>
                    <th width="19.63%">到账时间</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer4">
                <c:if test="${overdueNorepaymentList[0] == null}">
                    <tr>
                        <td colspan="9" rowspan="2">
                            <div class="cai-text">暂无逾期信息</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${overdueNorepaymentList[0] != null}">
                    <c:forEach items="${overdueNorepaymentList}" var="overdue">
                        <tr>
                            <td>
                                <a href="${ctx}/financing/p2pFinancingInformation/getRepaymentRecordById?id=${overdue.id}""
                                title="${overdue.finacingName }"></a></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${overdue.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${overdue.financingMaturity}</td>
                            <td>${overdue.p2pGivingOutLoans.givingOutAmount} 元</td>
                            <td><fmt:formatDate
                                    value="${overdue.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <td>
                                <button class="btn yqwh"></button>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="holder4"></div>
        </div>
        <div class="clearfix"></div>
        <!-- 模态框 -->
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 0">
            <div class="modal-dialog" style="width:800px">
                <div class="modal-content" style="margin-top: 15%">
                    <div class="modal-header" style="padding-left:15px;padding-top: 0;padding-bottom: 0">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3 id="myModalLabel"><span style="font-weight:bold">${repaymentRecordList}</span> 投资收益明细</h3>
                    </div>
                    <div class="modal-body">
                        <input id="id" type="hidden" class="form-control">
                        <table class="table table-striped table-bordered table-condensed" border="1"
                               bordercolor="#ccc" style="background: #ffffff;width:100%">
                            <thead>
                            <tr>
                                <td style="width:30%">投资债项名称</td>
                                <td style="width:20%">投资时间</td>
                                <td style="width:20%">投资金额(元)</td>
                                <td style="width:15%">年化率(%)</td>
                                <td style="width:20%">收益(元)</td>
                            </tr>
                            </thead>
                            <tbody id="itemContainer11">
                            <c:forEach items="${repaymentRecordList }" var="repaymentRecordList">
                                <tr>
                                    <td>${repaymentRecordList.finacingName}</td>
                                    <td><fmt:formatDate
                                            value="${InvestIncomeDetail.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                                    <td>${InvestIncomeDetail.p2pGivingOutLoans.givingOutAmount}</td>
                                    <td><fmt:formatNumber
                                            pattern="#0.00">${InvestIncomeDetail.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                                    </td>
                                    <td>${InvestIncomeDetail.investmentIncome}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder11"></div>
                        <div class="clearfix"></div>
                        <button class="btn btn-sm btn-danger weizhi" data-dismiss="modal">关闭</button>
                        <div class="clearfix"></div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
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
<script type="text/javascript" src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script>
<script type="text/javascript">
    //////////获取投资项目的还款计划///////////////
    //     	function view(id){
    // 			alert(id);
    // 			window.location.href="${ctx}/financing/p2pFinancingInformation/getRepaymentRecordById?id="+id;
    // 			$.ajax({
    // 				type:'post',
    // 				url:'${ctx}/financing/p2pFinancingInformation/getRepaymentRecordById?id='+id,
    // 				dataType : 'json',
    // 				success:function(data){
    // 					alert(data);
    // 					document.getElementById("creditname").innerHTML=data.creditName!=null?data.creditName:'';
    // 				}
    // 			});
    // 		}
    function r_() {
        $('#beginDate').val("");
        $('#endDate').val("");
        window.location.href = "${ctx }/financing/myAccount/investmentIncome";
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
    fenye("div.holder1", "itemContainer1");
    fenye("div.holder2", "itemContainer2");
    fenye("div.holder3", "itemContainer3");
    fenye("div.holder4", "itemContainer4");
</script>
</body>
</html>