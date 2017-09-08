<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>联系我们</title>
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
        <li class="lg-active">关于我们</li>
    </ol>
</div>

<!--投资收益内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <h3 class="jianjietitle">关于我们</h3>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">大公数据简介</a></p>
                <ul class="zhzllevel2">
                    <%-- <li class="tzsy"><a href="${ctx }/cms/article/guanYuWoMen">关于大公</a></li> --%>
                    <li><a href="${ctx }/cms/article/CEOSpeech">总裁致辞</a></li>
                    <li><a href="${ctx }/cms/article/creditAptitude">平台简介</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx }/cms/article/orgStructure">组织架构</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx }/cms/article/dagongwenhua">大公数据文化</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx }/cms/article/contectUs" style="color:#bf1a20;">联系我们</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx }/cms/article/heZuoHuoBan">合作伙伴</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx}/cms/article/operationData">运营数据</a></p>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left contect" style="padding-top:0">
        <div class="hezuo pull-left">
            <h3>商务合作</h3>
            <p>如果贵公司希望与我们建立商务合作关系，形成优势互补，请使用下面的联系方式联系我们。</p>
            <p>邮箱：dagong@credit.com </p>
            <p>电话：15210053215</p>
        </div>
        <div class="hezuo pull-left">
            <h3>商务合作</h3>
            <p>如果贵公司希望与我们建立商务合作关系，形成优势互补，请使用下面的联系方式联系我们。</p>
            <p>邮箱：dagong@credit.com </p>
            <p>电话：15210053215</p>
        </div>
        <div class="clearfix"></div>
        <div class="contectnei">
            <h3>联系大公数据</h3>
            <img src="${ctxStatic}/dist/images/demo4.png" alt="" width="97%" style="margin-top:10px;">
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>