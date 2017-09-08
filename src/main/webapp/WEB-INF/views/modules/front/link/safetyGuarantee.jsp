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
        <li class="lg-active">风控体系</li>
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
                    <li><a href="${ctx}/cms/article/companyProfile">公司简介</a></li>
                    <li><a href="${ctx}/cms/article/cydiaProfile">丝路互金网简介</a></li>
                    <li><a href="${ctx}/cms/article/newsList">新闻动态</a></li>
                    <li class="tz-active"><a href="${ctx}/cms/article/safetyGuarantee">风控体系</a></li>
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
        <h3 class="gudgsj">风控体系</h3>
        <div class="companyProfile-box">
            <h4>丝路互金网信用风险管控体系由三个核心部分构成：</h4>
            <p class="Introduction">
                一是“四位一体”风控系统。“四位一体”风控系统是指，“债务人公开信息，债权人公开监督，评级专业监控，黑名单公示”。这是用四个方面的约束力应对债权人与债务人通过互联网构建信用关系所形成的信用风险信息不对称新形态的有效解决方案。这一成果奠定了互联网金融创新前行的基石。
            </p>
            <div class="gywm-div-center">
                <img src="${ctxStatic}/dist/images/image001.jpg" alt="" class="gywm-img">
            </div>
            <p class="Introduction">
                二是数字化评级。数字化评级是指，应用大公独创的信用信息图谱、偏离度、偿债来源与负债平衡、信用工程学、最大安全负债数量、最佳负债组合等核心信用评级技术，构建一库三平台为载体的数据标准化、分析数字化、应用矩阵化的工业化信用信息产品生产系统。数字化评级所创造出的互联网金融依存的信用媒介呈现形态成为丝路互金网的灵魂。</p>
            <div class="gywm-div-center">
                <img src="${ctxStatic}/dist/images/image003.jpg" alt="" class="gywm-img">
            </div>
            <p class="Introduction">三是全程信用管理。全程信用管理是指，通过对借贷资本运动过程信用信息的全面、真实、专业、规范、及时和可持续公开管理，将债权资产增值置于一个完全的信用管理环境中。</p>


        </div>
        <div class="companyProfile-box">
            <h4>
                丝路互金网信用风险管控体系充分满足了债权人与债务人运用互联网技术高效安全构建信用关系的互联网金融本质要求，创造了让借贷资本在全程信用风险管理的互联网环境中运行，让债权人与债务人充分享有信用价值获得感的互联网金融模式。</h4>
        </div>
        </br></br></br>
    </div>
    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>