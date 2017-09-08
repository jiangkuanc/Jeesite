<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/about.css"/>
    <style>
        div.center-block {
            height: 300px;
            width: 50%;
            margin: 182px auto;
        }

        div.pay-top-left {
            height: 100px;
            float: left;
            width: 30%;
            text-align: right;
            padding-top: 20px;
        }

        div.pay-top-right {
            height: 100px;
            float: left;
            width: 66%;
            padding-left: 20px;
        }

        div.pay-top-right h2 {
            font-size: 24px;
            margin: 20px;
        }

        div.pay-top-right h4 {
            font-size: 14px;
            margin: 20px;
        }

        div.pay-top-right span {
            font-size: 14px;
            margin: 20px;
        }

        div.pay-bottom {
            height: 100px;
            width: 100%;
            margin-top: 100px;
            text-align: center;
        }

        a.btn {
            background: #f2434a;
            color: #FFFFFF;
            font-size: 16px;
            margin-left: 10px;
        }

        a.btn:last-child {
            margin-left: 200px;
        }
    </style>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
</head>
<body>
<!--头部信息-->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--主题内容-->
<hr style="width: 100%;height: 1px;background: #cccccc;margin: 0px;">
<div class="container">
    <div class="row">
        <div class="col-md-12" style="padding: 0px;">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">关于我们</a></li>
                <li class="active">公司简介</li>
            </ol>
        </div>
    </div>
</div>
<hr style="width: 100%;height: 1px;background: #cccccc;margin: 0px;">
<div class="container">
    <div class="row">
        <div class="col-md-12" style="background: #eeeeee;">
            <div class="center-block">
                <div class="pay-top-left">
                    <img src="${ctxStatic}/dist/images/pay_success_03.jpg" alt="">
                </div>
                <div class="pay-top-right">
                    <h2>您已支付完成</h2>
                    <h4>交易流水号：<span>${paymentOrderId}</span></h4>
                    <span style="color: #cccccc;"><strong id="mm">5</strong>s后自动跳转至首页</span>
                </div>
                <div class="clearfix"></div>
                <div class="pay-bottom">
                    <strong>进入</strong>
                    <a class="btn" href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a>
                    <a class="btn" href="${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp">查看申请状态</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!--页脚内容-->
<div id="footer"></div>
<script type="text/javascript" src="${ctxStatic}/dist/js/index.js"></script>
<script type="text/javascript">
    $('#footer').load('footer.html');
    $('#header').load('header.html');
    var i = 5;
    var setIn = setInterval(function () {
        i--;
        $('#mm').html(i);
    }, 1000);
    setTimeout(function () {
        window.location.href = '${frontPath}';
        clearInterval(setIn);
    }, 6000);
</script>
</body>
</html>