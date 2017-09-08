<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>丝路互金网</title>
<link href="${ctxStatic}/index0623/src/bootstrap/css/bootstrap.css" rel="stylesheet">
<%-- <link rel="stylesheet" href="${ctxStatic}/index0623/dist/css/style.css"> --%>
<link rel="stylesheet" href="${ctxStatic}/index0623/src/jquery.jslides/css/jquery.jslides.css">
<link rel="stylesheet" href="${ctxStatic}/index0623/dist/css/animate.css">
<link rel="stylesheet" href="${ctxStatic}/index0623/src/liMarquee/css/liMarquee.css">
<title>丝路互金网</title>
<style>
    .video-wrap {
        position: relative;
    }

    .video-wrap > img {
        position: absolute;
        left: 0;
        top: 0;
        height: 100%;
    }
</style>
</head>
<SCRIPT src="https://dgxy.mycommipcc.cn:17000/static/jquery.min.js" type="text/javascript" charset="utf-8"></SCRIPT>
<SCRIPT id="MyCommWebChat" src="https://dgxy.mycommipcc.cn:17000/js/webchat.js?service_id=mw_default_webchat"
        type="text/javascript" charset="utf-8"></SCRIPT>
<script type="text/javascript">
    function channel() {
        var mycommwebchat = new MyCommWebchat();
        result = mycommwebchat.get_service_agents("https://dgxy.mycommipcc.cn:17000/?service_id=mw_default_webchat");
        // alert(JSON.stringify(result.queues));
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
        });
        $('.masktxt').css({
            'font-size': '12px',
            'color': '#0f4b70',
            'text-align': 'center',
            'top': '1px',
            'left': '-36px'
        });
        /* 位置改动 */
        $('#IconContainer .bridge-icon-bottom1').css({
            'position': 'relative',
            'width': '172px',
            'margin-left': '50px',
            'top': '-106px'
        });
        $('#IconContainer .mycommwebchat-group-img-disable').css('visibility', 'hidden');
        $('#IconContainer .MyCommWebChat-icon-group').css('overflow', 'visible');
        $('#MyCommWebChatIconWrap').css('top', '72%');
        $('#QueueMycommWebchat').append('<h3 style="color: #0f4b70;font-size: 12px;width: 160px;margin: -5px 0 0 12px;">Online talking</h3>')
    });
</script>


<body>
<!--头部-->
<!--导航条-->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--banner轮播图-->
<div class="container-fluid bannerContainer">
    <div id="full-screen-slider">
        <ul id="slides">
            <li style="background:url('${ctxStatic}/index0623/dist/img/banner.png') no-repeat center top;"><a
                    href="javascript:;"></a></li>
            <li style="background:url('${ctxStatic}/index0623/dist/img/banner2.jpg') no-repeat center top;"><a
                    href="javascript:;"></a></li>
            <li style="background:url('${ctxStatic}/index0623/dist/img/banner.png') no-repeat center top;"><a
                    href="javascript:;"></a></li>
        </ul>
    </div>
</div>

