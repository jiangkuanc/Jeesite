<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('productName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/help-center.css">
    <%--  <link rel="stylesheet" href="${ctxStatic}/dist/css/qq_chat.css"> --%>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <%-- <script src="${ctxStatic}/dist/js/qq_chat.js"></script> --%>

    <SCRIPT src="http://123.57.217.46:17000/static/jquery.min.js" type="text/javascript" charset="utf-8"></SCRIPT>
    <SCRIPT id="MyCommWebChat" src="http://123.57.217.46:17000/js/webchat.js?service_id=mw_default_webchat"
            type="text/javascript" charset="utf-8"></SCRIPT>
    <script type="text/javascript">
        function channel() {
            var mycommwebchat = new MyCommWebchat();
            result = mycommwebchat.get_service_agents("http://123.57.217.46:17000/?service_id=mw_default_webchat");
            alert(JSON.stringify(result.queues));
        }
        $(function () {
            $('div.MyCommWebChat-icon-right').css({
                'background': 'url("${ctxStatic}/dist/images/01.png")',
                'width': '92px',
                'height': '125px',
                'margin': '0px 0 0 30px',
                'padding-top': '130px',
                'background-size': 'cover'

            });
            $('#bridgehead').css('display', 'none');
            $('#MyCommWebChat-left-close').css('display', 'none');
            $('#QueueMycommWebchat').css({
                'background': 'none',
                'margin': '-60px 0 0 0'
            });
            $('.opacitymask').css({
                'border': '1px solid #0f4b70',
                'background': 'none',
                'border-radius': '10px',
                'height': '20px',
                'width': '80px',
                'text-align': 'center'
            });
            $('#IconContainer .MyCommWebChat-group-item').css({
                'overflow': 'visible'
            });
            $('#IconContainer').css({
                'left': '150px',
                'transition-duration': '1s'
            });
            $('div.mycommwebchat-group-img').css({
                'display': 'none'
            });
            $('.MyCommWebChat-group-item .callWebChat').css({
                'margin': '150px 0 0 20px'
                /* 'border-radius':'20px',
                 'height':'35px',
                 'width':'140px',
                 'text-align':'center' */
            });
            $('.masktxt').css({
                'font-size': '12px',
                'color': '#0f4b70',
                'text-align': 'center',
                'top': '1px',
                'left': '-36px'
            });
            $('#IconContainer .mycommwebchat-group-img-disable').css('visibility', 'hidden');
            $('#IconContainer .MyCommWebChat-icon-group').css('overflow', 'visible');
            $('#QueueMycommWebchat').append('<h3 style="color: #0f4b70;font-size: 12px;width: 160px;margin: -5px 0 0 12px;">Online talking</h3>');

        });
    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--帮助中心页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
        <li class="lg-active">帮助中心</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">
<div class="help-guide" id="guidelines">
    <h2>新手指引</h2>
    <div class="help-guide-1 pull-left help-guide-div">
        <a href="${ctx }/cms/article/register"><img src="${ctxStatic}/dist/images/help-guide_03.png" alt=""> </a>
    </div>
    <div class="help-guide-2 pull-left help-guide-div">
        <a href="${ctx }/cms/article/investment_flow"><img src="${ctxStatic}/dist/images/help-guide_05.png" alt=""></a>
    </div>
    <div class="help-guide-3 pull-right help-guide-div">
        <a href="${ctx }/cms/article/helpFinancing"><img src="${ctxStatic}/dist/images/help-guide_07.png" alt=""></a>
    </div>
    <div class="clearfix"></div>
    <span class="help-guide-1-span pull-left help-span">如何注册</span>
    <span class="help-guide-2-span pull-left help-span">投资流程</span>
    <span class="help-guide-3-span pull-right help-span">借款流程</span>
    <div class="clearfix"></div>
</div>
<div class="help-faq" id="problems">
    <h2>常见问题</h2>
    <div class="help-faq-1 pull-left help-faq-div">
        <a href="${ctx }/cms/article/security"><img src="${ctxStatic}/dist/images/help-faq_01.jpg" alt=""> </a>
    </div>
    <div class="help-faq-2 pull-left help-faq-div">
        <a href="${ctx }/cms/article/helpCenter_FAQ"><img src="${ctxStatic}/dist/images/help-faq_02.jpg" alt=""></a>
    </div>
    <div class="help-faq-3 pull-right help-faq-div">
        <a href="${ctx }/cms/article/helpService"><img src="${ctxStatic}/dist/images/help-faq_03.jpg" alt=""></a>
    </div>
    <div class="clearfix"></div>
    <span class="help-faq-1-span pull-left help-span">平台安全</span>
    <span class="help-faq-2-span pull-left help-span">账户管理</span>
    <span class="help-faq-3-span pull-right help-span">自助服务</span>
    <div class="clearfix"></div>
</div>
<div class="help-esq" id="service">
    <h2>客户服务</h2>
    <div class="help-esq-1 pull-left" style="position:relative;top:17px;">
        <a href="javascript:void(0);"><img src="${ctxStatic}/dist/images/help-esq_03.png" alt="" id="index-qq"></a>
    </div>
    <div class="help-esq-2 pull-left">
        <a href="javascript:void(0);"><img src="${ctxStatic}/dist/images/help-esq_05.png" alt=""></a>
    </div>
    <div class="help-esq-3 pull-left">
        <a href="javascript:void(0);"><img src="${ctxStatic}/dist/images/help-esq_07.png" alt=""></a>
    </div>
    <div class="help-esq-4 pull-right" style="position:relative;left:25px;">
        <a href="javascript:void(0);"><img src="${ctxStatic}/dist/images/help-esq_09.png" alt=""></a>
    </div>
    <div class="clearfix"></div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        $("#index-qq").click(function () {
            $("#IconContainer").css("opacity", "100");
            $("#IconContainer").show(800);
            $("#IconContainer").css("left", "50px");
        })
    })
</script>
</body>
</html>