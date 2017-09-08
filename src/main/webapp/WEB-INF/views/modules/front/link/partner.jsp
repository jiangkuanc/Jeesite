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

        .gudgsj {
            font-size: 22px;
            border-bottom: 5px solid #eeeeee;
            padding-bottom: 8px
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
        <li class="lg-active">合作伙伴</li>
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
                    <li><a href="${ctx}/cms/article/cydiaProfile">新闻动态</a></li>
                    <li><a href="${ctx}/cms/article/safetyGuarantee">风控体系</a></li>
                    <li><a href="${ctx}/cms/article/contactUs">联系我们</a></li>
                    <li class="tz-active"><a href="${ctx}/cms/article/partner">合作伙伴</a></li>
                    <%--  <li><a href="${ctx}/cms/article/operationData">运营数据</a></li> --%>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left" style="min-height:600px;">
        <h3 class="gudgsj" style="border-bottom: 5px solid #eeeeee;padding-bottom: 5px;">合作伙伴</h3>
        <div class="gywm-content gywm-content-hzhb" id="partner">
            <img src="${ctxStatic}/dist/images/gywm-hzhb-zjzf.png" alt="">
            <img src="${ctxStatic}/dist/images/gywm-hzhb-hsyh.png" alt="">
            <img src="${ctxStatic}/dist/images/gywm-hzhb-bjptp.png" alt="">
            <br>
            <img src="${ctxStatic}/dist/images/gywm-hzhb-zgtx.png" alt="">
            <img src="${ctxStatic}/dist/images/gywm-hzhb-jryjy.png" alt="">
            <img src="${ctxStatic}/dist/images/gywm-hzhb-dg.png" alt="">
            <br>
            <img src="${ctxStatic}/dist/images/gywm-hzhb-dgxr.png" alt="">
            <img src="${ctxStatic}/dist/images/gywm-hzhb-tjcj.png" alt="">
        </div>

        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${ctx}/p2p/config/p2pFriendshipLink/findPublish",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var str = '';
                for (var i = 0; i < data.length; i++) {
                    var linkAddress = data[i]['linkAddress'];
                    var linkIcon = data[i]['linkIcon'];
                    str += "<a target='_blank' href='" + linkAddress + "'>" +
                        "<img src='" + linkIcon + "' alt=''>" +
                        "</a>";
                }

                if (data.length > 0) {
                    $("#partner").html(str);
                }
            }
        })
    })
</script>
</body>


</html>