<!--内容区域-->
<div class="container dataContainer">
    <!--右侧客服图片-->
    <%-- <div class="online">
      <img src="${ctxStatic}/index0623/dist/img/online.png" alt=""/>
    </div> --%>

    <!--公告处-->
    <div class="announce">
        <img src="${ctxStatic}/index0623/dist/img/speaker.png" class="speaker"/>
        <!--文字滚动-->
        <div class="anTitle">
            <ul id="gonggao">
                <li>
                    <a href="">
                        <span></span>
                        <span class="spanTwo"></span>
                    </a>
                </li>
            </ul>
        </div>
        <a href="${ctx}/cms/article/gonggao" class="more">更多动态 <img src="${ctxStatic}/index0623/dist/img/right-icon.png"
                                                                    alt=""/></a>

        <!--内容-->
        <div class="row anCont">
            <!--视频-->
            <div class="col-md-3 col-xs-3 anLeft video-wrap">
                <div id="videos"></div>
                <img src="${ctxStatic}/index0623/dist/img/video.png" id='adv' width="285px">
            </div>

            <div class="col-md-9 col-xs-9 anRight">
                <div class="row">
                    <div class="col-md-4 col-xs-4 mediaBox">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="${ctxStatic}/index0623/dist/img/announcement1.png"/>
                                </a>
                            </div>
                            <div class="media-body">
                                <a href="${ctx}/cms/article/safetyGuarantee"><h4 class="media-heading">四位一体风控体系</h4></a>
                                <p>有效解决互联网信用风险信息不对称问题。</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-4 mediaBox">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="${ctxStatic}/index0623/dist/img/announcement2.png"/>
                                </a>
                            </div>
                            <div class="media-body">
                                <a href="${ctx}/rating/front/viewRatingRules"><h4 class="media-heading">数字化评级</h4></a>
                                <p>采用标准化、数字化评级，更高效、更精准、更客观。</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-4 mediaBox">
                        <div class="media">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object" src="${ctxStatic}/index0623/dist/img/announcement3.png"/>
                                </a>
                            </div>
                            <div class="media-body">
                                <a href="${ctx}/cms/article/xinyongjlcx"><h4 class="media-heading">全程信用管理</h4></a>
                                <p>信用评级报告与历史信用记录结合，投资不再盲目。</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--企业融资-->
    <div class="financing">
        <div class="fin-title">
            <h4>企业融资</h4>
            <img src="${ctxStatic}/index0623/dist/img/financing.png" class="textBg"/>
            <span>最快5步完成融资操作</span>
            <a href="${ctx}/user/p2pUserInformation/financingRule" class="pull-right">了解详情 <img
                    src="${ctxStatic}/index0623/dist/img/right-icon.png" alt=""/></a>
        </div>

        <div class="financMain">
            <ul>
                <li class="animated"><img src="${ctxStatic}/index0623/dist/img/rz1.png" alt=""/></li>
                <li class="animated"><span>1</span><img src="${ctxStatic}/index0623/dist/img/qyrz1.png" class="rzImg"/>
                </li>
                <li class="animated"><span class="rz-num2">2</span><img src="${ctxStatic}/index0623/dist/img/qyrz2.png"
                                                                        alt="" class="rzImg"/></li>
                <li class="animated"><span class="rz-num3">3</span><img src="${ctxStatic}/index0623/dist/img/qyrz3.png"
                                                                        alt="" class="rzImg"/></li>
                <li class="animated"><span class="rz-num4">4</span><img src="${ctxStatic}/index0623/dist/img/qyrz4.png"
                                                                        alt="" class="rzImg"/></li>
                <li class="animated"><span class="rz-num5">5</span><img src="${ctxStatic}/index0623/dist/img/qyrz5.png"
                                                                        alt="" class="rzImg"/></li>
                <li class="animated"><img src="${ctxStatic}/index0623/dist/img/rz7.png" alt=""/></li>
            </ul>
            <a href="${ctx}/user/p2pUserInformation/financingRule" class="lastLi"><h4>立即融资</h4></a>
        </div>
        <div class="clearfix"></div>
    </div>

    <!---->
    <div class="investment">
        <div class="inv-title">
            <h4>投资精选</h4>
            <img src="${ctxStatic}/index0623/dist/img/financing2.png" class="textBg"/>
            <span>借贷有风险，出借需谨慎！</span>
            <a href="${ctx}/financing/p2pFinancingInformation/preLoadFinancingList" class="pull-right">更多项目 <img
                    src="${ctxStatic}/index0623/dist/img/right-icon.png" alt=""/></a>
        </div>

        <div class="invMain">
            <!--蓝色-->
            <div class="row">
                <div id="touzi1" class="col-md-3 col-xs-6 invBox">
                    <div class="invTop">
                        <span class="biao">机构标</span>
                        <p class="first-p">信用等级 <b></b></p>
                        <p></p>
                        <p></p>
                    </div>

                    <div class="invText">
                        <p>借款期限: <span></span></p>
                        <b></b>
                        <p>年利率</p>
                        <p class="line"><span></span> <i></i></p>
                        <p class="sheng"></p>
                        <button class="btn invBtn">立即投资</button>
                    </div>
                </div>
                <div id="touzi2" class="col-md-3 col-xs-6 invBox">
                    <div class="invTop">
                        <span class="biao">机构标</span>
                        <p class="first-p">信用等级 <b></b></p>
                        <p></p>
                        <p></p>
                    </div>

                    <div class="invText">
                        <p>借款期限: <span></span></p>
                        <b></b>
                        <p>年利率</p>
                        <p class="line"><span></span> <i></i></p>
                        <p class="sheng"></p>
                        <button class="btn invBtn">立即投资</button>
                    </div>
                </div>
                <div id="touzi3" class="col-md-3 col-xs-6 invBox">
                    <div class="invTop">
                        <span class="biao">机构标</span>
                        <p class="first-p">信用等级 <b></b></p>
                        <p></p>
                        <p></p>
                    </div>

                    <div class="invText">
                        <p>借款期限: <span></span></p>
                        <b></b>
                        <p>年利率</p>
                        <p class="line"><span></span> <i></i></p>
                        <p class="sheng"></p>
                        <button class="btn invBtn"></button>
                    </div>
                </div>
                <div id="touzi4" class="col-md-3 col-xs-6 invBox invBox4">
                    <div class="invTop">
                        <span class="biao">机构标</span>
                        <p class="first-p">信用等级 <b></b></p>
                        <p></p>
                        <p></p>
                    </div>

                    <div class="invText">
                        <p>借款期限: <span></span></p>
                        <b></b>
                        <p>年利率</p>
                        <p class="line"><span></span> <i></i></p>
                        <p class="sheng"></p>
                        <button class="btn invBtn">立即投资</button>
                    </div>
                </div>
                <!--橙色--><!-- 个人标 暂时没有开通 -->
                <!-- <div class="row rowSecond">
                  <div class="col-md-3 col-xs-6 invBox invBox2">
                    <div class="invTop">
                      <span class="biao">个人标</span>
                      <p class="first-p">信用等级 <b>BBB+</b></p>
                      <p>威高集团有限公司2017年</p>
                      <p>新建工程借款项目1期</p>
                    </div>

                    <div class="invText">
                      <p>借款期限: <span>12个月</span></p>
                      <b>8.95%</b>
                      <p>年利率</p>
                      <p class="line"><span></span> <i>50%</i></p>
                      <p class="sheng">剩余额度:300000元</p>
                      <button class="btn invBtn">立即投资</button>
                    </div>
                  </div>
                  <div class="col-md-3 col-xs-6 invBox invBox2">
                    <div class="invTop">
                      <span class="biao">个人标</span>
                      <p class="first-p">信用等级 <b>BBB+</b></p>
                      <p>威高集团有限公司2017年</p>
                      <p>新建工程借款项目1期</p>
                    </div>

                    <div class="invText">
                      <p>借款期限: <span>12个月</span></p>
                      <b>8.95%</b>
                      <p>年利率</p>
                      <p class="line"><span></span> <i>50%</i></p>
                      <p class="sheng">剩余额度:300000元</p>
                      <button class="btn invBtn">立即投资</button>
                    </div>
                  </div>
                  <div class="col-md-3 col-xs-6 invBox invBox2">
                    <div class="invTop">
                      <span class="biao">个人标</span>
                      <p class="first-p">信用等级 <b>BBB+</b></p>
                      <p>威高集团有限公司2017年</p>
                      <p>新建工程借款项目1期</p>
                    </div>

                    <div class="invText">
                      <p>借款期限: <span>12个月</span></p>
                      <b>8.95%</b>
                      <p>年利率</p>
                      <p class="line"><span></span> <i>50%</i></p>
                      <p class="sheng">剩余额度:300000元</p>
                      <button class="btn invBtn">立即投资</button>
                    </div>
                  </div>
                  <div class="col-md-3 col-xs-6 invBox invBox4 invBox2">
                    <div class="invTop">
                      <span class="biao">个人标</span>
                      <p class="first-p">信用等级 <b>BBB+</b></p>
                      <p>威高集团有限公司2017年</p>
                      <p>新建工程借款项目1期</p>
                    </div>

                    <div class="invText">
                      <p>借款期限: <span>12个月</span></p>
                      <b>8.95%</b>
                      <p>年利率</p>
                      <p class="line"><span></span> <i>50%</i></p>
                      <p class="sheng">剩余额度:300000元</p>
                      <button class="btn invBtn">立即投资</button>
                    </div>
                  </div>
                </div> -->
            </div>
        </div>

        <!--信用评级-->
        <div class="rating">
            <div class="rat-title">
                <h4>信用评级</h4>
                <img src="${ctxStatic}/index0623/dist/img/financing.png" class="textBg"/>
                <span>企业发展，信用当先</span>
                <a href="${ctx}/financing/p2pFinancingRatingInfo/getRatingList?ratingType=1" class="pull-right">更多报告
                    <img src="${ctxStatic}/index0623/dist/img/right-icon.png" alt=""/></a>
            </div>

            <div class="ratMain">
                <div class="row">
                    <div class="col-md-3 col-xs-3 ratLeft">
                        <a href="${ctx}/rating/front/viewRatingRules"><img
                                src="${ctxStatic}/index0623/dist/img/creditImg.png" alt=""/></a>
                    </div>

                    <div class="col-md-9 col-xs-9 ratRight">
                        <div id="pingji1" class="row">
                            <!--  <div class="col-md-6 col-xs-6 ratBox">
                               <a  href=""><h4 id="ratName0">大公国际资信评估有限公司2017年新建工程...</h4></a>
                               <p class="ratText">借贷评级报告</p>
                               <p>借贷产品信用等级 ： <b id="ratClass0">AA</b></p>
                               <p>主体信用等级 ： <b id="ratClass1">AA/稳定</b></p>
                               <button class="btn ratBtn pull-right">购买报告</button>
                             </div>
                             <div class="col-md-6 col-xs-6 ratBox">
                               <a  href=""><h4 id="ratName1" >大公国际资信评估有限公司2017年新建工程...</h4></a>
                               <p class="ratText">借贷评级报告</p>
                               <p>借贷产品信用等级 ： <b id="ratClass2">AA</b></p>
                               <p>主体信用等级 ： <b id="ratClass3">AA/稳定</b></p>
                               <button class="btn ratBtn pull-right">购买报告</button>
                             </div> -->
                        </div>

                        <div id="pingji2" class="rowTwo row">
                            <!-- <div class="col-md-6 col-xs-6 ratBox">
                              <a href=""><h4>大公国际资信评估有限公司2017年新建工程...</h4></a>
                              <p class="ratText">主体评级报告</p>
                              <p>主体信用等级 ： <b>AA/稳定</b></p>
                              <button class="btn ratBtn pull-right">购买报告</button>
                            </div>
                            <div class="col-md-6 col-xs-6 ratBox">
                              <a href=""><h4>大公国际资信评估有限公司2017年新建工程...</h4></a>
                              <p class="ratText">主体评级报告</p>
                              <p>主体信用等级 ： <b>AA/稳定</b></p>
                              <button class="btn ratBtn pull-right">购买报告</button>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--信用教育-->
        <div class="education">
            <div class="row">
                <div class="col-md-3 col-xs-3 eduLeft">
                    <div class="edu-title">
                        <h4>信用教育</h4>
                        <img src="${ctxStatic}/index0623/dist/img/education.png" class="textBg"/>
                        <span>
	            <a href="">讲堂 ·</a>
	            <a href="">视频 ·</a>
	            <a href="">活动</a>
	          </span>
                        <a href="${ctx}/cms/article/xinyongjiaoyu" class="pull-right">更多 <img
                                src="${ctxStatic}/index0623/dist/img/right-icon.png" alt=""/></a>
                    </div>
                    <div class="zx">
                        <a href="${ctx}/cms/article/xinyongjiaoyu"><img src="${ctxStatic}/index0623/dist/img/new1.png"
                                                                        alt=""/></a>
                        <p><a id="zx0" href=""> </a></p>
                        <p><a id="zx1" href=""></a></p>
                        <p><a id="zx2" href=""></a></p>
                        <p><a id="zx3" href=""></a></p>
                    </div>
                </div>

                <div class="col-md-9 col-xs-9 eduRight">
                    <div class="edu-title">
                        <h4>新闻动态</h4>
                        <a href="${ctx}/cms/article/newsList" class="pull-right">更多报道 <img
                                src="${ctxStatic}/index0623/dist/img/right-icon.png" alt=""/></a>
                    </div>
                    <div id="news" class="row eduMain2">
                        <%-- <div class="col-xs-4">
                          <a href=""><img src="${ctxStatic}/index0623/dist/img/new2.png"/></a>
                          <p><a href=""></a></p>
                          <span></span>
                        </div>
                        <div class="col-xs-4">
                          <a href=""><img src="${ctxStatic}/index0623/dist/img/credit3.png"/></a>
                          <p><a href=""></a></p>
                          <span></span>
                        </div>
                        <div class="col-xs-4">
                          <a href=""><img src="${ctxStatic}/index0623/dist/img/credit4.png"/></a>
                          <p><a href=""></a></p>
                          <span></span>
                        </div> --%>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!--合作单位-->
