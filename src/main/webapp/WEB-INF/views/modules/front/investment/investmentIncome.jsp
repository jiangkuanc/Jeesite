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
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
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
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<c:if test="${user.roleList[0].id == '104'}">
    <!--账户总览页面-->
    <div class="zh">
        <ol class="breadcrumb">
            <li><b>我的位置：</b></li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active">投资收益</li>
        </ol>
    </div>
</c:if>
<!-- 引入header文件 -->
<div class="zh-con">
    <c:if test="${user.roleList[0].id=='101'}">
        <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
    </c:if>
    <c:if test="${user.roleList[0].id=='104'}">
        <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>
    <div class="zh-right pull-left">
        <div class="tzright_top">
            <p class="zl-p">
                未到账收益总额 <span><fmt:formatNumber value="${unReceived}" pattern="#,##0.00"/>元 </span>
            </p>
            <p class="zl-p">
                累计收益 <span><fmt:formatNumber value="${hasReceived}" pattern="#,##0.00"/>元</span>
            </p>
            <div class="rz-time">
                <span class="chaxun">按时间查询：</span>

                <form action="${ctx}/user/personInvestment/loadInfo" style="margin:0px;display:inline;"
                      onsubmit="return checkinput()">
                    <!--  user/personInvestment/loadInfo?mode=investmentIncome-->
                    <input type="hidden" name="mode" value="investmentIncome"/>
                    <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date" readonly>
                    <b>至</b>
                    <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date" readonly>
                    <input type="submit" value="查 询"/>
                </form>
            </div>
        </div>
        <div class="zh-right-bottom" id="div1">
            <!--债项  表单-->
            <table class="table table-hover tzzl-table table-striped table-condensed"
                   style="word-break:keep-all;white-space:nowrap;">
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
                    <th width="19.63%">到期时间</th>

                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer">
                <c:if test="${list == null}">
                    <tr>
                        <td colspan="9" rowspan="2">
                            <div class="cai-text">暂无投资信息，立即 <a
                                    href="${ctx}/user/p2pUserInformation/investmentPermission">投资。</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${list != null}">
                    <c:forEach items="${list}" var="p2pFinancingInformation">
                        <tr>
                            <td title="${p2pFinancingInformation.finacingName }">${fns:abbr(p2pFinancingInformation.finacingName,20 )}</td>
                            <!-- 			                    <td><a onclick ="view('${earnRecordList.id}')" data-toggle="modal" data-target="#myModal">${earnRecordList.finacingName }</a></td> -->
                            <td><fmt:formatNumber
                                    pattern="#0.00">${p2pFinancingInformation.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td>${fns:getDictLabel(p2pFinancingInformation.financingMaturity, 'financing_maturity', '')}</td>
                            <td><fmt:formatNumber
                                    pattern="#,##0.00">${p2pFinancingInformation.p2pInvestmentInformation.investmentSumAmount}</fmt:formatNumber></td>
                            <td><fmt:formatDate
                                    value="${p2pFinancingInformation.p2pInvestmentInformation.lastInvestmentTime}"
                                    pattern="yyyy-MM-dd"/></td>
                            <td>${fns:getDictLabel(p2pFinancingInformation.currentStage,"progress_stage","") }</td>
                            <td><fmt:formatNumber value="${p2pFinancingInformation.p2pReceivePlan.sumInterest }"
                                                  pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber
                                    value="${p2pFinancingInformation.p2pInvestmentInformation.investmentSumAmount + p2pFinancingInformation.p2pReceivePlan.sumInterest}"
                                    pattern="#,##0.00"/></td>
                            <td><fmt:formatDate value="${p2pFinancingInformation.p2pReceivePlan.maturityTime}"
                                                pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="holder"></div>
        </div>
        <div class="clearfix"></div>
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


    function r_() {
        $('#beginDate').val("");
        $('#endDate').val("");
        window.location.href = "${ctx }/financing/myAccount/investmentIncome";
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