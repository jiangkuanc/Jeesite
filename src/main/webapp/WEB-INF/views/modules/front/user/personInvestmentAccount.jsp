<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/jcalculator.js"></script>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
    <style type="text/css">
        .jCalculator {
            position: absolute;
            top: 25px;
            right: 249px;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
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
        <p class="zh-p" style="background: #eaeaea;"><a href="${ctx}/user/myAccountinformation/allInformation">账户总览</a>
        </p>
        <ul class="zhzl" id="leftMenu">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">我的投资</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentGeneral">投资总览</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentIncome">投资收益</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=investmentRecord">投资记录</a></li>
                </ul>
            </li>
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">资金记录</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=expenseMsg">费用记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=chargeRecord">充值记录</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=withdrawRecord">提现记录</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">账户管理</a></p>
                <ul class="zhzllevel2 zhgl">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bindingPhone">绑定手机号</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=p2pRegUserCertify">身份认证</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=bankMsg">管理银行卡</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=riskEvaluation">风险测评</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=memberMag">会员管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=passwordModify">密码管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=accountSet">举报管理</a></li>
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">消息中心<span
                            class="badge" style="margin-left:2px;background-color:red;color:white;">4</span></a></li>
                </ul>
            </li>

            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:void(0);">交易助手</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=riskEvaluation">计算器</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="zhright_top">
            <!--左侧-->
            <div class="zh-top_left pull-left">
                <div class="pull-left">
                    <!-- 	                    <c:if test="${p2pUserPic.userpic==null||''.equals(p2pUserPic.userpic) }"> -->
                    <!-- 	                    	<p> -->
                    <!-- 	                            <img style="width:100px" src="${ctxStatic }/dist/images/user.png" alt=""> -->
                    <!-- 	                        </p> -->
                    <!-- 	                    </c:if> -->
                    <!-- 	                    <c:if test="${p2pUserPic.userpic!=null && !''.equals(p2pUserPic.userpic)}"> -->
                    <!-- 	                        <p> -->
                    <!-- 								<img style="width:100px" src="${pageContext.request.contextPath}/${p2pUserPic.userpic }" alt=""> -->
                    <!-- 	                        </p> -->
                    <!-- 	                    </c:if> -->
                    <p>
                        <img src="${pageContext.request.contextPath}/${p2pUserPic.userpic}" alt=""
                             style="width:100px;height:100px;">
                    </p>
                    <p class="zh-user">
                        <a href="${ctx }/financing/myAccount/addTouXiang">设置头像</a>
                    </p>
                </div>
                <div class="pull-left top-text">
                    <p class="ninhao">您好，<span>${user.loginName }</span></p>
                    <p>企业名称：<span>${p2pUserInformation.bankname }</span></p>
                    <p>手机：<span>${user.phone }</span><b class="num"><a
                            href="${ctx }/financing/myAccount/replacePhone"><img src="${ctxStatic }/dist/images/num.png"
                                                                                 alt=""></a></b></p>
                </div>
            </div>
            <!--右侧-->
            <div class="zh-top_right pull-left">
                <p class="ljje">累计投资金额：<span>${allInvestmentAmount} 元</span>
                </p>
            </div>
            <div class="clearfix"></div>
        </div>
        <!--投资推荐处-->
        <div class="zh-right-bottom">
            <div class="tz">
                <h3 align="center">投资推荐</h3>
            </div>
            <table class="table table-hover table-striped table-condensed">
                <thead>
                <tr class="active list-th">
                    <th width="9.5%">债项名称</th>
                    <th width="12.13%">融资企业</th>
                    <th width="10.8%">信用级别</th>
                    <th width="12.88%">收益率(年化)</th>
                    <th width="10.75%">债项状态</th>
                    <th width="14.38%">剩余额度（元）</th>
                    <th width="9.5%">融资进度</th>
                    <th width="13%">剩余时间</th>
                    <th width=6.63%">操作</th>
                </tr>
                </thead>
                <tbody id="itemContainer">
                <c:if test="${fn:length(p2pFinancingInformationList) == 0}">
                    <tr>
                        <td colspan="8" rowspan="2">
                            <div class="cai-text">暂无投资推荐信息</div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${fn:length(p2pFinancingInformationList) > 0}">
                    <c:forEach items="${p2pFinancingInformationList}" var="p2pInvestment" varStatus="status">
                        <input type="hidden" value="${p2pInvestment.id }"/>
                        <tr>
                            <td><a href="javascript:void(0);"
                                   title="${p2pInvestment.finacingName }">${fns:abbr(p2pInvestment.finacingName,20 )}</a>
                            </td>
                            <td title="${p2pInvestment.enterpriseName }">${fns:abbr(p2pInvestment.enterpriseName,20 )}</td>
                            <td>${p2pInvestment.p2pFinancingRatingInfo.ratingLevel }</td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${p2pInvestment.p2pFinancingRatingInfo.recommendedRate*100 }</fmt:formatNumber>%
                            </td>
                            <!-- 				                <td>${fns:getDictLabel(p2pInvestment.currentStage,"progress_stage","") }</td> -->
                            <c:if test="${p2pInvestment.currentStage == 500}">
                                <td>热投中</td>
                            </c:if>
                            <c:if test="${p2pInvestment.currentStage != 500}">
                                <td>${fns:getDictLabel(p2pInvestment.currentStage,"progress_stage","") }</td>
                            </c:if>
                            <td>${p2pInvestment.restRaiseMoney }</td>
                            <td>
                                <div class="progress plan">
                                    <div style="width: 0%;color: #36a6fc;" class="progress-bar" role="progressbar"
                                         aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                         style="min-width: 2em;">
                                        0%
                                    </div>
                                </div>
                            </td>
                            <td name="sta" class="sta"></td>
                            <!-- 	                        <td><input class="touzizq-button" type="button" value="立即投资" onclick="investment();"></td> -->
                            <td><a class="buts"
                                   href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pInvestment.id}">立即投资</a>
                            </td>
                            <!-- 		                    	<a class="touzizq-button2" href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pInvestment.id}">立即投资</a> -->
                        </tr>
                        <input name="time" type="hidden" value="${p2pInvestment.raiseDeadline}"/>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>
            <div class="holder"></div>
        </div>
        <!--分页-->
    </div>
    <!--右侧内容区域结束-->
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    //js页面分页

    $(function () {
        /* var first_num = 0, second_num = 0, third_num = 0;
         $(".tabs ul li").click(function () {
         $(this).addClass('current currents').siblings().removeClass('current currents');
         var index = $(".tabs ul li").index(this);
         var id_num = index-0;
         console.log(id_num)
         $('.tabs div .one').eq(index).show().addClass('current2').siblings().hide().removeClass('current2');
         if (id_num == 0) {
         first_num++
         } else if (id_num == 2) {
         second_num++
         } else if (id_num == 3) {
         third_num++;
         }
         if(false){
         fenye("div.holder", "itemContainer")
         } else if (second_num < 2 && id_num == 2) {
         fenye("div.holder1", "situation")
         } else if (third_num < 2 && id_num == 3) {
         fenye("div.holder2", "quality")
         }
         }); */
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

        fenye("div.holder", "itemContainer")
    });

    /********************************新倒计时方法***************************/
        //获取后台数据等进行遍历和取值/*
    var size = "${size}";//获取集合size
    var object = document.getElementsByName('time');//获取时间集合
    var idList = document.getElementsByName('id');//获取id集合
    var nowtime;//当前时间
    var endtime;//结束时间
    var leftsecond;//剩余时间秒数
    var InterValObj;
    $(function () {
        InterValObj = window.setInterval(function () {
            _fresh()
        }, 1000); //间隔函数，1秒执行
    })
    function _fresh() {
        for (var i = 0; i < size; i++) {
            endtime = object[i].value;//从时间集合中取出时间
            nowtime = new Date();
            var leftsecond = parseInt(endtime - (nowtime.getTime()) / 1000); //剩余时间
            var remainTime = document.getElementsByName('sta');
            if (leftsecond > 0) {
                var touziButton = document.getElementsByName('touzi');
                var touziButton2 = $(".sta").next().children("a");
                var _d = parseInt(leftsecond / 3600 / 24); //计算天
                var _h = parseInt((leftsecond / 3600) % 24); //计算时
                var _m = parseInt((leftsecond / 60) % 60); //计算分
                var _s = parseInt(leftsecond % 60); //计算秒
                for (var j = 0; j < remainTime.length; j++) {
                    if (i == j)
                        remainTime[j].innerHTML = _d + "天" + _h + "小时" + _m + "分" + _s + "秒";
                    //touziButton[j].innerHTML = '<a class="touzizq-button2" href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id='+ids+'">立即投资</a>';
                }
            } else {
                for (var j = 0; j < remainTime.length; j++) {
                    if (i == j)
                        remainTime[j].innerHTML = "募集已结束";
                    //touziButton[j].innerHTML = '<a class="touzizq-button2" href="javascript:void(0);" onclick="func();"></a>';
                }
            }
        }
        $(".sta").each(function () {
            var ee = $(this).text();
            if (ee == "募集已结束") {
                $(this).next().children("a").attr("href", "javascript:void(0)");
                $(this).next().children("a").css("background", "#ccc");
            }
        });
    }

</script>
</body>
</html>