<div class="container-fluid cooperation">
    <div class="container">
        <div class="coo-title">
            <h4>合作单位</h4>
            <a href="${ctx}/cms/article/partner" class="pull-right">更多<img
                    src="${ctxStatic}/index0623/dist/img/right-icon.png" alt=""/></a>
        </div>
    </div>

    <div class="cooMain">
        <ul>
            <li><a href="http://www.innoecos.cn/" id="parthera0" target="_blank"><img
                    src="${ctxStatic}/index0623/dist/img/contact1.png" id="partheri0" alt=""/></a></li>
            <li><a href="http://mail.pii.cc/" id="parthera1" target="_blank"><img
                    src="${ctxStatic}/index0623/dist/img/contact5.png" id="partheri1" alt=""/></a></li>
            <li><a href="http://www.allinpay.com/" id="parthera2" target="_blank"><img
                    src="${ctxStatic}/index0623/dist/img/contact6.png" id="partheri2" alt=""/></a></li>
            <li><a href="http://www.id5.cn/" id="parthera3" target="_blank"><img
                    src="${ctxStatic}/index0623/dist/img/contact3.png" id="partheri3" alt=""/></a></li>
            <li><a href="http://www.ipyy.com/" id="parthera4" target="_blank"><img
                    src="${ctxStatic}/index0623/dist/img/contact2.png" id="partheri4" alt=""/></a></li>
            <li><a href="" id="parthera5" target="_blank"><img src="${ctxStatic}/index0623/dist/img/contact4.png"
                                                               id="partheri5" alt=""/></a></li>
        </ul>
    </div>
