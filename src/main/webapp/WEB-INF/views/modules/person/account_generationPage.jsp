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
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">

    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic}/lib/bootstrap-modal.js" type="text/javascript"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li><b>我的位置：</b></li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active"><a href="${ctx}/user/accountGeneration/showAllInformation" style="color:#333">账户总览</a>
            </li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left ">
        <!--右侧上部左侧-->
        <div class="zh-right-top-left">
            <div class="zh-right-top-left-left pull-left">
                <c:if test="${p2pUserInformation.userpic != null}"><img src="${p2pUserInformation.userpic}"
                                                                        alt=""></c:if>
                <a href="${ctx}/user/accountGeneration/setUpPic"><h2>设置头像</h2></a>
            </div>
            <div class="zh-right-top-left-right pull-left">
                <p>
                    <span>您好，<strong>${user.loginName}</strong></span>
                </p>

                <p>
                    <c:choose>
                        <c:when test="${userCertifyState=='1'}">
                            <img src="${ctxStatic}/dist-gyh/images/wdzh_yrz.png" alt="">
                            <span class="strong_w wdzh-yrz">:已认证</span>
                        </c:when>
                        <c:when test="${userCertifyState=='0'}">
                            <img src="${ctxStatic}/dist-gyh/images/wdzh_yrz.png" alt="">
                            <a href="${ctx}/user/accountGeneration/redirect_unAuthIdCardUrl"><span>未认证</span></a>
                        </c:when>
                        <c:when test="${userCertifyState=='2'}">
                            <img src="${ctxStatic}/dist-gyh/images/wdzh_yrz.png" alt="">
                            <a href="${ctx}/user/idCardCertify/reCertify"><span>认证失败</span></a>
                        </c:when>
                        <c:when test="${userCertifyState=='3'}">
                            <img src="${ctxStatic}/dist-gyh/images/wdzh_yrz.png" alt="">
                            <span>审核中</span>
                        </c:when>
                    </c:choose>
                    <img src="${ctxStatic}/dist-gyh/images/wdzh_ybd_h.png" alt="">
                    <span class="strong_w wdzh-ybd">:已绑定</span>
                    <%--  <c:choose>
                        <c:when test="${msgSmsList!=null}">
                        </c:when>
                            <c:when test="${msgSmsList==null||msgSmsList==''}">
                              <img src="${ctxStatic}/dist-gyh/images/wdzh_ybd_h.png" alt="">
                             <span><a href="${ctx}/msg/msgSmsRecord/showSmsPage">未绑定</a></span>
                        </c:when>
                    </c:choose> --%>
                    <span>
                        		 <img src="${ctxStatic}/dist-gyh/images/wdzh_wd.png" alt="">
          						 <a href="${ctx}/msg/msgLetterRecord/getMsgList?readState=0"><span class="red">:<strong
                                         class="strong_wd" id="unReadMes">0</strong>条未读</span></a>
                        	</span>
                </p>
                <p>
                    <span>会员：</span>
                    <c:if test="${p2pUserInformation.certificateState!='1040'}"><strong><a
                            href="${ctx}/user/bankCard/beMember">不是会员</a></strong></c:if>

                    <c:if test="${p2pUserInformation.certificateState=='1040'}"><a
                            href="${ctx}/user/bankCard/beMember4"><strong>有效会员</strong></a></c:if>
                </p>
                <p>
                    <c:choose>
                        <c:when test="${p2pUserInformation.certificateState==1020||p2pUserInformation.certificateState==1030||p2pUserInformation.certificateState==1040}">
                            <span>银行卡：</span>
                            <strong>已绑定</strong>
                            <a href="${ctx}/user/bankManage/bankInfo">管理银行卡</a>
                        </c:when>
                        <c:when test="${p2pUserInformation.certificateState==1010||p2pUserInformation.certificateState==1001||p2pUserInformation.certificateState==2001||p2pUserInformation.certificateState==3001}">
                            <span>银行卡：</span>
                            <a href="${ctx}/user/bankManage/bankInfo"><strong>未绑定</strong></a>
                            <a href="${ctx}/user/bankManage/bankInfo">管理银行卡</a>
                        </c:when>
                    </c:choose>
                </p>
                <p>
                    <c:choose>
                        <c:when test="${p2pUserInformation.certificateState==1020||p2pUserInformation.certificateState==1001||p2pUserInformation.certificateState==1010||p2pUserInformation.certificateState==2001||p2pUserInformation.certificateState==3001}">
                            <span>风险承受能力：</span>
                            <strong>未测评</strong>
                            <a href="${ctx}/user/Institution/ctrlMenuPerson?mode=riskRecord">风险评测</a>
                        </c:when>
                        <c:when test="${p2pUserInformation.certificateState==1030||p2pUserInformation.certificateState==1040}">
                            <span>风险承受能力：</span>
                            <strong>已测评</strong>
                        </c:when>
                    </c:choose>
                </p>
            </div>
        </div>
        <!--右侧上部右侧-->
        <div class="zh-right-top-right pull-left">
            <div class="zh-right-top-right-top">
                <p>
                    账户余额：<strong>0.00元</strong>
                </p>
                <p>
                    可用余额：<strong>0.00元</strong>
                </p>
                <p>
                    冻结金额：<strong>0.00元</strong>
                </p>
                <p>
                    <a href="${ctx}/p2p/user/p2pAccountRechargeRecord/loadRechargeRecord">
                        <button class="btn btn-danger">充值</button>
                    </a>
                    <a href="${ctx}/p2p/user/p2pAccountWithdrawRecord/loadWithdrawRecord">
                        <button class="btn" style="background: #2481e0;color: #FFFFFF;">提现</button>
                    </a>
                </p>
            </div>
            <div class="zh-right-top-right-bot" style="font-size: 18px;text-align: left;">
                累计投资金额：<strong style="font-size: 24px;"><span id="accIncome"><fmt:formatNumber
                    pattern="#,##0.00">${sum}</fmt:formatNumber>元</span></strong>
            </div>
        </div>
        <div class="clearfix"></div>
        <!--右侧下部-->
        <!--右侧下部-->
        <div class="zh-right-bot">
            <img src="${ctxStatic}/dist-gyh/images/tjbd.png" alt="" style="width: 100%;margin-bottom:10px; ">
            <div class="table-responsive">
                <table class="table zh-right-bot-table" style="word-break:keep-all;white-space:nowrap;">
                    <thead>
                    <tr>
                        <td style="width: 10%;">债项名称</td>
                        <td style="width: 10%;">融资企业</td>
                        <td style="width: 7%;">信用级别</td>
                        <td style="width: 9%;">利率（年化）</td>
                        <td style="width: 7%;">债项状态</td>
                        <td style="width: 10%;">剩余额度（元）</td>
                        <td style="width: 7%;">融资进度</td>
                        <td style="width: 6%;">剩余时间</td>
                        <td style="width: 10%;">操作</td>
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

                                <td style="color:#333"><span title="${p2pInvestment.finacingName }"><a
                                        style="color:blue;"
                                        href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pInvestment.id}">${fns:abbr(p2pInvestment.finacingName,8 )}</a></span>
                                </td>
                                <td style="color:#333"
                                    title="${p2pInvestment.p2pEnterpriseCertify.enterpriseName }">${fns:abbr(p2pInvestment.p2pEnterpriseCertify.enterpriseName,15 )}</td>

                                <td style="color:#333">${p2pInvestment.p2pFinancingRatingInfo.ratingLevel }</td>
                                <td style="color:#333"><fmt:formatNumber
                                        pattern="#0.00">${p2pInvestment.p2pFinancingRatingInfo.recommendedRate*100 }</fmt:formatNumber>%
                                </td>
                                <!-- 				                <td>${fns:getDictLabel(p2pInvestment.currentStage,"progress_stage","") }</td> -->
                                <c:if test="${p2pInvestment.currentStage == 500}">
                                    <td>热投中</td>
                                </c:if>
                                <c:if test="${p2pInvestment.currentStage != 500}">
                                    <td>${fns:getDictLabel(p2pInvestment.currentStage,"progress_stage","") }</td>
                                </c:if>
                                <td><c:out value="${p2pInvestment.restRaiseMoney }" default="--"></c:out></td>
                                <td id="jindutiao${p2pInvestment.id}">
                                </td>
                                <td id="sta${p2pInvestment.id}" name="sta" class="sta"></td><!-- 倒计时 -->
                                <!-- 	                        <td><input class="touzizq-button" type="button" value="立即投资" onclick="investment();"></td> -->
                                <td><a class="buts"
                                       href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pInvestment.id}">立即投资</a>
                                </td>
                                <!-- 		                    	<a class="touzizq-button2" href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pInvestment.id}">立即投资</a> -->
                            </tr>

                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                <div class="holder"></div>
            </div>
            <!--分页-->
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->
<!-- 引入footer文件 -->
<!--账户总览内容区域结束-->
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    //进度条
    $(function () {
        var list = eval("(" + '${json}' + ")");
        if (list != null && list.length > 0) {
            for (var i in list) {
                var idd = list[i].id;
                var percentAmount = list[i].hasRaiseAmount;
                if (percentAmount == null || percentAmount == undefined) {
                    percentAmount = 0;
                }
                var percent = percentAmount / list[i].financingAmount;
                percent = percent.toFixed(4);
                var jindu = percent * 100;
                jindu = jindu.toFixed(2) + "%";//保留小数点后两位小数


                var width = parseFloat(jindu);
                var str = "<div class='progress plan'><div id='" + idd + "' style='width:" + jindu + ";color: black;' class='progress-bar' role='progressbar' aria-valuenow='" + width + "' aria-valuemin='0' aria-valuemax='100'>" + jindu + "</div></div>";
                $("#jindutiao" + idd).html(str);
            }
            var InterValObj = window.setInterval(function () {
                _fresh()
            }, 1000); //间隔函数，1秒执行
            function _fresh() {
                for (var k = 0; k < list.length; k++) {
                    var stas = "sta" + list[k].id;
                    var remainTime;
                    var obj = list[k].raiseTimeLimit;//截止日期
                    var lastPublishTime = list[k].lastPublishTime;//最新发布时间
                    if (lastPublishTime == null || lastPublishTime == undefined) {
                        lastPublishTime = 0;
                    }
                    var hasRaiseTime = list[k].hasRaiseTime;//已募集时间
                    if (hasRaiseTime == null || hasRaiseTime == undefined) {
                        hasRaiseTime = 0;
                    }
                    var currentStage = list[k].currentStage;//债项状态
                    if (currentStage == null || currentStage == undefined) {
                        currentStage = 0;
                    }
                    var inRaiseState = list[k].inRaiseState;//募集中状态
                    if (inRaiseState == null || inRaiseState == undefined) {
                        inRaiseState = 0;
                    }
                    var nowtime;//当前时间
                    var endtime;//结束时间
                    var leftsecond;//剩余时间秒数
                    var inRaiseState = list[k].inRaiseState;
                    if (inRaiseState == null || inRaiseState == undefined) {
                        inRaiseState = 0;
                    }
                    endtime = obj * 24 * 3600;
                    nowtime = new Date();
                    var leftsecond = parseInt(endtime - (nowtime.getTime() - lastPublishTime + hasRaiseTime * 1000) / 1000); //剩余时间
                    if (currentStage == 500 && inRaiseState == 0) {
                        if (leftsecond > 0) {
                            var _d = parseInt(leftsecond / 3600 / 24); //计算天
                            var _h = parseInt((leftsecond / 3600) % 24); //计算时
                            var _m = parseInt((leftsecond / 60) % 60); //计算分
                            var _s = parseInt(leftsecond % 60); //计算秒
                            remainTime = _d + "天" + _h + "小时" + _m + "分" + _s + "秒";
                        } else {
                            remainTime = "募集已结束";
                        }
                    } else if (currentStage == 500 && inRaiseState == 1) {
                        remainTime = "募集已暂停";
                    } else {
                        remainTime = "募集已结束";
                    }
                    $("#" + stas).text("" + remainTime);
                }
            }
        }
    })

    /**
     加载未读消息
     */
    var unMessUrl = "${ctx}/msg/msgLetterRecord/unReadMessageCount";//未读消息服务端的URL

    $.get(unMessUrl, function (data) {
        /* alert(data); */
        //alert(data);
        $("#unReadMes").text(data);
    });

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

</script>
<script type="text/javascript">
    $(function () {
        //未读消息读取
        $.get("${ctx}/msg/msgLetterRecord/unReadMessageCount", function (data) {
            //alert(data);
        });
        /* $.get("
        ${ctx}/user/accountGeneration/queryAccIncome",function(data){
         if(data==''||data==undefined||data.length>10){
         $("#accIncome").text("0.00元");
         }
         else{
         $("#accIncome").text(data+"元");
         }

         }) */

        /*
         setTimeout(function(){
         alert($(".menuCls"));
         },10); */


    })
</script>
<!-- <button id="lib" type="btn btn-success">测试modal库</button>
<script type="text/javascript">
	$(function(){
		$("#lib").click(function(){
			alert("lib");
			var modalLib=new ModalLib("modalId","title","body");
			alert(modalLib);
			modalLib.open();
			})
	})
</script> -->
</body>
</html>
  