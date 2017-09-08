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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/qq_chat.css">
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
                <p class="zhtext "><a href="javascript:;">服务频道</a></p>
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/cms/article/serviceHotline">服务热线</a></li>
                    <li><a href="${ctx}/cms/article/onlineService">在线客服</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="help-esq">
        <h2>在线客服</h2>
        <div id="cs_online" style="z-index: 9999;">
            <div class="side_title">
                <a title="隐藏" class="close_btn" onclick="toRight();"><span>关闭</span>
                    <img src="${ctxStatic}/dist/images/arrow_carrot-right.png" alt="" style="width:19px;height:19px;">
                </a>
            </div>
            <ul class='qq_context'>
                <li>
                    <span class='span_t'>在线客服01：</span>
                    <span class='qq_num'></span>
                </li>
                <li>
                    <span class='span_t'>在线客服02：</span>
                    <span class='qq_num'></span>
                </li>
                <li>
                    <span class='span_t'>在线客服03：</span>
                    <span class='qq_num'></span>
                </li>
                <li>
                    <span class='span_t'>在线客服04：</span>
                    <span class='qq_num'></span>
                </li>
                <li>
                    <span class='span_t'>在线客服05：</span>
                    <span class='qq_num'></span>
                </li>
            </ul>
        </div>
        <div class="help-esq-1 pull-left">
            <a href="javascript:void(0);"><img src="${ctxStatic}/dist/images/zaixian.jpg" alt="" id="index-qq"
                                               align="center"></a>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/dist/js/qq_chat.js"></script>
<script type="text/javascript">
    $(function () {
        $("#index-qq").click(function () {
            $("#cs_online").css("opacity", "100");
            $("#cs_online").show(800);
            $("#cs_online").css("right", "10px");
        })
        $(".side_title").click(function () {
            $("#cs_online").css("opacity", "100");
            $("#cs_online").hide(800);
            $("#cs_online").css("right", "-220px");
        })
    })
    //qq事件
    myEvent(window, 'load', function () {
        //dealy('index-qq',1);						//1秒后显示QQ图标，默认为1秒，可自行设置
// 		settop('index-qq','cs_online',150);		//设置在线客服的高度，默认150，可自行设置
        var span_q = getbyClass('cs_online', 'qq_num');
        setqq(span_q, ['123456789', '147430218', '147430218', '147430218', '147430218']);//填写5个QQ号码
        //click_fn('index-qq','cs_online');
    });
</script>
</body>
</html>