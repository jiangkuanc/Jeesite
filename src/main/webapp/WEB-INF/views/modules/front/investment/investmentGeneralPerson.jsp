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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/manhuaDate.1.0.css">
    <style type="text/css">
        .weizhi {
            float: right;
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

<!--投资总览页面-->
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
        <p class="zh-p" style="background: #eaeaea;"><a
                href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountAll">账户总览</a></p>
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
                已投资总额：<span>${allInvestmentAmount }元</span>
            </p>
            <p class="zl-p">
                累计收益： <span>元</span>
                <input id="userId" type="hidden" value="${user.id }">
                <a data-toggle="modal" data-target="#myModal"><img src="${ctxStatic }/dist/images/symx.png" alt=""></a>
                <!--             	<a href=""><img src="${ctxStatic }/dist/images/symx.png" alt=""></a> -->
            </p>
            <div class="zhai-group" style="margin-bottom: 30px;">
                <p class="zhai muj">募集中的债项：<span>${investmentRaiseNum} 个</span></p>
                <p class="zhai">还款中的债项：<span>${repaymentNum } 个</span></p>
                <p class="zhai">已还款的债项：<span>${repaymentEndNum } 个</span></p>
                <p class="zhai">已流标债项：<span>${loseBidsNum } 个</span></p>
                <p class="zhai">逾期债项：<span>${overdueNum } 个</span></p>
            </div>
        </div>

        <div class="zh-right-bottom">
            <div class="tz">
                <h3>投资项目</h3>
            </div>
            <form id="searchForm" method="post" action="${ctx }/financing/myAccount/investmentGeneral">
                <div class="tzsy-rq input-append " id="datetimepicker">
                    <b>日期：</b>
                    <input id="beginDate" name="beginDate" type="text" placeholder="请选择日期" class="mh_date"
                           readonly="true" value="${beginDate }" autocomplete="off">
                    <b>至</b>
                    <input id="endDate" name="endDate" type="text" placeholder="请选择日期" class="mh_date" readonly="true"
                           value="${endDate }" autocomplete="off">&nbsp;&nbsp;&nbsp;
                    <input style="width:50px;line-height: 1.2;" type="submit" class="btn btn-sm btn-primary"
                           value="查 询"/>
                    <input style="width:50px;line-height: 1.2;" type="button" class="btn btn-sm " value="重置"
                           onclick="r_();"/>
                </div>
            </form>
            <!--投资推荐表单-->
            <table class="table table-hover tzzl-table table-striped table-condensed" style="table-layout: fixed;">
                <thead>
                <tr class="active list-th">
                    <th width="16.5%">债项名称</th>
                    <th width="10.9%">信用级别</th>
                    <th width="13.8%">募集截止日期</th>
                    <th width="9.80%">收利率(年化)</th>
                    <th width="17.3%">投资额度(元)</th>
                    <th width="12.4%">投资时间</th>
                    <th width="10.5%">债项状况</th>
                    <th width="13.63%">划款时间(计息时间)</th>
                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer">
                <c:if test="${loadInvestmentList[0] == null}">
                    <tr>
                        <td colspan="8" rowspan="2">
                            <div class="cai-text">暂无投资信息，立即 <a
                                    href="${ctx}/user/p2pUserInformation/investmentPermission">投资。</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${loadInvestmentList[0]!=null}">
                    <c:forEach items="${loadInvestmentList }" var="loadInvestmentList">
                        <tr>
                            <td>
                                <a href="${ctx}/financing/p2pFinancingInformation/getRepaymentRecordById?id=${loadInvestmentList.id}"
                                   title="${loadInvestmentList.finacingName }">${fns:abbr(loadInvestmentList.finacingName,25 )}</a>
                            </td>
                            <td>${loadInvestmentList.p2pFinancingRatingInfo.ratingLevel }</td>
                            <td><fmt:formatDate value="${loadInvestmentList.raiseDeadTime }"/></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${loadInvestmentList.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${loadInvestmentList.p2pGivingOutLoans.givingOutAmount}</td>
                            <td><fmt:formatDate
                                    value="${loadInvestmentList.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                            <c:if test="${loadInvestmentList.currentStage == 500}">
                                <td>
                                    <button class="btn mjz">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 600}">
                                <td>
                                    <button class="btn mjz">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 700}">
                                <td>
                                    <button class="btn yhk">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 701}">
                                <td>
                                    <button class="btn yhk">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 702}">
                                <td>
                                    <button class="btn yhk">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 800}">
                                <td>
                                    <button class="btn hkz">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 900}">
                                <td>
                                    <button class="btn yqwh">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 901}">
                                <td>
                                    <button class="btn yqwh">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <c:if test="${loadInvestmentList.currentStage == 999}">
                                <td>
                                    <button class="btn yqwh">${fns:getDictLabel(loadInvestmentList.currentStage,"progress_stage","") }</button>
                                </td>
                            </c:if>
                            <td>

                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>
            <div class="holder"></div>
        </div>
        <div class="clearfix"></div>
        <!-- 收益明细模态框 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 0">
            <div class="modal-dialog" style="width:800px">
                <div class="modal-content" style="margin-top: 15%">
                    <div class="modal-header" style="padding-left:15px;padding-top: 0;padding-bottom: 0">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3 id="myModalLabel"><span style="font-weight:bold">${p2pUserInformation.bankname }</span>
                            投资收益明细</h3>
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
                                <td style="width:15%">收益率(年化)</td>
                                <td style="width:20%">收益(元)</td>
                            </tr>
                            </thead>
                            <tbody id="itemContainer1">
                            <c:forEach items="${InvestIncomeDetail }" var="InvestIncomeDetail">
                                <tr>
                                    <input type="hidden" value="${InvestIncomeDetail.id }"/>
                                    <td title="${InvestIncomeDetail.finacingName}">${fns:abbr(InvestIncomeDetail.finacingName,30)}</td>
                                    <td><fmt:formatDate
                                            value="${InvestIncomeDetail.p2pInvestmentInformation.investmentAgreementTime}"/></td>
                                    <td>${InvestIncomeDetail.p2pGivingOutLoans.givingOutAmount}</td>
                                    <td><fmt:formatNumber
                                            pattern="#0.00">${InvestIncomeDetail.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder1"></div>
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
<script src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script>

<script type="text/javascript">
    //     	function page(n,s){
    // 			$("#pageNo").val(n);
    // 			$("#pageSize").val(s);
    // 			$("#searchForm").submit();
    //         	return false;
    //         }
    function r_() {
        $('#beginDate').val("");
        $('#endDate').val("");
        window.location.href = "${ctx }/financing/myAccount/investmentGeneral";
    }
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
    fenye("div.holder", "itemContainer");
</script>


</body>
</html>