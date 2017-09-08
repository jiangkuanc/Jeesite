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
        <li class="lg-active">客户服务</li>
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
                    <li class="tz-active"><a href="${ctx}/cms/article/productInformation">评级服务</a></li>
                    <li><a href="${ctx}/cms/article/investmentFinancing">投融资服务</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->


    <!--右侧内容区域-->
    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0">
        <h3>评级服务</h3>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大公评级服务于大型企业和中小型企业，大公的信用评价标准，风险分析与研究观点、数据资料广泛而深度地运用于债券发行、银行信贷、投融资咨询服务，是国内业务规模最大、产品品种最多的评级机构。</span></span></span>
        </p>

        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大公的产品体系由债务类信用评级、非债务类信用评级、信用体系建设、信用风险研究与信息服务四大类服务项目组成。</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;债务类信用评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大公是横跨我国银行间和证券业两大债券市场的评级机构，广泛参与我国各类债券评级和融资工具的创新，综合市场占有率约40%。</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　1、企业债券评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;各类非金融企业的短期融资券、企业（公司）债券、中期票据；
　　                                     各类金融机构的金融债券，银行次级债券、混合资本债券；
　　                                     上市公司的公司债券、可转换债券、分离交易可转换债券、上市公司股东可交换公司债券。</span></span></span>
        </p>

        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、结构融资评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专项资产管理计划受益凭证、资产支持商业票据(ABCP) 、资产支持证券(ABS)、住房抵押支持证券 (RMBS)、商业抵押支持证券(CMBS)、抵押负债债券(CDO)、不良资产证券化；结构型集合债券。</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、产品创新</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国第一支不良资产支持证券进行信用评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　我国第一支BT项目资产证券化产品进行信用评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国第一支金融债券及混合资本债券进行信用评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国第一支银行次级债券进行信用评级</span></span></span>
        </p>

        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国第一支可交换债券进行信用评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国第一支分离交易可转换债券进行信用评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国第一个金融资产证券化项目进行信用评级</span></span></span>
        </p>
        <p>
            <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                style="font-family:Arial;"><span><span style="line-height:2;"><span
                style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我国第一支汽车抵押贷款证券化项目进行信用评级</span></span></span>
        </p>
    </div>
    <div class="clearfix"></div>
</div>

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>