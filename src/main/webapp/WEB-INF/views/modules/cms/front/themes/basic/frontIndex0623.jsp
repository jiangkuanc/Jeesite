<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/indexfront.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <!-- <link rel="stylesheet" href="${ctxStatic}/dist/css/zhaixiang.css"> -->
    <link rel="stylesheet" href="${ctxStatic}/dist/css/qq_chat.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/index.js"></script>
    <%-- <script src="${ctxStatic}/dist/js/qq_chat.js"></script> --%>

    <style type="text/css">
        /*悬浮窗*/
        #body .bridge-IconWrap-bottom1 {
            top: 72%;
            width: 120px;
        }

        #body .bridge-IconWrap-bottom2 {
            width: 25px;
        }

    </style>
    <SCRIPT src="http://123.57.217.46:17000/static/jquery.min.js" type="text/javascript" charset="utf-8"></SCRIPT>
    <SCRIPT id="MyCommWebChat" src="http://123.57.217.46:17000/js/webchat.js?service_id=mw_default_webchat"
            type="text/javascript" charset="utf-8"></SCRIPT>
    <script type="text/javascript">
        function channel() {
            var mycommwebchat = new MyCommWebchat();
            result = mycommwebchat.get_service_agents("http://123.57.217.46:17000/?service_id=mw_default_webchat");
            alert(JSON.stringify(result.queues));
        }
        //悬浮窗top
        /* $(function () {
         $(".bridge-IconWrap-bottom1").css({"top":"73%"});
         //top
         $("#bridgehead,#bridgeopacity,#QueueMycommWebchat,#IconContainer,.callWebChat").css({"width":"100px"});
         $(".opacitymask").css({"width":"85px"});

         //高度控制
         $("#QueueMycommWebchat").css({"height":"50px"})
         $("#bridgebottom .MyCommWebChat-icon-left").css({"top":"-28px"})
         $("#MyCommWebChatFixedWrap #IconContainer, #MyCommWebChatIconWrap #IconContainer").css({top:28   })
         }) */
        $(function () {
//        $('#leavemg_skdgxy01@dgxy.mycommipcc.cn').css('height','65px');
            $('div.MyCommWebChat-icon-right').css({
                'background': 'url("${ctxStatic}/dist/images/01.png")',
                'width': '92px',
                'height': '125px',
                'margin': '0px 0 0 30px',
                'padding-top': '130px',
                'background-size': 'cover'

            });
            $('#bridgehead').css('display', 'none');
            $('#MyCommWebChat-left-close').css('display', 'none');
            $('#QueueMycommWebchat').css({
                'background': 'none',
                'margin': '-60px 0 0 0'
            });
            $('.opacitymask').css({
                'border': '1px solid #0f4b70',
                'background': 'none',
                'border-radius': '10px',
                'height': '20px',
                'width': '80px',
                'text-align': 'center'
            });
            $('#IconContainer .MyCommWebChat-group-item').css({
                'overflow': 'visible'
            });

            $('div.mycommwebchat-group-img').css({
                'display': 'none'
            });
            $('.MyCommWebChat-group-item .callWebChat').css({
                'margin': '150px 0 0 20px'
                /* 'border-radius':'20px',
                 'height':'35px',
                 'width':'140px',
                 'text-align':'center' */
            });
            $('.masktxt').css({
                'font-size': '12px',
                'color': '#0f4b70',
                'text-align': 'center',
                'top': '1px',
                'left': '-36px'
            });
            $('#IconContainer .mycommwebchat-group-img-disable').css('visibility', 'hidden');
            $('#IconContainer .MyCommWebChat-icon-group').css('overflow', 'visible');
            $('#MyCommWebChatIconWrap').css('top', '72%');
            $('#QueueMycommWebchat').append('<h3 style="color: #0f4b70;font-size: 12px;width: 160px;margin: -5px 0 0 12px;">Online talking</h3>')
        });
    </script>
</head>