</div>

<!--尾部-->
<div class="footer">
    <div class="container footBox">
        <div class="row">
            <div class="col-md-7 col-xs-7">
                <div class="row">
                    <div class="col-md-3 col-xs-3 ul-padding">
                        <ul>
                            <li><span>走进丝路互金网</span></li>
                            <li><a href="${ctx}/cms/article/cydiaProfile">平台介绍</a></li>
                            <li><a href="${ctx}/cms/article/companyProfile">主办单位</a></li>
                            <li><a href="">资质证书</a></li>
                            <li><a href="${ctx}/cms/article/contactUs">联系我们</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-xs-3 ul-padding">
                        <ul>
                            <li><span>安全保障</span></li>
                            <li><a href="${ctx}/rating/front/viewRatingRules">数字化评级</a></li>
                            <li><a href="${ctx}/cms/article/safetyGuarantee">风控管理</a></li>
                            <li><a href="">资金存管</a></li>
                            <li><a href="">信用管理</a></li>
                        </ul>
                        <p class="clearfix"></p>
                    </div>

                    <div class="col-md-3 col-xs-3 ul-padding">
                        <ul>
                            <li><span>网站声明</span></li>
                            <li><a href="${ctx}/cms/article/serviceResponsibilities">服务条款</a></li>
                            <li><a href="${ctx}/cms/article/disclaimer">免费声明</a></li>
                        </ul>
                    </div>


                    <div class="col-md-3 col-xs-3 ul-padding">
                        <ul>
                            <li><span>新手帮助</span></li>
                            <li><a href="${ctx}/cms/article/helpCenter#problems">常见问题</a></li>
                            <li><a href="${ctx}/cms/article/helpCenter#service">客户服务</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-md-5 col-xs-5 footerTel">
                <img src="${ctxStatic}/index0623/dist/img/tel.png" class="animated"/>
                <span>4008-84-4008</span><br/>
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;010-83032098</span>
            </div>
        </div>
        <p class="footerLine"></p>
        <p>Copyright © 2017 | All Rights Reserved 京ICP证160917号 京ICP备16012398号-4
            <!-- 添加站点访问统计功能 -->
            &nbsp;&nbsp;&nbsp;<span id='cnzz_stat_icon_1261966600'></span>
        </p>
    </div>
