<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="${ctxStatic}/common/unslider.min.js"></script>
    <script type="text/javascript"
            src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>
    <style type="text/css">
        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }

        .zh-right {
            padding: 3%;
        }

        .tablist li {
            border-bottom: 1px solid #bf1a20;
        }

        .tablist .currents {
            display: block;
            position: relative;
            color: #bf1a20;
        }

        .tablist .currents span {
            border-top: 2px solid #bf1a20;
            color: #bf1a20;
            border-right: 1px solid #bf1a20;
        }

        .tablist .botm-line {
            width: 50%;
            float: left;
            height: 44px;
        }

        .banner {
            position: relative;
            text-align: center;
        }

        .banner li {
            list-style: none;
        }

        .banner ul li {
            float: left;
        }

        .dots {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 20px;
        }

        .dots li {
            display: inline-block;
            width: 10px;
            height: 10px;
            margin: 0 4px;
            text-indent: -999em;
            border: 2px solid #fff;
            border-radius: 6px;
            cursor: pointer;
            opacity: .4;
            -webkit-transition: background .5s, opacity .5s;
            -moz-transition: background .5s, opacity .5s;
            transition: background .5s, opacity .5s;
        }

        ul, ol {
            padding: 0;
        }

        .dots li.active {
            background: #fff;
            opacity: 1;
        }

        .arrow {
            position: absolute;
            top: 45%;
        }

        #al {
            left: 15px;
        }

        #ar {
            right: 15px;
        }

        .enterpriseMenuLi {
            padding: 10px 0;
            font-size: 18px;
            text-shadow: rgba(237, 125, 79, 0.647) 1px 1px 5px;
            background: rgb(240, 240, 240);
            -webkit-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            -moz-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            box-shadow: 6px 6px 6px rgb(220, 220, 220);
        }

        .enterpriseMenuLiSpan {
            padding: 10px 0;
            font-size: 18px;
            font-weight: bold;
            color: #ED7D4F;
        }

        .enterpriseMenuLiClick {
            padding: 10px 0;
            font-size: 20px;
            text-shadow: rgba(0, 0, 0, 0.647) 1px 1px 5px;
            background: rgb(237, 125, 79);
            -webkit-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            -moz-box-shadow: 6px 6px 6px rgb(220, 220, 220);
            box-shadow: 6px 6px 6px rgb(220, 220, 220);
        }

        .enterpriseMenuLiSpanClick {
            padding: 10px 0;
            font-size: 18px;
            font-weight: bold;
            color: rgb(255, 255, 255);
        }

        .zh-con {
            border: none;
            padding-top: 20px
        }

        .zh-right {
            width: 78%;
            margin-left: 2%;
            border: none;
        }

        .zh-left .zh-p {
            padding: 20px 10px 20px 25px
        }

        .zh-left .qymc {
            background: #ED7D4F;
            color: #fff;
            padding: 20px 5px;
            height: 95px;
        }

        .tabs {
            padding-left: 0;
        }

        .xyjb-p {
            padding: 6% 1% 6% 2%;
            font-size: 16px;
            font-weight: 700;
            float: left
        }

        .ratBtn {
            margin-top: 6px;
            font-size: 14px;
            height: 27px;
            line-height: 14px;
            padding-top: 0;
            padding: 6px !important
        }

        .btn-default {
            padding: 20px 0;
            overflow: hidden;
        }

        .ratBtn:hover {
            color: #fff;
            background: #ED7D4F;
        }

        @media (max-width: 1417px) {
            .xyjb-p {
                padding-left: 5%;
                font-size: 14px
            }

            .ratBtn {
                font-size: 13px;
            }
        }

        @media (max-width: 1320px) {
            .xyjb-p {
                padding-left: 0;
                font-size: 13px
            }

            .ratBtn {
                font-size: 12px;
            }
        }

        .zh-right {
            font-family: "Microsoft YaHei"
        }

        .dropdown-menu li:hover {
            cursor: pointer;
        }

        ul.zhzl li {
            font-size: 18px;
            font-weight: 800;
            padding: 10px 0;
            cursor: pointer;
        }

        .zhzl li.active, .zhzl li:hover {
            background-color: #ED7D4F;
            color: #ffffff;
        }

        .zhzl li.active, .zhzl li:hover {
            background-color: #ED7D4F;
            color: #ffffff;
        }

        .zhzl li.active span,
        .zhzl li:hover span {
            color: #ffffff;
        }
    </style>
    <script type="text/javascript">
        function tiaozhuan(url) {
            window.location.href = url;
        }
        function payReport() {
            window.location.href = '${ctx}/financing/p2pFinancingRatingInfo/ratingReportDetails?id=${financingRatingInfo.id}';
        }
    </script>
