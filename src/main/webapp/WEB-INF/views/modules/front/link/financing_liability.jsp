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
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资收益页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/cms/article/serviceTerms">服务条款</a></li>
        <li><a href="${ctx}/cms/article/disclaimer">免责声明</a></li>
        <li class="lg-active">融资免责</li>
    </ol>
</div>
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <h3 class="jianjietitle">免责声明</h3>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <ul class="zhzllevel2">
                    <li class="tz-active tzsy"><a href="${ctx}/cms/article/financing_liability">融资免责</a></li>
                    <li><a href="${ctx}/cms/article/investmentLiability">投资免责</a></li>
                </ul>
            </li>
        </ul>

    </div>
    <!--左侧内容区域结束-->

    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0">
        <br>
        <div>
            <h4 align="center">
                融资免责
            </h4>
            <p>
                <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                    style="font-family:Arial;"><span><span style="line-height:2;"><span
                    style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                    style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                    style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1、本网站不能保证网站内容的充分性、及时性、可靠性、完整性和有效性，并且免除任何由此引起的法律责任。 </span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span><span></span><span></span></span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>2、本网站可能含有第三方内容或与第三方网站的链接。这些内容与链接仅为您提供方便，并供您参考。对于第三方的任何内容和网站，包括但不限于其准确性、主题、质量或及时性，大公既无法控制，也不为其承担任何责任，并不作任何保证或陈述。大公对第三方的内容或网站或与大公网站链接或配合的网站一律免责。</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>3、大公在任何情况下（无论是在任何形式的法律行动中）都无需为您访问本网站及/或使用在线服务有关的任何运行故障、系统、服务器或连接故障、错误、遗漏、中断、安全系统破坏、电脑病毒、恶意代码、资料损坏、操作或传送延误、传送错误或无法访问等问题承担任何责任（即使大公已事先得知出现问题的可能性）。</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span><span></span><span></span></span><span
                        style="line-height:2;"><span></span><span style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>4、大公在任何情况下都不应对您或任何其他方与使用本网站或依赖本网站提供的任何信息、资料或在线服务有关而产生的任何损害、损失、开支或费用承担责任，包括但不限于任何直接、间接、特定、附带或后果性的损失、利润损失或机会损失（无论是在任何形式的法律行动中，且即使大公已事先得知遭到损失的可能性）。</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>5、凡通过中亿支付在一带一路平台选择交易的均禁止委托中亿支付代收现金，凡因代收现金所造成的一切损失由该用户自行承担，大公不承担任何责任</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span><span></span><span></span></span><span
                        style="line-height:2;"><span></span><span style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>6、本网站可能包含可通过相应按钮加以识别的“社交书签”。利用社交书签，特定社交媒体平台的用户可以将选定的金银猫链接张贴到他们相应的社交媒体个人资料中，以便与他们的社交媒体联系人分享。使用社交书签时，您将会向相应的社交媒体平台发送身份识别数据。任何评语或使用社交书签产生的活动不为大公所控制、认可或监控，大公对此概不负责亦不承担责任。通过社交书签分享大公的人士无权代表大公发表意见，他们的观点和看法仅代表他们个人立场，同大公无关。此外，与链接相关的使用条款规定也适用于社交书签。</span></span></span>
            </p>


            <br>
            <br>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>
  
  