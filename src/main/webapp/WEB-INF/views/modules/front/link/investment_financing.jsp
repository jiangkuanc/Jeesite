<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }
    </style>
</head>
<body style="background:#f4f4f4">
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资收益页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/cms/article/helpCenter">帮助中心</a></li>
        <li class="lg-active">投融资服务</li>
    </ol>
</div>

<!--投资收益内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <h3 class="jianjietitle">帮助中心</h3>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">产品介绍</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/cms/article/productInformation">评级服务</a></li>
                    <li class="tz-active"><a href="${ctx}/cms/article/investmentFinancing">投融资服务</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0">
        <h3>投融资服务</h3>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大公购机集团结合“调结构、增活力、上水平”工作，针对企业不断变化的融资需求，采取“四位一体”方式，将政府引导性投资、社会化风险投资、PE、银行及担保中心有机结合，全方位为企业提供投融资支持服务和深度管理咨询，为企业量身定制帮扶方案，打通科技企业与资本对接的通道。</span></span></span>
        </p>

        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;集团通过与天使投资、风险投资、引导基金等机构的密切合作，汇聚整合更多的投资渠道。同时整合担保、保理、银行、信托、企业集合债发行等融资资源，针对企业初创期、发展期、成熟期的不同发展阶段的融资需要，提供综合融资支持服务。举办不同形式、不同主题的活动，以增加投资方、中介服务机构、融资方三方的接触频率，提升不同企业对融资的意识、认识和技能技巧，增加投融资成功率。</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;投资方面</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;支持个人对企业进行投资和企业之间的投资。</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;融资方面</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为国内外股权投资机构、科技企业和各专业服务机构聚集而创设的公共服务平台。由天津泰达科技发展集团成立的"天津开发区科技企业融资服务中心"，代表开发区管委会负责平台的日常运营、管理、维护服务，并配合管委会进行股权投资产业招商促进服务。</span></span></span>
        </p>
    </div>
    <div class="clearfix"></div>
</div>

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>
    
    