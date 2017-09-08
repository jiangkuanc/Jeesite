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
        <li class="lg-active">联系我们</li>
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
                    <li><a href="${ctx}/cms/article/safetyGuarantee">风控体系</a></li>
                    <li class="tz-active"><a href="${ctx}/cms/article/contactUs">联系我们</a></li>
                    <li><a href="${ctx}/cms/article/partner">合作伙伴</a></li>
                    <%--   <li><a href="${ctx}/cms/article/operationData">运营数据</a></li> --%>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <h3 class="gudgsj">联系我们</h3>

        <div class="companyProfile-box">
            <h4>大公信用数据有限公司</h4>
            <p class="Introduction">地址：北京市朝阳区霄云路26号鹏润大厦A座31层</p>
            <p class="Introduction">邮编：100125</p>
            <p class="Introduction">电话：4008-84-4008/010-83032098（7×24小时客户服务）</p>
            <p class="Introduction">邮箱：service@dagongcredit.com</p>
            <p class="Introduction">
                <img src="${ctxStatic}/dist/images/address_img.png" alt="" class="gywm-img">
            </p>
        </div>
    </div>


    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>