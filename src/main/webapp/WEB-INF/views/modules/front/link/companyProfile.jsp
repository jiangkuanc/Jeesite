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
        <li><a href="${ctx}/cms/article/companyProfile">走进大公数据</a></li>
        <%--         <li><a href="${ctx}/cms/article/companyProfile">关于我们</a></li> --%>
        <li class="lg-active">公司简介</li>
    </ol>
</div>

<!--投资收益内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p gywm-zh-p"><a href="${ctx}/cms/article/companyProfile">走进大公数据</a></p>
        <%--     <p class="zh-p gywm-zh-p"><a href="${ctx}/cms/article/companyProfile">关于我们</a></p> --%>
        <ul class="zhzl">
            <li data-i="0" class="zhzllevel1">
                <ul class="zhzllevel2">
                    <li class="tz-active"><a href="${ctx}/cms/article/companyProfile">公司简介</a></li>
                    <li><a href="${ctx}/cms/article/cydiaProfile">丝路互金网简介</a></li>
                    <li><a href="${ctx}/cms/article/cydiaProfile">新闻动态</a></li>
                    <li><a href="${ctx}/cms/article/safetyGuarantee">风控体系</a></li>
                    <li><a href="${ctx}/cms/article/contactUs">联系我们</a></li>
                    <li><a href="${ctx}/cms/article/partner">合作伙伴</a></li>
                    <%--  <li><a href="${ctx}/cms/article/operationData">运营数据</a></li> --%>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <h3 class="gudgsj">公司简介</h3>
        <div class="companyProfile">
            <div class="companyProfile-box">
                <h4>一、概述</h4>
                <p class="Introduction">
                    大公信用数据有限公司(简称“大公数据”)为全球知名评级机构大公集团的全资子公司，以互联网和数字化信用评级技术为支撑，为一带一路和国际资本市场提供数字化信用信息产品与服务的创新型高科技金融服务机构。
                </p>
            </div>
            <div class="companyProfile-box">
                <h4>二、发展历程</h4>
                <ul class="fzlc-list">
                    <li>
                        <h5>2014年3月</h5>
                        <p>成立。</p>
                    </li>
                    <li>
                        <h5>2014年6月</h5>
                        <p>启动互联网金融模式创新计划，即“一带一路互联网金融信用信息服务平台”——丝路互金网。</p>
                    </li>
                    <li>
                        <h5>2014年8月</h5>
                        <p>
                            发布《大公互联网金融信用信息平台发展报告》、《大公互联网金融市场准入评级方法》和《大公互联网金融偿债能力评级方法》，创造了互联网金融双向参与、两类评级的独特模式。
                        </p>
                    </li>
                    <li>
                        <h5>2015年1月</h5>
                        <p>召开“互联网金融黑名单及预警名单发布会”，公布266个互联网金融网贷平台黑名单和676个预警观察名单。当月，举办中国首个以维护债权人权益为主题的论坛——“互联网金融债权人论坛”。</p>
                    </li>
                    <li>
                        <h5>2015年2月</h5>
                        <p>
                            举办“互联网金融信息披露制度论坛”，研讨信息主体如何全面、真实、专业、规范、及时和可持续性地进行信用信息披露。截至同年9月，累计发布互联网金融网贷平台报告2665篇，完成互联网金融评级数据库建设。</p>
                    </li>
                    <li>
                        <h5>2016年12月</h5>
                        <p>建成以数字化评级技术为核心和一库三平台为载体的全新数字化评级系统。</p>
                    </li>
                    <li>
                        <h5>2017年5月16日</h5>
                        <p>自主研发的丝路互金网正式上线运营。</p>
                    </li>
                </ul>
            </div>
            <div class="companyProfile-box">
                <h4>三、战略定位</h4>
                <p class="Introduction">遵循互联网金融发展规律，坚持互联网金融创新，以服务于一带一路资本互联互通为目标，以数字化评级技术为支撑，构建国际互联网金融体系。
                </p>
            </div>
            <div class="companyProfile-box">
                <h4>四、服务体系</h4>
                <p class="Introduction">1、服务目标：通过持续向一带一路沿线国家客户提供全天候双语信息服务、全程信用管理服务、投融资服务、评级服务，实现一带一路沿线国家资本互联互通和助推实体经济发展。
                </p>
                <p class="Introduction">2、服务主体分为三类:一带一路沿线政府、金融机构与企业。</p>
                <p class="Introduction">&nbsp;&nbsp;●政府。通过丝路互金网为沿线65个国家政府提供信用评级、信用管理等服务，以推动当地实体经济的发展。</p>
                <p class="Introduction">&nbsp;&nbsp;●金融机构。通过构建国际化评级与资本联通的新模式，为沿线国家的银行、基金等金融机构提供信用信息服务，协同打造区域金融安全网，建立一带一路长期、稳定、可持续、风险可控的金融服务体系。</p>
                <p class="Introduction">&nbsp;&nbsp;●企业。通过为一带一路沿线国家企业，特别是中小企业提供信用信息与信用管理服务，有效地解决企业与金融机构之间的信息不对称问题，实现企业快速、高效、便捷融资的目的，进而推动一带一路沿线国家实体经济的发展。</p>


            </div>
            <div class="companyProfile-box">
                <h4>五、技术优势</h4>
                <p class="Introduction">大公数据的技术优势是数字化评级，即运用评级数据图谱和信用工程学技术建立的数据标准化、分析数字化、应用矩阵化的人机结合工业化评级信息生产系统。关键技术包括：
                </p>
                <p class="Introduction">&nbsp;&nbsp;●信用信息图谱；</p>
                <p class="Introduction">&nbsp;&nbsp;●偿债来源与债务平衡；</p>
                <p class="Introduction">&nbsp;&nbsp;●偿债来源与创富能力偏离度；</p>
                <p class="Introduction">&nbsp;&nbsp;●最大安全负债数量边界；</p>
                <p class="Introduction">&nbsp;&nbsp;●评级矩阵；</p>
                <p class="Introduction">&nbsp;&nbsp;●信用工程学。</p>
            </div>
            <div class="companyProfile-box">
                <h4>六、核心产品</h4>
                <p class="Introduction">
                    丝路互金网是大公数据的核心产品，即构建起了一个体现互联网金融公开性、大众性、效率性、安全性特殊要求，以互联网技术为支撑，以评级专业监控主导的风控体系为保障，满足一带一路资本互联互通的信用信息服务体系，包括一个平台、两大功能、四类产品。</p>
                <p class="Introduction">1、一个平台：一带一路互联网金融信用信息服务平台。</p>
                <p class="Introduction">2、两大功能：信用信息服务和信用信息应用。</p>
                <p class="Introduction">3、四类产品：一带一路信息产品、全程信用管理、信用评级、借贷产品。</p>
                <p class="Introduction">(核心产品介绍详见《丝路互金网》)</p>
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