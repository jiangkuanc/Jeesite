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
                    <li><a href="${ctx}/user/myAccountinformation/allInformation">身份认证</a></li>
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
    <div class="row">
        <!-- 左侧 -->
        <div class="personInfo pull-left col-lg-6">
            <div class="profile row">
                <div class="photo pull-left col-lg-3" style="margin-top:10px;">
                    <img src="${pageContext.request.contextPath }/Koala.jpg" alt="..." class="img-thumbnail"
                         style="width: 100px;height:100px;">
                    <p class="text-center"><a href="${ctx }/financing/myAccount/addTouXiang">更换头像</a></p>
                </div>
                <div class="info col-lg-8">
                    <div style="padding:5px;">
                        <span class="welcome">上午好</span>
                        <span class="nickname">${user.loginName}</span>
                    </div>
                    <div style="padding:5px;">
							<span class="renzhengxinxi">
								<c:choose>
                                    <c:when test="${certificateState==1}">
                                        <span>已认证</span>
                                    </c:when>
                                    <c:when test="${certificateState==0}">
                                        <a href="${ctx}/user/myAccountinformation/allInformation">未认证</a>
                                    </c:when>
                                    <c:when test="${certificateState==2}">
                                        <span>审核中</span>
                                    </c:when>
                                    <c:when test="${certificateState==3}">
                                        <span>认证失败</span>
                                    </c:when>
                                </c:choose>
							</span>
                        <span class="shoujibangka"></span>
                        <c:choose>
                            <c:when test="${bindCardState==2}">
                                <span>已绑定</span>
                            </c:when>
                            <c:when test="${bindCardState==0}">
                                <a href="${ctx}/user/bankManage/binding">未绑卡</a>
                            </c:when>
                            <c:when test="${bindCardState==1}">
                                <a href="${ctx}/user/bankManage/binding">绑卡失败</a>
                            </c:when>
                        </c:choose>
                        <span>
							<!-- 站内信链接地址 -->
							<c:if test="${message==0}">
								<a href="">0条未读</a></span>
                        </c:if>
                        <c:if test="${message>0}">
                            <a href="">${message}</a></span>
                        </c:if>
                    </div>
                    <div style="padding:5px;">
                        <span>会员:</span>
                        <span>
								<c:choose>
                                    <c:when test="${beMember==1}">
                                        <span>免费会员</span>
                                    </c:when>
                                    <c:when test="${beMember==0}">
                                        <a href="${ctx }/user/myAccountinformation/beMember">成为会员</a>
                                    </c:when>
                                </c:choose>
							</span>
                    </div>
                    <div style="padding:5px;">
                        <span>银行卡:</span>
                        <span>
								<c:choose>
                                    <c:when test="${bindCardState==1}">
                                        <a href="">已绑定</a>
                                    </c:when>
                                    <c:when test="${bindCardState==0}">
                                        <a href="${ctc }/user/bankManage/binding">未绑定</a>
                                    </c:when>
                                </c:choose>
							</span>
                        <span><a href="${ctx}/bankManage/binding">管理银行卡</a></span>
                    </div>
                    <div style="padding:5px;">
                        <span>风险承受能力:</span>
                        <span>
								<c:if test="${beMember==0}"><span>${"未测评"}</span></c:if>
							</span>
                        <span>
								<c:if test="${beMember==1}"><span>${"已测评"}</span>
                                    <span><a href="${ctx}/user/risk/evaluating">风险测评</a></span>
                                </c:if>
							</span>

                    </div>
                </div>
            </div>
        </div>
        <!--右侧-->
        <div class="col-lg-2">
            <c:forEach items="${accountAmounts}" var="amounts">
                <p>
                    <span>${amounts.key}</span>
                    <span>${amounts.value}</span>
                </p>
            </c:forEach>
            <button class="btn btn-info">充值</button>
            <button class="btn btn-info">提现</button>
        </div>
        <div>
            <span>累计投资收益:<c:out value="${accumulativeIncome}" default="0.00"></c:out></span>
        </div>
        <!--投资推荐处-->
        <%--  <div class="zh-right-bottom">
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
                 <th width="14.38%">剩余额度</th>
                 <th width="9.5%">融资进度</th>
                 <th width="13%">剩余时间</th>
                 <th width=6.63%">操作</th>
             </tr>
             </thead>
             <tbody id="itemContainer">
             <c:if test="${fn:length(p2pFinancingInformationList) == 0}">
                 <tr >
                    <td colspan="8" rowspan="2" >
                        <div class="cai-text">暂无投资推荐信息</div>
                    </td>
                </tr>
             </c:if>
             <c:if test="${fn:length(p2pFinancingInformationList) > 0}">
                 <c:forEach items="${p2pFinancingInformationList}"  var="p2pInvestment" varStatus="status">
                     <input type="hidden" value="${p2pInvestment.id }"/>
                     <tr>
                         <td><a href="javascript:void(0);" title="${p2pInvestment.finacingName }">${fns:abbr(p2pInvestment.finacingName,20 )}</a></td>
                         <td title="${p2pInvestment.p2pEnterpriseCertify.enterpriseName }">${fns:abbr(p2pInvestment.p2pEnterpriseCertify.enterpriseName,20 )}</td>
                         <td>${p2pInvestment.p2pFinancingRatingInfo.ratingLevel }</td>
                         <td>${p2pInvestment.p2pFinancingRatingInfo.recommendedRate*100 }%</td>
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
                                 <div style="width: 0%;color: #36a6fc;" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em;">
                                     0%
                                 </div>
                             </div>
                         </td>
                         <td name="sta" class="sta"></td>
                         <td><a class="buts" href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pInvestment.id}">立即投资</a></td>
                     </tr>
                 </c:forEach>
             </c:if>

             </tbody>
         </table>
         <div class="holder"></div>
     </div> --%>
        <div class="clearfix"></div>
    </div>
    <!-- 引入footer页脚文件 -->
    <%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
    <script type="text/javascript">
        //js页面分页

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