</div>


<script type="text/javascript" src="${ctxStatic}/index0623/dist/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${ctxStatic}/index0623/src/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/index0623/src/jquery.jslides/js/jquery.jslides.js"></script>
<script type="text/javascript" src="${ctxStatic}/index0623/src/liMarquee/js/jquery.liMarquee.js"></script>
<script type="text/javascript" src="${ctxStatic}/index0623/dist/js/index.js"></script>

<script type="text/javascript">
    // 合作伙伴js  i=？每页显示条数
    loadPartnerData(6);
    function loadPartnerData(i) {
        $.ajax({
            url: "${ctx}/p2p/config/p2pFriendshipLink/findPublish?num=" + i,
            type: "post",
            dataType: "json",
            success: function (data) {
                for (var int = 0; int < data.length; int++) {
                    var a = $(".cooMain ul li a").get(int);
                    var img = $(".cooMain ul li a img").get(int);
                    $("#parthera" + int).attr('href', a.href);
                    $("#partheri" + int).attr('src', img.src);
                }
            }
        })
    }

    xyjiangtang(4);
    //信用讲堂
    function xyjiangtang(i) {
        $.ajax({
            url: "${ctx}/cms/article/xyjyjiangtang?num=" + i,
            type: "post",
            dataType: "json",
            success: function (data) {

            }

        })

    }

    //投资精选
    tzSelect();
    function tzSelect() {
        $.ajax({
            url: "${ctx}/financing/p2pFinancingInformation/findFourFinancingInfo",
            type: "post",
            dataType: "json",
            success: function (data) {
                for (var int = 0; int < data.length; int++) {
                    var tz = data[int];
                    var id = tz.id;
                    var name = tz.finacingName;
                    var enterpriseName = tz.p2pEnterpriseCertify.enterpriseName;//企业名字
                    name = name.substring(enterpriseName.length, name.length - 1);
                    enterpriseName = enterpriseName.substr(0, 18);
                    var currentStage = tz.currentStage;
                    var financingMaturity = tz.financingMaturity;//借款时长
                    var nameStr = name.substr(0, 11);
                    var financingAmount = 1;
                    if (tz.financingAmount >= tz.applicationAmount) {
                        financingAmount = tz.applicationAmount;
                    } else {
                        financingAmount = tz.financingAmount;
                    }
                    var restRaiseMoney = tz.restRaiseMoney;
                    var id2 = tz.p2pFinancingRatingInfo.id;
                    var ratingLevel = tz.p2pFinancingRatingInfo.ratingLevel;
                    var recommendedRate = tz.p2pFinancingRatingInfo.recommendedRate;
                    var rateStr = recommendedRate * 100;
                    rateStr = rateStr.toFixed(2);
                    var hasRaiseAmount = tz.hasRaiseAmount;
                    var percent = hasRaiseAmount / financingAmount;
                    /* percent = (percent*100).toFixed(2); */
                    percent = (percent * 100);
                    var jindu = percent + "%";
                    var width = parseFloat(jindu);
                    var raiseTimeLimit = tz.raiseTimeLimit;
                    var lastPublishTime = tz.lastPublishTime;
                    var hasRaiseTime = tz.hasRaiseTime;
                    var nowDate = new Date();
                    var expireDate = raiseTimeLimit * 24 * 3600 * 1000 + (lastPublishTime - hasRaiseTime * 1000);
                    expireDate = new Date(expireDate);
                    //如果字符串长度超过11后面加...,否则为全称
                    if (name.length > 10) {
                        nameStr = nameStr + "...";
                    } else {
                        nameStr = nameStr;
                    }
                    if (currentStage == '600') {
                        html = "<div class='invBoxs' id=" + id + ">" +
                            "<div class='invTop'>" +
                            " <span class='biao'>机构标</span>" +
                            "<p class='first-p'>信用等级 <b>" + ratingLevel + "</b></p>" +
                            "<p>" + enterpriseName + "</p>" +
                            "<p>" + nameStr + "</p>" +
                            " </div>" +
                            "<div class='invText'>" +
                            "<p>借款期限: <span>" + financingMaturity + '个月' + "</span></p>" +
                            "<b>" + rateStr + "</b>" +
                            "<p>年利率</p>" +
                            "<p class='line'><span style='width:" + jindu + "'></span> <i>" + jindu + "</i></p>" +
                            "<p class='sheng'>剩余额度：" + restRaiseMoney + "元</p>" +
                            "<button class='btn invBtn' style='disabled=true;background:#909090;'>" + '立即投资' + "</button>" +
                            "</div>" +
                            "</div>"
                    } else {
                        html = "<div class='invBoxs' id=" + id + ">" +
                            "<div class='invTop'>" +
                            " <span class='biao'>机构标</span>" +
                            "<p class='first-p'>信用等级 <b>" + ratingLevel + "</b></p>" +
                            "<p>" + enterpriseName + "</p>" +
                            "<p>" + nameStr + "</p>" +
                            " </div>" +
                            "<div class='invText'>" +
                            "<p>借款期限: <span>" + financingMaturity + '个月' + "</span></p>" +
                            "<b>" + rateStr + "</b>" +
                            "<p>年利率</p>" +
                            "<p class='line'><span style='width:" + jindu + "'></span> <i>" + jindu + "</i></p>" +
                            "<p class='sheng'>剩余额度：" + restRaiseMoney + "元</p>" +
                            "<button name=" + id + " class='btn invBtn needClickById' >" + '立即投资' + "</button>" +
                            "</div>" +
                            "</div>"
                    }
                    $("#touzi" + (int + 1)).html(html);
                }

                $('.needClickById').each(function (index, item) {
                    $(item).click(function () {
                        var thisId = $(item).attr('name');
                        window.location.href = '${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=' + thisId;
                    })
                })

                $(".invBoxs").click(function () {
                    var thisId = $(this).attr('id');
                    window.location.href = '${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=' + thisId;
                })

            }
        })
    }
    //信用评级
    financingRating();
    //添加评级信息两条
    function financingRating() {
        $.ajax({
            url: "${ctx}/financing/p2pFinancingRatingInfo/findFiveList",
            type: "post",
            dataType: "json",
            success: function (data) {
                var financingList = data.financingList;
                var ratingList = data.ratingList;
                var html1 = "";
                for (var int = 0; int < 2; int++) {
                    var financing = financingList[int];
                    var id = financing.id;
                    var name = financing.p2pFinancingInformation.finacingName;
                    if (name.length > 20) {
                        nameStr = name.substr(0, 23) + "...";
                    } else {
                        nameStr = name;
                    }
                    html1 +=
                        "<div class='col-md-6 col-xs-6 ratBox'>" +
                        "<a href=${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=" + id + "><h4>" + nameStr + "</h4></a>" +
                        "<p class='ratText'>借贷评级报告</p>" +
                        "<p>借贷产品信用等级 ： <b>" + financing.ratingLevel + "</b></p>" +
                        "<p>主体信用等级 ： <b>" + financing.ratingLevel + "/稳定</b></p>" +
                        "<button name=" + financing.id + " class='btn ratBtn pull-right buyReport'>购买报告</button>" +
                        "</div>";
                }
                $("#pingji1").html(html1);
                var html2 = "";
                for (var int = 0; int < 2; int++) {
                    var rating = ratingList[int];
                    var name = rating.p2pEnterpriseCertify.enterpriseName;
                    var id = rating.id;
                    if (name.length > 20) {
                        nameStr = name.substr(0, 27) + "...";
                    } else {
                        nameStr = name;
                    }
                    html2 +=
                        "<div class='col-md-6 col-xs-6 ratBox'>" +
                        "<a href=${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=" + id + "><h4>" + nameStr + "</h4></a>" +
                        "<p class='ratText'>主体评级报告</p>" +
                        "<p>主体信用等级 ： <b>" + rating.mainCreditGrade + "/" + rating.rateExpectation + "</b></p>" +
                        "<button name=" + rating.id + " class='btn ratBtn pull-right buyReport'>购买报告</button>" +
                        "</div>";
                }
                $("#pingji2").html(html2);
                $('.buyReport').each(function (index, item) {
                    $(item).click(function () {
                        var thisId = $(item).attr('name');
                        window.location.href = '${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=' + thisId;
                    })
                })
            }

        })
    }
    //信用教育
    education(4);
    function education(i) {
        $.ajax({
            url: "${ctx}/cms/article/xyjyJiangTangAjax?num=" + i,
            type: "post",
            dataType: "json",
            success: function (data) {
                for (var int = 0; int < data.length; int++) {
                    $("#zx" + int).html(data[int].title);
                    $("#zx" + int).attr("href", "${ctx}/cms/article/JiangTangDetails?pid=" + data[int].pid);
                }

            },
            error: function () {
                //alert("error");
            }

        })
    }

    //新闻动态
    findImageNewsList(3);
    function findImageNewsList(i) {
        $.ajax({
            url: "${ctx}/cms/article/findImageNewsList?num=" + i,
            type: "post",
            dataType: "json",
            success: function (data) {
                var html = "";
                for (var int = 0; int < data.length; int++) {
                    var news = data[int];
                    html +=
                        "<div class='col-xs-4'>" +
                        "<a href=${ctx}/cms/article/newsListDetails?id=" + news.id + ">" +
                        "<img src=" + news.image + ">" +
                        "</a>" +
                        "<p>" +
                        "<a href=${ctx}/cms/article/newsListDetails?id=" + news.id + ">" + news.title + "</a></p>" +
                        /* "<span> "+news.createDate+"</span>"+ */
                        "</div>"
                }
                $("#news").html(html);
            },
            error: function (d) {
                console.log(JSON.stringify(d))
            }


        })

    }

    //公告出，滚动
    publish(5);
    function publish(i) {
        $.ajax({
            url: "${ctx}/cms/article/gonggaoPage?num=" + i,
            type: "post",
            dataType: "json",
            success: function (data) {
                var html = "";
                for (var int = 0; int < data.length; int++) {
                    var gonggao = data[int];
                    html +=
                        "<li>" +
                        "<a href=${ctx}/cms/article/gonggaoDetails?pid=" + gonggao.id + ">" +
                        "<span>" + gonggao.title + "</span>" +
                        /* "<span class='spanTwo'>"+gonggao.createDate+"</span>"+ */
                        "</a>" +
                        "</li>"
                }
                $("#gonggao").html(html);
            },
            error: function (d) {
                //alert(JSON.stringify(d));
            }
        })
    }
    //轮播
    takeTurn(3);
    function takeTurn(i) {
        $.ajax({
            url: "${ctx}/p2p/config/p2pAdvertiserment/takeTurn?num=" + i,
            type: "post",
            dataType: "json",
            success: function (data) {
                var html = "";
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    var ad = data[i];
                    html +=
                        "<li style=" + "background:url('" + ad.adPicture + "') no-repeat center top;" + ">" +
                        "<a href=" + ad.linkAddress + "></a>" +
                        "</li>";
                }
                $("#slides").html(html);
            },
            error: function (d) {
                //alert(JSON.stringify(d));
            }
        })
    }


