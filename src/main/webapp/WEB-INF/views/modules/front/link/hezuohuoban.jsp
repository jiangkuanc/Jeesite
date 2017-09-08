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
        <li class="lg-active">关于我们</li>
    </ol>
</div>

<!--区域-->
<div class="zh-con">
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
                <p class="zhtext "><a href="${ctx }/cms/article/contectUs">联系我们</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx }/cms/article/heZuoHuoBan" style="color:#bf1a20;">合作伙伴</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx}/cms/article/operationData">运营数据</a></p>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0;padding-bottom:30px;">
        <h3>合作伙伴</h3>
        <div class="hezuonei">
            <img src="${ctxStatic}/dist/images/demo5.png" class="pull-left" width="178" height="118" alt="">
            <div class="hezuoyou pull-right" margin-rigth:34px>
                <h4>大公数据互联网平台上线</h4>
                <p>2015年，在经济下行和监管逐渐明朗的双重压力下，部分服务中小企业借贷的P2P平台开 始谋求转型，服务消费、发展小额信贷是重要</p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="hezuonei">
            <img src="${ctxStatic}/dist/images/demo5.png" class="pull-left" width="178" height="118" alt="">
            <div class="hezuoyou pull-right">
                <h4>大公数据互联网平台上线</h4>
                <p>2015年，在经济下行和监管逐渐明朗的双重压力下，部分服务中小企业借贷的P2P平台开 始谋求转型，服务消费、发展小额信贷是重要</p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="hezuonei">
            <img src="${ctxStatic}/dist/images/demo5.png" class="pull-left" width="178" height="118" alt="">
            <div class="hezuoyou pull-right">
                <h4>大公数据互联网平台上线</h4>
                <p>2015年，在经济下行和监管逐渐明朗的双重压力下，部分服务中小企业借贷的P2P平台开 始谋求转型，服务消费、发展小额信贷是重要</p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="hezuonei">
            <img src="${ctxStatic}/dist/images/demo5.png" class="pull-left" width="178" height="118" alt="">
            <div class="hezuoyou pull-right">
                <h4>大公数据互联网平台上线</h4>
                <p>2015年，在经济下行和监管逐渐明朗的双重压力下，部分服务中小企业借贷的P2P平台开 始谋求转型，服务消费、发展小额信贷是重要</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>