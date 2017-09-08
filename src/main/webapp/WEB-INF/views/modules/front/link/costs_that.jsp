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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/help-center.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <style>
        .selected {
            border-radius: 6px;
            background: #CCC;
            filter: alpha(opacity=70); /*支持 IE 浏览器*/
            -moz-opacity: 0.70; /*支持 FireFox 浏览器*/
            opacity: 0.70; /*支持 Chrome, Opera, Safari 等浏览器*/
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--帮助中心页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/cms/article/serviceTerms">服务条款</a></li>
        <li class="lg-active">费用说明</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.jpg" alt="" width="100%">
<div class="help-guide">
    <div class="contentbox">
        <h3>费用说明</h3>
        <br><br>
        <br><br>
        <div class="select_faq">
            <ul>
                <li><a href="javascript:void(0)" onclick="FAQ1();">1、收费标准</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ2();">2、自愿原则</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ3();">3、收费标准变更</a></li>
            </ul>
            <br><br>
            <div>
                <div id="faq1" class="answer">
                    <div class="answer-content">
                        <p>(一)、企业信用等级评估收费，采取差额定率累进办法，具体标准见附表。每次企业信用等级评估最低收费额为4000元，累进收费超过五万元的，按五万元收取。
                            　　被评估单位对评级结果有异议而重新要求评估，经人民银行批准进行复评的，复评费按上述标准的20％收取，在评估报告有效期内对被评估单位进行的跟踪调查，不另收费。对确有困难的被评估企业，可以减免部分评估费用。</p>
                        <p>(二)、咨询服务收费由双方协商议定。</p>
                    </div>
                </div>
                <div id="faq2" class="answer">
                    <div class="answer-content">
                        <p>企业信用等级评估收费应本着企业自愿的原则，你公司应到我局办理《北京市经营性服务收费许可证》变更手续，实行亮证收费，使用税票，照章纳税。</p>
                    </div>
                </div>
                <div id="faq3" class="answer">
                    <div class="answer-content">
                        <p>本文所核标准，仅限于你公司接受企业自愿委托而开展企业信用等级评估时的收费，今后我市企业信用等级评估政策、范围如有变动，你公司应主动向我局报告，并重新核定收费标准。</p>
                        <br>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    ///////////////初始状态下，全部隐藏//////////////////////
    $(function () {
        $("#faq1").hide();
        $("#faq2").hide();
        $("#faq3").hide();
    });
    $(function () {
        $(".select_faq li a").click(function () {
            $(this).addClass("selected").parent().siblings().find("a").removeClass("selected");
            var index = $(".select_faq li a").index(this);
            $('.answer').eq(index).show().siblings().hide();
        })
    });

</script>
</body>
</html>