</script>

<script type="text/javascript">
    $(document).ready(function () {
        $(window).resize(function () {
            var boxheight = $("#easyDialogBox").height() / 2;
            var boxwidth = $("#easyDialogBox").width() / 2;
            $("#easyDialogBox").css({'top': $(window).height() - boxheight + 'px'});
            $("#easyDialogBox").css({'left': $(window).width() - boxwidth + 'px'});
        });
    });


    //计数器
    function show(data1, data2, data3) {
        easyDialog.open({
            container: {
                header: '您有新的站内信!',
                content: '<c:if test="${user.roleList[0].id == '101'}">' +
                '<a href="${ctx}/user/Institution/ctrlMenu?mode=msgContent&msgId=' + data3 + '">' + data1 + '</a>' +
                '</c:if>' +
                '<c:if test="${user.roleList[0].id == '102'}">' +
                '<a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgContent&msgId=' + data3 + '">' + data1 + '</a>' +
                '</c:if>' +
                '<c:if test="${user.roleList[0].id == '104'}">' +
                '<a href="${ctx}/msg/msgLetterRecord/getById?id=' + data3 + '">' + data1 + '</a>' +
                '</c:if>'
            },
            autoClose: 10000,
            overlay: false
        });
        return;
    }

</script>

<script type="text/javascript">
    //进入一带一路信息搜索引擎项目
    //console.log(${empty user.id })
    var p = '${user.phone}';
    if (${empty user.id }) {
        $.ajax({
            type: "POST",
            url: "${ctx}/sys/user/returnIndex",
            dataType: 'json',
            success: function (d) {
                if (d.flag) {
                    $("#ydyl").attr("href", d.data);
                    $("#ydyl").attr("target", "_blank");
                }
            },
            error: function (d) {
                console.log(d)
            }
        });
    } else {
        $("#ydyl").click(function () {
            $.ajax({
                type: "POST",
                url: "${ctx}/sys/user/jumpWebsite",
                dataType: 'json',
                success: function (d) {
                    if (d.flag) {
                        //window.location.href=d.data;
                        window.open(d.data);
                    } else {
                        var txt = '<h5>请完成手机验证，以获得权限进入一带一路信息搜索引擎平台</h5><form id="trzForm" method="post"' +
                            'class="form-horizontal-trz" action="">' +
                            '<div class="form-group sjh"><div class="input-group">' +
                            '<div class="input-group-addon">' +
                            '<span style="color:#ff0000">*</span>手机号' +
                            '</div>' +
                            '<input style="height: 35px;width: 250px;border-radius: 4px;" class="form-control"' +
                            'type="text"  name="phone" disabled="true" value="' + p + '"></div></div>' +
                            '<div class="form-group"><div class="input-group">' +
                            '<div class="input-group-addon">' +
                            '<span style="color:#ff0000">*</span>手机验证码' +
                            '</div>' +
                            '<input style="height: 35px;width: 120px;border-radius: 4px;" class="form-control"' +
                            'type="text"  name="smsCode"><button type="button" id="hqyzm" class="hqyzm">获取验证码</button></div></div>' +
                            '<div id="load-data-trz" class=" form-group">' +
                            '<input type="checkbox" checked name="programs[]"><i style="color:#ff0000">*</i>我已阅读并同意<a href="javascript:openAgreement()" style="color:#0e4fba">《大公注册用户服务协议》</a>' +
                            '</div>' +
                            '<div class=" form-group">' +
                            '<div class="input-group">' +
                            '<div class="input-group-addon" style="width: 140px;color: #666666;padding-left: 26px">验证码</div>' +
                            '<input  id="input-trz" style="height: 35px;width: 120px;' +
                            'border-radius: 4px;" class="form-control" type="text" name="code">' +
                            '<img id="code-img-trz" style="display: inline-block;width: 100px;height: 34px;margin:6px 4px 0 10px" src="${pageContext.request.contextPath}/servlet/validateCodeServlet" class="mid validateCode">' +
                            '<a href="###" id="code-span-trz">' +
                            '<span>看不清？</span></a></div></div>' +
                            '<div id="login-ok-trz">' +
                            '<button href="javascript:;" type="submit" id="login-alert-trz" class="btn btn-primary"  >登 录</button>' +
                            '</div>' +
                            '<a href="javascript:;" id="tzlj">以游客身份直接跳转 >> </a>' +
                            '</form>';
                        var option = {
                            title: '正在进入一带一路信息搜索引擎'
                        }
                        window.wxc.xcConfirm(txt, option);
                        $(".xcConfirm").addClass("trz-xcConfirm");
                        $('.btnArea').css('display', 'none');
                        //验证码
                        $("#code-img-trz").click(function () {
                            $(this).attr('src', '${pageContext.request.contextPath}/servlet/validateCodeServlet?' + new Date().getTime())
                        })

                        $("#code-span-trz").click(function () {
                            $('#code-img-trz').attr('src', '${pageContext.request.contextPath}/servlet/validateCodeServlet?' + new Date().getTime())
                        })
                        //表单验证
                        $('#trzForm').bootstrapValidator({
                            message: 'This value is not valid',
                            feedbackIcons: {
                                valid: 'glyphicon glyphicon-ok',
                                invalid: 'glyphicon glyphicon-remove',
                                validating: 'glyphicon glyphicon-refresh'
                            },
                            fields: {
                                phone: {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        },
                                        regexp: {
                                            regexp: /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-3]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/,
                                            message: ' '
                                        }
                                    }
                                },
                                smsCode: {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        },
                                        stringLength: {
                                            max: 6,
                                            min: 6,
                                            message: ' '
                                        },
                                        regexp: {
                                            regexp: /^[A-Za-z0-9]+$/,
                                            message: ' '
                                        },
                                        remote: {
                                            url: '${ctx}/msg/msgSmsRecord/validSmsCode2',
                                            type: 'POST',
                                            message: ' '
                                        }
                                    }
                                },
                                'programs[]': {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        }
                                    }
                                },
                                code: {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        },
                                        threshold: 4,
                                        remote: {
                                            type: 'get',
                                            url: '${pageContext.request.contextPath}/servlet/validateCodeServlet',//验证验证码
                                            data: function () {
                                                return {
                                                    validateCode: $("#input-trz").val()
                                                }
                                            },
                                            message: ' ',
                                            delay: 500
                                        }
                                    }
                                }
                            }
                        }).on('success.form.bv', function (e) {
                            // 防止表单提交
                            e.preventDefault();
                            // 获取表单实例
                            var $form = $(e.target);
                            // 得到BootstrapValidator实例
                            var bv = $form.data('bootstrapValidator');
                            var phone = $("input[name=phone]").val();//用户名
                            var smsCode = $("input[name=smsCode]").val();//密码
                            var data = {
                                phone: phone,
                                smsCode: smsCode
                            };
                            $.ajax({
                                type: "POST",
                                url: "${ctx}/sys/user/signIn",
                                dataType: 'json',
                                data: data,
                                success: function (d) {
                                    if (d.flag) {
                                        //window.location.href=d.data;
                                        window.open(d.data);
                                        window.location.reload()
                                    }
                                },
                                error: function (d) {
                                    console.log(d)
                                }
                            });
                        });
                        $(".form-control-feedback").css({"top": 6})
                        //获取手机验证码
                        var setIntervalTrz;
                        $("#hqyzm").click(function () {
                            var mobile = $.trim($('input[name=phone]').val());
                            if (mobile) {
                                window.clearInterval(setIntervalTrz);
                                var _this = this;
                                var i = 60;
                                setIntervalTrz = setInterval(function () {
                                    i--;
                                    if (i <= 0) {
                                        $("#hqyzm").attr("disabled", false).html("重新获取");
                                        return;
                                    }
                                    $("#hqyzm").attr("disabled", true).html(i + "s重新获取");
                                }, 1000);
                                $.ajax({
                                    type: "POST",
                                    url: "${ctx}/msg/msgSmsRecord/sendRegSmsRestful",
                                    dataType: 'json',
                                    data: {smsPhone: mobile},
                                    success: function (d) {
                                        console.log(d)
                                    }
                                });
                            }
                        });
                        //登录
                        //以游客身份直接跳转 >>
                        $.ajax({
                            type: "POST",
                            url: "${ctx}/sys/user/returnIndex",
                            dataType: 'json',
                            success: function (d) {
                                if (d.flag) {
                                    $("#tzlj").attr("href", d.data);
                                    $("#tzlj").attr("target", "_blank");
                                    $("#tzlj").click(function () {
                                        window.location.reload()
                                    })
                                }
                            }
                        });

                    }
                }
            });
        });

    }
    /**
     *  点击用户名跳转到个人中心
     */
    function accountCentral() {
        var roleList = '${user.roleList[0].id}';
        if (roleList == 101) {
            window.location.href = '${ctx}/user/Institution/ctrlMenu';
        } else if (roleList == 102) {
            window.location.href = '${ctx}/user/p2pUserInformation/accountPermission';
        } else if (roleList == 104) {
            window.location.href = '${ctx}/user/accountGeneration/showAllInformation';
        }
    }
    $("#account").click(function () {
        accountCentral();
    });
    //添加站点访问统计功能
    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    var writeStr = unescape("%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1261966600%26show%3Dpic' type='text/javascript'%3E%3C/script%3E");
    document.write(writeStr);

</script>
</body>
</html>