<body id="body" style="background-color:#ffffff;">
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<div class="container-fluid" style="margin: 0px;padding: 0px;overflow: hidden;">
    <div class="row">
        <div class="col-md-12 lunbotu">
            <!--<img src="images/slhj_index_02.jpg" alt="轮播图站位" style="width: 100%;height: 100%;">-->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators" id="diandiandian">
                    <!--             <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li> -->
                    <!--             <li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
                    <!--             <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
                    <!--             <li data-target="#carousel-example-generic" data-slide-to="3"></li> -->
                </ol>
                <!-- Wrapper for slides -->
                <div id="banner" class="carousel-inner" role="listbox">
                    <div id="firstd" class="item active">
                    </div>
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <!-- <span class="glyphicon" aria-hidden="true"> < </span> -->
                    <span class="glyphicon" aria-hidden="true"
                          style="font-weight:800;display: block;top: 125px; font-size:80px;position: relative;"> < </span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <!-- <span class="glyphicon" aria-hidden="true"> > </span> -->
                    <span class="glyphicon" aria-hidden="true"
                          style="font-weight:800;display: block;top: 125px; font-size:80px; position: relative;"> > </span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>
<!--轮播图下方内容-->
<%-- <a id="left"  class="index-xuanfu-left left-and-right" href="javascript:void(0);"><img src="${ctxStatic}/dist/images/index-xuanfu-left_03.jpg" style="width:100%;height:100%;"/></a>
<div  class="index-xuanfu-left-close chahao"></div>
<a id="right"  class="index-xuanfu-right left-and-right" href="javascript:void(0);"><img src="${ctxStatic}/dist/images/index-xuanfu-right_03.jpg" style="width:100%;height:100%;"/></a>
<div  class="index-xuanfu-right-close chahao"></div> --%>
<%--
    右侧的两个二维码
    <div class="index-ss">
      <img src="${ctxStatic}/dist/images/dgjt.jpg" style="width: 58px;height: 131px;"/>
  </div> --%>

<!-- <a id="index-qq" class="index-qq" ></a> -->
<!-- 	<div id="qq_icon"></div> -->
<div id="cs_online" style="z-index: 9999;">
    <div class="side_title">
        <a title="隐藏" class="close_btn" onclick="toRight();"><span>关闭</span>
            <img src="${ctxStatic}/dist/images/arrow_carrot-right.png" alt="" style="width:19px;height:19px;">
        </a>
    </div>
    <ul class='qq_context'>
        <li>
            <span class='span_t'>客服Angelia：</span>
            <span class='qq_num'></span>
        </li>
        <li>
            <span class='span_t'>&nbsp;&nbsp;&nbsp;客服Vivian：</span>
            <span class='qq_num'></span>
        </li>
        <li>
            <span class='span_t'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客服Joy：</span>
            <span class='qq_num'></span>
        </li>
    </ul>