</head>
<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/financing/p2pFinancingInformation/preLoadFinancingList"> 我要投资</a></li>
        <li><a href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${financingInformationId}"> 产品详情</a>
        </li>
        <li>企业数据库</li>
    </ol>
</div>
<!-- 引入账号菜单文件 -->
<div class="clearfix"></div>
</div>

<div style="background-color: #F6F6F6">
    <div class="zh-con">
        <!--左侧内容区域-->
        <div class="zh-left pull-left" style="background-color: white">
            <p class="zh-p qymc">${enterpriseName}</p>
            <%--  <p class="xyjb-p">信用级别:${financingRatingInfo.ratingLevel}
             /${financingRatingInfo.rateExpectation==1?'正面':financingRatingInfo.rateExpectation==2?'稳定':financingRatingInfo.rateExpectation==3?'负面':''}
             <button onclick="payReport();"  class='btn ratBtn pull-right buyReport'>购买报告</button></p> --%>

            <p class="xyjb-p pull-left">
                信用级别:${financingRatingInfo.ratingLevel}/${financingRatingInfo.rateExpectation==1?'正面':financingRatingInfo.rateExpectation==2?'稳定':financingRatingInfo.rateExpectation==3?'负面':''}
            </p>
            <button onclick="payReport();" class='btn ratBtn pull-right buyReport'>购买报告</button>

            <ul class="zhzl" id="enterpriseMenu">
                <li class="active"
                    onclick="tiaozhuan('${ctx}/enterpriseDatabase/list?financingInformationId=${financingInformationId}');">
                    <span>Ⅰ 基本数据</span>
                </li>
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/financial?financingInformationId=${financingInformationId}');">
                    <span>Ⅱ 财报数据</span>
                </li>
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/creditRecord4Ent?financingInformationId=${financingInformationId}');">
                    <span>Ⅲ 信用记录</span>
                </li>
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/induAreaAnalysisByFinacId?financingInformationId=${financingInformationId}&analysisType=1')">
                    <span>Ⅳ 行业分析</span>
                </li>
                <li onclick="tiaozhuan('${ctx}/enterpriseDatabase/induAreaAnalysisByFinacId?financingInformationId=${financingInformationId}&analysisType=2')">
                    <span>Ⅴ 区域分析</span>
                </li>
            </ul>
        </div>
        <!--右侧内容区域-->
        <div class="zh-right pull-left" style="background-color: white">
            <div class="tabs " id="tabs" style="width:100%;margin-bottom: 20px">
                <div style="padding: 0px 0px 20px 0px">
                    <ul>
                        <li style="font-size: 20px;color:#000"><span
                                style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>营业执照及股东名单
                        </li>
                    </ul>
                </div>
                <div class="">
                    <!--左侧-->
                    <div class="zh-top_left pull-left " style="width: 30%">
                        <ul id="photo-01ul">
                            <li style="width: 100%;height: 100%"><img id="" src="${enterprisePhoto}"
                                                                      style="width: 100%;height: 300px"></li>
                        </ul>
                    </div>
                    <!--右侧-->
                    <div class="zh-top_left pull-right banner" style="width: 60%;">
                        <div class="banner" id="photo-02">
                            <ul id="photo-02ul">
                                <c:forEach items="${photo}" var="m">
                                    <c:if test="${m.key=='entBase1'}">
                                        <c:forEach items="${m.value}" var="path">
                                            <li><img id="" src="${path}" style="width: 100%;height: 300px"></li>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            <a href="javascript:void(0);" class="unslider-arrow02 prev"><img class="arrow" id="al"
                                                                                             src="${ctxStatic}/images/arrowl.png"
                                                                                             alt="prev" width="20"
                                                                                             height="35"></a>
                            <a href="javascript:void(0);" class="unslider-arrow02 next"><img class="arrow" id="ar"
                                                                                             src="${ctxStatic}/images/arrowr.png"
                                                                                             alt="next" width="20"
                                                                                             height="37"></a>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="zh-right-bottom  rz-right-bottom">
                <div class="tabs " id="tabs" style="width:100%">
                    <div style="padding: 0px 0px 20px 0px">
                        <ul>
                            <li style="font-size: 20px;color:#000"><span
                                    style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>资产抵质押信息
                            </li>
                        </ul>
                    </div>
                    <div class="zh-top_left banner" id="photo-03">
                        <ul id="photo-03ul">
                            <c:forEach items="${photo}" var="m">
                                <c:if test="${m.key=='entBase2'}">
                                    <c:forEach items="${m.value}" var="path">
                                        <li><img id="" src="${path}" style="height: 100%;width:820px;"></li>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <a href="javascript:void(0);" class="unslider-arrow03 prev"><img class="arrow" id="al"
                                                                                         src="${ctxStatic}/images/arrowl.png"
                                                                                         alt="prev" width="20"
                                                                                         height="35"></a>
                        <a href="javascript:void(0);" class="unslider-arrow03 next"><img class="arrow" id="ar"
                                                                                         src="${ctxStatic}/images/arrowr.png"
                                                                                         alt="next" width="20"
                                                                                         height="37"></a>
                    </div>

                </div>
                <div class="tabs " id="tabs" style="width:100%">
                    <div style="padding: 0px 0px 20px 0px">
                        <ul>
                            <li style="font-size: 20px;color:#000"><span
                                    style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>有息债务信息
                            </li>
                        </ul>
                    </div>
                    <div class="zh-top_left banner" id="photo-04" style="width: 100%;height:auto;">
                        <ul id="photo-04ul">
                            <c:forEach items="${photo}" var="m">
                                <c:if test="${m.key=='entBase3'}">
                                    <c:forEach items="${m.value}" var="path">
                                        <li><img id="" src="${path}" style="height: 100%;width:820px"></li>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <a href="javascript:void(0);" class="unslider-arrow04 prev"><img class="arrow" id="al"
                                                                                         src="${ctxStatic}/images/arrowl.png"
                                                                                         alt="prev" width="20"
                                                                                         height="35"></a>
                        <a href="javascript:void(0);" class="unslider-arrow04 next"><img class="arrow" id="ar"
                                                                                         src="${ctxStatic}/images/arrowr.png"
                                                                                         alt="next" width="20"
                                                                                         height="37"></a>
                    </div>

                </div>
                <div class="tabs" id="tabs" style="width:100%">
                    <div style="padding: 0px 0px 20px 0px">
                        <ul>
                            <li style="font-size: 20px;color:#000"><span
                                    style="color:#ED7D4F; font-size:30px;padding: 0 10px 0 0">■</span>工商信息
                            </li>
                        </ul>
                    </div>
                    <div class="btn-group" style="width: 100%;">
                        <div class="btn-group" style="width: 20%">
                            <button type="button" class="btn btn-default dropdown-toggle" style="width: 100%"
                                    data-toggle="dropdown">
                                基础信息
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a onclick="qiehuan('entBase4')">发起人及出资信息</a></li>
                                <li><a onclick="qiehuan('entBase5')">变更信息</a></li>
                                <li><a onclick="qiehuan('entBase6')">动产抵质押登记信息</a></li>
                                <li><a onclick="qiehuan('entBase7')">股权出质登记信息</a></li>
                                <li><a onclick="qiehuan('entBase8')">知识产权出质登记信息</a></li>
                                <li><a onclick="qiehuan('entBase9')">股权变更信息</a></li>
                            </ul>
                        </div>
                        <button type="button" class="btn btn-default" onclick="qiehuan('entBase10')" style="width: 17%">
                            行政许可信息
                        </button>
                        <button type="button" class="btn btn-default" onclick="qiehuan('entBase11')" style="width: 17%">
                            行政处罚信息
                        </button>
                        <button type="button" class="btn btn-default" onclick="qiehuan('entBase12')" style="width: 20%">
                            列入经营异常名录信息
                        </button>
                        <button type="button" class="btn btn-default" onclick="qiehuan('entBase13')" style="width: 26%">
                            列入严重违法失信企业名单信息
                        </button>

                    </div>
                    <div class="banner" id="gsxx" style="margin-top: 20px;height:505px;">
                        <ul id="gsxxul">
                            <c:forEach items="${photo}" var="m">
                                <c:if test="${m.key=='entBase4'}">
                                    <c:forEach items="${m.value}" var="path">
                                        <li><img src="${path}" style="width:100%;height:100%"></li>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!--右侧内容区域结束-->
        <div class="clearfix"></div>
    </div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    function qiehuan(num) {
        $('#gsxx').empty();
        var ul = '<ul id="gsxxul"></ul>';
        $('#gsxx').append(ul);
        <c:forEach items="${photo}"  var="m">
        var key = '${m.key}';
        if (key == num) {
            <c:forEach items="${m.value}" var="path">
            $('#gsxxul').append('<li><img id="" src="${path}" style="width:100%;height:100%"></li>')
            </c:forEach>
        }
        var imgHeight = 0;
        if ($('#gsxxul li img').height() != null) {
            setTimeout(function () {
                imgHeight = $('#gsxxul li img').height();
                $('#gsxx').css("height", imgHeight);
            }, 10)

        }


        </c:forEach>
        var left = '<a href="javascript:void(0);" class="unslider-arrow05 prev"><img class="arrow" id="al" src="${ctxStatic}/images/arrowl.png" alt="prev" width="20" height="35"></a>';
        var right = ' <a href="javascript:void(0);" class="unslider-arrow05 next"><img class="arrow" id="ar" src="${ctxStatic}/images/arrowr.png" alt="next" width="20" height="37"></a>';
        $('#gsxx').append(left);
        $('#gsxx').append(right);
        photoView();
    }
    $(function () {
        photoView2();
        photoView3();
        photoView4();
    })
    function photoView() {
        var unslider05 = $('#gsxx').unslider({
                speed: 500,
                delay: false,
                init: 100,
                complete: function () {
                },
                keys: true,
                dots: true,
                fluid: false
            }),
            data05 = unslider05.data('unslider');
        $('.unslider-arrow05').click(function () {
            var fn = this.className.split(' ')[1];
            data05[fn]();
        });
    }

    function photoView2() {
        var unslider02 = $('#photo-02').unslider({
                speed: 500,
                delay: false,
                init: 100,
                complete: function () {
                },
                keys: true,
                dots: true,
                fluid: false
            }),
            data02 = unslider02.data('unslider');
        $('.unslider-arrow02').click(function () {
            var fn = this.className.split(' ')[1];
            data02[fn]();
        });
    }
    function photoView3() {
        var unslider03 = $('#photo-03').unslider({
                speed: 500,
                delay: false,
                init: 100,
                complete: function () {
                },
                keys: true,
                dots: true,
                fluid: false
            }),
            data03 = unslider03.data('unslider');
        $('.unslider-arrow03').click(function () {
            var fn = this.className.split(' ')[1];
            data03[fn]();
        });
    }
    function photoView4() {
        var unslider04 = $('#photo-04').unslider({
                speed: 500,
                delay: false,
                init: 100,
                complete: function () {
                },
                keys: true,
                dots: true,
                fluid: false
            }),
            data04 = unslider04.data('unslider');
        $('.unslider-arrow04').click(function () {
            var fn = this.className.split(' ')[1];
            data04[fn]();
        });
    }

</script>
</body>

</html>