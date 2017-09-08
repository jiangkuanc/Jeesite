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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/gywm.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/about.css"/>
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

        .ulList li {
            background: url("${ctxStatic}/dist/images/point.png") no-repeat center left;
            text-indent: 25px;
            background-size: 20px 20px;

        }

        .ulList {
            padding-left: 2em;
        }

    </style>
    <style>
        .zhzl li p a {
            color: #909090
        }

        .zhzl .xiajian p a {
            color: #bf1a20
        }

        h3, h4, p, h5 {
            margin: 0
        }

        .breadcrumb {
            width: 76.3%;
            margin: 7px auto;
        }

        .gudgsj {
            font-size: 22px;
            border-bottom: 5px solid #eeeeee;
            padding-bottom: 8px
        }

        .companyProfile {
            margin-bottom: 50px
        }

        .companyProfile h3 {
            text-align: center;
            padding: 25px 0;
            font-size: 22px;
        }

        .companyProfile-box {
            margin-top: 50px
        }

        .companyProfile-box h4 {
            font-size: 20px;
            border-left: 10px solid #bf1a20;
            padding-left: 10px
        }

        .Introduction {
            margin-top: 20px;
            text-indent: 2em;
        }

        .companyProfile p {
            color: #666666;
            line-height: 20px
        }

        .zzjg {
            text-align: center;
            padding: 24px 0 12px;
            border-bottom: 1px solid #eeeeee;
        }

        .zzjg img {
            width: 90%;
        }

        .fzlc-list {
            padding: 30px 80px 30px 30px
        }

        .fzlc-list > li h5 {
            height: 20px;
            background: url("${ctxStatic}/dist/images/yq_03.jpg") no-repeat left center;
            padding-left: 28px;
            line-height: 20px
        }

        .fzlc-list > li p {
            font-size: 12px;
            padding: 8px 0 30px 20px;
            border-left: 2px solid #d25d62;
            margin-left: 8px
        }

        .fzlc-list > li:last-of-type p {
            border: none
        }

        .fzlc-list > li p span {
            display: block
        }

        ol.breadcrumb {
            margin: 0.5% 0 0.5% 12%;
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
        <li><a href="${ctx}/cms/article/companyProfile">走进丝路互金网</a></li>
        <%--         <li><a href="${ctx}/cms/article/companyProfile">关于我们</a></li> --%>
        <li class="lg-active">丝路互金网简介</li>
    </ol>
</div>

<!--投资收益内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p gywm-zh-p"><a href="${ctx}/cms/article/companyProfile">走进丝路互金网</a></p>
        <%--     <p class="zh-p gywm-zh-p"><a href="${ctx}/cms/article/companyProfile">关于我们</a></p> --%>
        <ul class="zhzl">
            <li data-i="0" class="zhzllevel1">
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/cms/article/companyProfile">公司简介</a></li>
                    <li class="tz-active"><a href="${ctx}/cms/article/cydiaProfile">丝路互金网简介</a></li>
                    <li><a href="${ctx}/cms/article/newsList">新闻动态</a></li>
                    <li><a href="${ctx}/cms/article/safetyGuarantee">风控体系</a></li>
                    <li><a href="${ctx}/cms/article/contactUs">联系我们</a></li>
                    <li><a href="${ctx}/cms/article/partner">合作伙伴</a></li>
                    <%--   <li><a href="${ctx}/cms/article/operationData">运营数据</a></li> --%>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <h3 class="gudgsj">丝路互金网简介</h3>
        <div class="companyProfile">
            <div class="companyProfile-box">
                <h4>一、概述</h4>
                <p class="Introduction">
                    丝路互金网是体现互联网金融公开性、大众性、效率性、安全性特殊要求，以互联网技术为支撑，以评级专业监控主导的风控体系为保障，满足一带一路资本互联互通的信用信息服务平台。
                </p>
                <p class="Introduction">
                    丝路互金网以构建一带一路资本跨国流通大动脉为目标，以数字化评级为核心，以一库三平台为载体，对债权资产进行全程信用管理，引导资本流向有价值创造能力的实体经济。</p>
            </div>
            <div class="companyProfile-box">
                <h4>二、服务体系</h4>
                <p class="Introduction">丝路互金网满足一带一路资本互联互通的信用信息服务体系包括一个平台、两大功能、四类产品。</p>
                <p class="Introduction">1、一个平台：一带一路互联网金融信用信息服务平台。</p>
                <p class="Introduction">2、两大功能：信用信息服务和信用信息应用。</p>
                <p class="Introduction">●信用信息服务</p>
                <p class="Introduction">
                    丝路互金网可以提供涵盖一带一路沿线国家的政治、经济、文化、金融等资本互联互通需要的宏观和微观信息，包括国家、行业、企业的政策、人文、供求、评级、债权资产信用管理信息。图文并茂、数字化、可视化的呈现形态增强了信用信息的阅读效果，独创的分析技术增加了信用信息的可靠性，中英文并举的表达方式扩大了信用信息的应用空间，强大的搜索功能提高了信用信息的使用效率，聚焦于一带一路实体经济投融资需求的专业化全方位信用信息服务创造了互联网时代资本安全、高效、跨国流动的新载体。</p>
                <p class="Introduction">●信用信息应用</p>
                <p class="Introduction">
                    丝路互金网是一个满足投融资即时交易的信用信息应用平台。数字化评级的发明与应用，使信用评级能够快捷、准确、量化、透明、可持续揭示债务人信用风险，成为互联网金融投资的引领者。债权人与债务人可以充分应用独立第三方权威评级信息，公开且有效率地进行资本组合，信用评级亦成为资金交易价格形成机制的主导者。以公开揭示债务人信用风险为目标而设计的一系列数字化信用信息产品，为投资人提供了优于线下交易的公开、高效、选择空间大的新型资产配置模式。</p>
                <p class="Introduction">3、四类产品：</p>
                <p class="Introduction">●一带一路信息产品</p>
                <p class="Introduction">●全程信用管理</p>
                <p class="Introduction">●信用评级</p>
                <p class="Introduction">●借贷产品</p>
                <div class="gywm-div-center">
                    <img src="${ctxStatic}/dist/images/image002.jpg" alt="" class="gywm-ptjj-img">
                </div>
            </div>
            <div class="companyProfile-box">
                <h4>三、服务模式</h4>
                <p class="Introduction">丝路互金网实现了债权人、债务人、审计机构、评级机构和资金存管银行的有机联接，同时坚守独立信息中介服务本质，实现资金流与信息流的分离。
                </p>
                <p class="Introduction">●债权人：访问平台，查找优质借款项目，分析项目信息，承担投资风险，将资金出借给债务人，到期获取投资收益。</p>
                <p class="Introduction">●债务人：向平台提交借款申请，完成信用评级，申请发布借款项目，获取借款资金，按期偿还借款本息。</p>
                <p class="Introduction">●审计机构：对评级所用数据进行专项审计，确保数据的全面性、真实性、专业性、规范性、及时性和可持续性。</p>
                <p class="Introduction">●评级机构：为债务人提供信用评级服务，出具评级报告，向债权人和公众提供债务人信用风险信息和信用记录，对债务人资金使用和项目进展情况进行全程信用风险监控。</p>
                <p class="Introduction">
                    ●资金存管银行：由独立的第三方商业银行承担资金结算业务。商业银行对债权人与债务人开立和使用资金账户进行管理和监督，并根据合同对双方资金进行存管、划付、核算和监督。银行承担实名开户、履行合同约定和借贷交易指令的审核责任。</p>
                <div class="gywm-div-center">
                    <img src="${ctxStatic}/dist/images/image004.jpg" alt="" class="gywm-ptjj-img">
                </div>
            </div>
            <div class="companyProfile-box">
                <h4>四、产品特色</h4>
                <p class="Introduction">
                    1、四位一体风控体系，即，“债务人公开信息，债权人公开监督，评级专业监控，黑名单公示”。该体系将信用信息与互联网金融的运动过程紧密结合为一个整体，呈现为公开、透明、可视、立体的债权资产安全运营场景。
                </p>
                <div class="gywm-div-center">
                    <img src="${ctxStatic}/dist/images/image006.jpg" alt="" class="gywm-ptjj-img">
                </div>
                <p class="Introduction">
                    2、一库三平台，即信用信息数据库、信用信息服务平台、评级分析平台、评级管理平台。市场参与主体在信用信息服务平台提交信用信息，分析师在评级分析平台对融资企业和借贷项目进行评级，评审与风控通过评级管理平台实现项目管理、流程管理与过程监控。</p>
                <div class="gywm-div-center">
                    <img src="${ctxStatic}/dist/images/image008.jpg" alt="" class="gywm-ptjj-img">
                </div>
                <p class="Introduction">
                    3、数字化评级，即充分运用数字化评级揭示债务人信用风险。通过互联网进行债权债务资本组合需要满足其公开、大众、效率、安全特征的互联网信用评级，数字化评级是互联网金融得以存在的必要条件。数字化评级是运用评级数据图谱和信用工程学技术建立的数据标准化、分析数字化、应用矩阵化的人机结合工业化评级信息生产系统。</p>
                <div class="gywm-div-center">
                    <img src="${ctxStatic}/dist/images/image010.jpg" alt="" class="gywm-ptjj-img">
                </div>
                <p class="Introduction">4、利率形成机制。产品利率形成机制由信用评级主导，同时受市场资金供求状况的影响。</p>
                <p class="Introduction">
                    5、信用融资。丝路互金网是一个完全以全方位信用信息为媒介判断债务人未来偿债能力，不以抵押、质押、担保为条件，引领债权人与债务人进行投融资组合的平台。信用记录对债务人的可持续融资能力十分重要。</p>
                <p class="Introduction">
                    6、全面信用管理。丝路互金网着眼于构建一个市场高度认可的互联网金融活动所需要的安全信用环境，从两个层面进行信用管理，一是对各类参与主体进行入场信用审查，记录其在平台的信用行为；二是对债务人的资金使用进行全程监督，记录其偿债信息。</p>
                <p class="Introduction">
                    7、安全性。丝路互金网的安全性体现在四个方面：一是资金需求方为实体经济，使债权资本在实物资产运动过程中实现增值；二是资金由第三方银行存管；三是合法合规经营；四是科学严密的风控体系。</p>
                <p class="Introduction">
                    8、国际化。丝路互金网以中英文为官方语言，提供一带一路沿线所有国家的政治、人文、财经、评级信息；任何国家的实体经济都可以在这个平台上进行投融资活动；可作为发展中国家建立债券市场的创新平台。</p>
            </div>
            <div class="companyProfile-box">
                <h4>五、操作流程</h4>
                <div class="gywm-div-center">
                    <img src="${ctxStatic}/dist/images/image012.jpg" alt="" class="gywm-ptjj-img">
                </div>
            </div>
            <div class="companyProfile-box">
                <h4>六、宣传册</h4>
                <div class="gywm-div-center">
                    <a href="http://source.silkroaditfin.com/M00/00/B4/Zcl7AFkZYCKAAQCLAHAUgjXmnCU423.pdf"
                       target="_blank"><img src="${ctxStatic}/dist/images/image014.jpg" alt=""
                                            class="gywm-ptjj-img"></a>
                </div>
            </div>


        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>