</div>
<div class="container" style="margin-bottom: 100px;">
    <div class="row" style="margin: 80px 0;">
        <div class="col-md-6" style="padding: 0;">
            <div class="title-nav">
                <h4 class="pull-left">企业借贷评级报告</h4>
                <a href="${ctx}/financing/p2pFinancingRatingInfo/getRatingList?ratingType=1" class="pull-right"
                   style="margin-right: 15px;">更多>></a>
                <div class="clearfix"></div>
            </div>
            <div class="tw tw-1">
                <div class="pull-left">
                    <img src="${ctxStatic}/dist/images/slhj_index_08.jpg" alt="">
                </div>
                <div class="pull-right">
                    <ul class="list-group" id="financingRating">
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="title-nav" style="margin-left: 15px;">
                <h4 class="pull-left">企业主体评级报告</h4>
                <a href="${ctx}/financing/p2pFinancingRatingInfo/getRatingList?ratingType=2" class="pull-right">更多>></a>
                <div class="clearfix"></div>
            </div>
            <div class="tw" style="margin-left:15px;">
                <div class="pull-left">
                    <img src="${ctxStatic}/dist/images/slhj_index_05.jpg" alt="">
                </div>
                <div class="pull-right">
                    <ul class="list-group zt" id="mainRating">
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9 " style="width: 73%;">
            <div class="title-nav" style="margin-top: -25px;">
                <h4 class="pull-left">投资专区</h4>
                <a href="${ctx}/financing/p2pFinancingInformation/preLoadFinancingList" class="pull-right">更多>></a>
                <div class="clearfix"></div>
            </div>
            <div class="container-fluid">
                <div class="row tzzq">
                    <div class="col-md-6" id="touzi1" style="height: 130px;">
                    </div>
                    <div class="col-md-6" id="touzi2" style="height: 130px;">
                    </div>
                    <div class="col-md-6" id="touzi3" style="height: 130px;">
                    </div>
                    <div class="col-md-6" id="touzi4" style="height: 130px;">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 kt" style="border:1px solid #be191f;width: 25%;margin: 15px 0 0 23px;height: 281px;">
            <h3>快速投资</h3>
            <div class="kt-div">
                <span class="pull-left">年利率</span>
                <div class="dropdown pull-left" id="select1">
                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="true">
                        <span>请选择</span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li value="0~0.08">8%以下</li>
                        <li value="0.08~0.1">8%-10%</li>
                        <li value="0.1~0.15">10%-15%</li>
                        <li value="0.15~1">15%以上</li>


                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="kt-div">
                <span class="pull-left">信用级别</span>
                <div class="dropdown pull-left" id="select2">
                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="true">
                        <span>请选择</span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="height: 200px;overflow: auto;">
                        <li value="AAA">AAA</li>
                        <li value="AA+">AA+</li>
                        <li value="AA">AA</li>
                        <li value="AA-">AA-</li>
                        <li value="A+">A+</li>
                        <li value="A">A</li>
                        <li value="A-">A-</li>
                        <li value="BBB+">BBB+</li>
                        <li value="BBB">BBB</li>
                        <li value="BBB-">BBB-</li>
                        <li value="BB+">BB+</li>
                        <li value="BB">BB</li>
                        <li value="BB-">BB-</li>
                        <li value="B+">B+</li>
                        <li value="B">B</li>
                        <li value="B-">B-</li>
                        <li value="CCC">CCC</li>
                        <li value="CC">CC</li>
                        <li value="C">C</li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="kt-div">
                <span class="pull-left">投资期数</span>
                <div class="dropdown pull-left" id="select3">
                    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="true">
                        <span>请选择</span>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li value="12">12个月</li>
                        <li value="9">9个月</li>
                        <li value="6">6个月</li>
                        <li value="3">3个月</li>
                        <li value="1">1个月</li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <button class="btn btn-danger center-block" onclick="searchFast();">查看项目</button>
        </div>
    </div>
    <div class="row" style="margin: 80px 0;">
        <div class="col-md-8 xyjs">
            <div class="title-nav"
                 style="margin: -27px 0 0 -15px;border-bottom: 1px solid #cccccc;padding-bottom: 5px;">
                <h4 class="pull-left">信用建设</h4>
                <a href="${ctx}/cms/article/xinyongjiaoyu" class="pull-right" style="margin-right: 0px;">更多>></a>
                <div class="clearfix"></div>
            </div>
            <div class="container-fluid" style="padding: 0 15px 0 0;">
                <div class="row">
                    <div class="col-md-6" id="xyjyjt">
                        <h3>信用教育讲堂</h3>
                    </div>
                    <div class="col-md-6">
                        <h3>信用教育视频</h3>
                        <c:forEach items="${fnc:getLinkList(site.id, 30, 5, '')}" var="link" varStatus="status"
                                   begin="0" end="3">
                            <a href="${ctx}/cms/link/videodetails?pid=${link.id}&siteId=1">
                                <span class="pull-left" title="${link.title }">${link.title}</span>
                                <span class="pull-right">${link.speaker}</span>
                                <div class="clearfix"></div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 xyjscg">
            <div class="title-nav" style="margin: -27px 0 20px 0;">
                <h4 class="pull-left">信用建设成果</h4>
                <!--  <a href="###" class="pull-right">更多>></a> -->
                <div class="clearfix"></div>
            </div>
            <a href="###" class="xyjscg-a">
                <img src="${ctxStatic}/dist/images/slhj_index_03.png" alt="">
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 ptjj">
            <div class="title-nav" style="margin: -27px 0 20px 0;">
                <h4 class="pull-left">丝路互金网简介</h4>
                <a href="${ctx}/cms/article/cydiaProfile" class="pull-right">更多>></a>
                <div class="clearfix"></div>
            </div>
            <a href="${ctx}/cms/article/cydiaProfile" class="pull-right"><img
                    src="${ctxStatic}/dist/images/slhj_index_20.png" alt=""></a>
        </div>
        <div class="col-md-4 pjffjs">
            <div class="title-nav" style="margin: -27px 0 20px 0;">
                <h4 class="pull-left">风控体系</h4>
                <a href="${ctx}/cms/article/safetyGuarantee" class="pull-right">更多>></a>
                <div class="clearfix"></div>
            </div>
            <div class="pjffjs-div">
                丝路互金网信用风险管控体系充分满足了债权人与债务人运用互联网技术高效安全构建信用关系的互联网金融本质要求，创造了让借贷资本在全程信用风险管理的互联网环境中运行，让债权人与债务人充分享有信用价值获得感的互联网金融模式。
            </div>
        </div>
        <div class="col-md-4 ptgg">
            <div class="title-nav" style="margin: -27px 0 20px 0;">
                <h4 class="pull-left">平台公告</h4>
                <a href="${ctx}/cms/article/gonggao" class="pull-right">更多>></a>
                <div class="clearfix"></div>
            </div>
            <div class="ptgg-div">
                <c:forEach items="${fnc:getArticleList(site.id, 24, 5, '')}" var="article" varStatus="status" begin="0"
                           end="4">
                    <c:if test="${article.statusCode eq '5'}">
                        <a href="${ctx}/cms/article/gonggaoDetails?pid=${article.id}">
                            <span title="${article.title }" class="pull-left">${fns:abbr(article.title,50)}</span>
                            <span class="pull-right"><fmt:formatDate value="${article.updateDate}"
                                                                     pattern="yyyy-MM-dd"/></span>
                            <div class="clearfix"></div>
                        </a>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- 合作伙伴 -->
<!-- 引入thePartner文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/thePartner.jsp" %>

<!-- 页脚 -->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">

    var earnRate = "";
    var ratingLevel = "";
    var financingMaturity = "";

    //控制快速投资下拉选
    $(function () {
        var liAll = $('.dropdown .dropdown-menu li');
        $.each(liAll, function (i) {
            $(liAll[i]).click(function () {
                var liVal = $(this).html();
                $(this).parent().parent().find('.dropdown-toggle span:first-child').html(liVal);
            });
        });
        $("#select1 ul li").click(function () {
            earnRate = $(this).attr("value");
        })
        $("#select2 ul li").click(function () {
            ratingLevel = $(this).attr("value");
        })
        $("#select3 ul li").click(function () {
            financingMaturity = $(this).attr("value");
        })
    })
    function searchFast() {
        window.location.href = '${ctx}/financing/p2pFinancingInformation/preLoadFinancingList?earnRate=' + earnRate + '&ratingLevel=' + ratingLevel + '&financingMaturity=' + financingMaturity;
    }

    //qq事件
    //myEvent(window,'load',function(){
    //dealy('index-qq',1);						//1秒后显示QQ图标，默认为1秒，可自行设置
    // 		settop('index-qq','cs_online',150);		//设置在线客服的高度，默认150，可自行设置
    //	var span_q = getbyClass('cs_online','qq_num');
    //setqq(span_q,['3401739979','2648581373','3394252607']);//填写3个QQ号码
    //click_fn('index-qq','cs_online');
    //});
    $(function () {
        $(".side_title").click(function () {
            $("#cs_online").css("opacity", "100");
// 			$("#cs_online").hide(1000);
            $("#cs_online").animate({right: '-220px'}).fadeIn("fast");
        })
    })
    //加载评级信息
    $(function () {
        $.ajax({
            url: "${ctx}/financing/p2pFinancingRatingInfo/findFiveList",
            type: 'post',
            async: true,
            dataType: 'json',
            success: function (data) {
                var financingList = data.financingList;
                var html1 = "";
                for (var i = 0; i < financingList.length; i++) {
                    var name = financingList[i]['p2pFinancingInformation']['finacingName'];
                    var nameStr = "";
                    if (name.length > 20) {
                        nameStr = name.substr(0, 27) + "...";
                    } else {
                        nameStr = name;
                    }
                    html1 += "<li class='list-group-item'>" +
                        "<a href='${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=" + financingList[i]['id'] + "' class='pull-left text-overflow'>" + nameStr + "</a>" +
                        "<p class='pull-right'>[" + financingList[i]['ratingLevel'] + "]</p>" +
                        "<div class='clearfix'></div>" +
                        "</li>";
                }
                $("#financingRating").html(html1)

                var ratingList = data.ratingList;
                var html2 = "";
                for (var i = 0; i < ratingList.length; i++) {
                    var name = ratingList[i]['p2pEnterpriseCertify']['enterpriseName'];
                    var nameStr = "";
                    if (name.length > 20) {
                        nameStr = name.substr(0, 27) + "...";
                    } else {
                        nameStr = name;
                    }
                    html2 += "<li class='list-group-item'>" +
                        "<a href='${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=" + ratingList[i]['id'] + "' class='pull-left text-overflow'>" + nameStr + "</a>" +
                        "<p class='pull-right'>[" + ratingList[i]['mainCreditGrade'] + "/" + ratingList[i]['rateExpectation'] + "]</p>" +
                        "<div class='clearfix'></div>" +
                        "</li>";
                }
                $("#mainRating").html(html2)
            }
        });
    });

    //加载投资信息
    $(function () {
        $.ajax({
            url: "${ctx}/financing/p2pFinancingInformation/findFourFinancingInfo",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var id = data[i].id;
                    var name = data[i].finacingName;
                    var currentStage = data[i].currentStage;
                    var nameStr = name.substr(0, 11);
                    var financingAmount = 1;
                    if (data[i].financingAmount >= data[i].applicationAmount) {
                        financingAmount = data[i].applicationAmount;
                    } else {
                        financingAmount = data[i].financingAmount;
                    }
                    var restRaiseMoney = data[i].restRaiseMoney;
                    var id2 = data[i].p2pFinancingRatingInfo.id;
                    var ratingLevel = data[i].p2pFinancingRatingInfo.ratingLevel;
                    var recommendedRate = data[i].p2pFinancingRatingInfo.recommendedRate;
                    var rateStr = recommendedRate * 100;
                    rateStr = rateStr.toFixed(2);
                    var hasRaiseAmount = data[i].hasRaiseAmount;
                    var percent = hasRaiseAmount / financingAmount;
                    percent = (percent * 100).toFixed(2);
                    var jindu = percent + "%";
                    var width = parseFloat(jindu);
                    var raiseTimeLimit = data[i].raiseTimeLimit;
                    var lastPublishTime = data[i].lastPublishTime;
                    var hasRaiseTime = data[i].hasRaiseTime;
                    var nowDate = new Date();
                    var expireDate = raiseTimeLimit * 24 * 3600 * 1000 + (lastPublishTime - hasRaiseTime * 1000);
                    expireDate = new Date(expireDate);
                    //如果字符串长度超过11后面加...,否则为全称
                    if (name.length > 10) {
                        nameStr = nameStr + "...";
                    } else {
                        nameStr = nameStr;
                    }
                    var html = "";
                    //if(expireDate >= nowDate){
                    if (currentStage == '600') {
                        html = "<div class='pull-left'>" +
                            "<h4>" +
                            "<a href='${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=" + id + "'>" + nameStr + "</a>" +
                            "<span>收益率（年化）</span>" +
                                /* "<span>"+rateStr+"%</span>"+ */
                            "</h4>" +
                            "<div class='tzzq-div'>" +
                            "<div class='tzzq-div-div'>" +
                            "<span style='color:#909090;'>级别</span><br>" +
                            "<span><span style='width:30px;color:#909090;'>" + ratingLevel +
                            "</span><span><a href='${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=" + id2 + "'>" +
                            "<img alt='' src='${ctxStatic}/dist/images/pdfDemo.png' height='15' width='15'/></a></span></span>" +
                            "</div>" +
                            "<div class='tzzq-div-div'>" +
                            "<span style='width:100px;color:#909090;'>剩余额度（元）</span>" +
                            "<span style='color:#909090;'>" + formatCurrency(restRaiseMoney) + "</span>" +
                            "</div>" +
                            "<div class='tzzq-div-div'>" +
                            "<span style='color:#909090;'>进度</span>" +
                            "<div class='progress'>" +
                            "<div class='progress-bar' role='progressbar' aria-valuenow='" + width + "' aria-valuemin='0' aria-valuemax='100' style='width: " + jindu + ";'>" +
                            "<i style='color:white;'>" + jindu + "</i>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "<div class='clearfix'></div>" +
                            "</div>" +
                            "</div>" +
                            "<div class='pull-right'>" +
                            "<p style='margin-left: 30px;'>" + rateStr + "%</p>" +
                            "<a class='btn btn-danger' disabled='true' style='background:#909090;border-color:#909090' href='javascript:void(0)'>立即投资</a>" +
                            "</div>" +
                            "<div class='clearfix'></div>";
                    } else {
                        html = "<div class='pull-left'>" +
                            "<h4>" +
                            "<a href='${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=" + id + "'>" + nameStr + "</a>" +
                            "<span>收益率（年化）</span>" +
                            "</h4>" +
                            "<div class='tzzq-div'>" +
                            "<div class='tzzq-div-div'>" +
                            "<span style='color:#909090;'>级别</span><br>" +
                            "<span><span style='width:30px;color:#909090;'>" + ratingLevel +
                            "</span><span><a href='${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=" + id2 + "'>" +
                            "<img alt='' src='${ctxStatic}/dist/images/pdfDemo.png' height='15' width='15'/></a></span></span>" +
                            "</div>" +
                            "<div class='tzzq-div-div'>" +
                            "<span style='width:100px;color:#909090;'>剩余额度（元）</span>" +
                            "<span style='color:#909090;'>" + formatCurrency(restRaiseMoney) + "</span>" +
                            "</div>" +
                            "<div class='tzzq-div-div'>" +
                            "<span style='color:#909090;'>进度</span>" +
                            "<div class='progress'>" +
                            "<div class='progress-bar' role='progressbar' aria-valuenow='" + width + "' aria-valuemin='0' aria-valuemax='100' style='width: " + jindu + ";'>" +
                            "<i style='color:black;'>" + jindu + "</i>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "<div class='clearfix'></div>" +
                            "</div>" +
                            "</div>" +
                            "<div class='pull-right'>" +
                            "<p style='margin-left: 30px;'>" + rateStr + "%</p>" +
                            "<a class='btn btn-danger' href='${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=" + id + "'>立即投资</a>" +
                            "</div>" +
                            "<div class='clearfix'></div>";
                    }
                    // }
                    $("#touzi" + (i + 1)).html(html);

                }
            }
        });
    })
    function formatCurrency(num) {
        num = num.toString().replace(/\$|\,/g, '');
        if (isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num * 100 + 0.50000000001);
        cents = num % 100;
        num = Math.floor(num / 100).toString();
        if (cents < 10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
            num = num.substring(0, num.length - (4 * i + 3)) + ',' +
                num.substring(num.length - (4 * i + 3));
        return (((sign) ? '' : '-') + num + '.' + cents);
    }
    $(function () {
        $.ajax({
            url: "${ctx}/cms/article/xyjyJiangTang",
            type: 'get',
            async: true,
            dataType: 'json',
            success: function (data) {
                var $xyjyjt = $("#xyjyjt");
                $xyjyjt.html(creatHtml());
                function creatHtml() {
                    var newHtml = '';
                    $.each(data, function (index, item) {
                        if (index < 4) {
                            newHtml += '<a href="${ctx}/cms/article/JiangTangDetails?pid=' + item.pid + '">' + item.title + '</a>';
                        }
                    });
                    newHtml = "<h3>信用教育讲堂</h3>" + newHtml;
                    return newHtml;
                }
            }
        })
    });

    //关闭左右侧广告
    $(function () {
        $(".index-xuanfu-left-close").click(function () {
            $(this).hide();
            $(".left-and-right").hide();
            $(".chahao").hide();
        })
    });
    $(function () {
        $(".index-xuanfu-right-close").click(function () {
            $(this).hide();
            $(".left-and-right").hide();
            $(".chahao").hide();
        })
    });

    //查询广告链接信息
    $(function () {
        $.ajax({
            url: "${ctx}/p2p/config/p2pAdvertiserment/getAdvertisement",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var flag = 0;
                for (var i = 0; i < data.length; i++) {
                    var position = data[i]['position'];
                    var isEnableLink = data[i]['isEnableLink'];
                    var adPicture = data[i]['adPicture'];
                    var linkAddress = data[i]['linkAddress'];
                    var openWay = data[i]['openWay'];
                    var count = 0;
                    if (position == '2') {
// 							$("#left").removeAttr("hidden");
// 							$("#left").next(".chahao").removeAttr("hidden");
                        $("#left img").attr("src", adPicture);
                        if (isEnableLink == '1') {
                            $("#left").attr("href", linkAddress);
                            if (openWay == '1') {
                                $("#left").attr("target", "_blank");
                            }
                        }
                    }
                    if (position == '3') {
// 							$("#right").removeAttr("hidden");
// 							$("#right").next(".chahao").removeAttr("hidden");
                        $("#right img").attr("src", adPicture);
                        if (isEnableLink == '1') {
                            $("#right").attr("href", linkAddress);
                            if (openWay == '1') {
                                $("#right").attr("target", "_blank");
                            }
                        }
                    }
                    if (position == '1') {
                        if (flag == 0) {
                            var linkAddressStr = JSON.stringify(linkAddress);
                            var openWayStr = JSON.stringify(openWay);
                            flag = 1;
                            var banner = '';
                            if (isEnableLink == '1') {
                                banner = "<img style='cursor:pointer;' src='" + adPicture + "' onclick='getUrl(" + openWayStr + "," + linkAddressStr + ")' alt=''/>";
                            } else {
                                banner = "<img src='" + adPicture + "' alt=''/>";
                            }
                            $("#firstd").html(banner);

                        } else {
                            if (flag == 1) {
                                var dian1 = "<li data-target='#carousel-example-generic' data-slide-to='0' class='active'></li>";
                                $("#diandiandian").append(dian1);
                            }
                            var div = '';
                            var dian = "<li data-target='#carousel-example-generic' data-slide-to='" + flag + "'></li>";
                            if (isEnableLink == '1') {
                                var linkAddressStr = JSON.stringify(linkAddress);
                                var openWayStr = JSON.stringify(openWay);
                                div = "<div class='item'>" +
                                    "<img src='" + adPicture + "' style='cursor:pointer;' onclick='getUrl(" + openWayStr + "," + linkAddressStr + ")' alt=''/>" +
                                    "</div>";
                            } else {
                                div = "<div class='item'>" +
                                    "<img src='" + adPicture + "' alt=''/>" +
                                    "</div>";
                            }
                            flag += 1;
                            $("#diandiandian").append(dian);
                            $("#firstd").parent().append(div);
                        }
                    }
                }

            }
        })
    })
    //图片点击事件
    function getUrl(openWay, linkAddress) {
        if (openWay == '1') {
            window.open(linkAddress, '_blank');
        } else if (openWay == '2') {
            window.location.href = linkAddress;
        }
    }
</script>

<script type="text/javascript">
    //添加站点访问统计功能
    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    var writeStr = unescape("%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1261966600%26show%3Dpic' type='text/javascript'%3E%3C/script%3E");
    document.write(writeStr);
</script>


<!--  -->
</html>