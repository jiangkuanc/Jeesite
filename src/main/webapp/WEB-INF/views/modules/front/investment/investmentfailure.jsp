<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我要投资</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <style type="text/css">
        /*邀约成功*/
        .yycg {
            height: 500px;
            width: 1100px;
            border: 1px solid #ccc;
            margin: 0 auto;
            margin-bottom: 30px;
            margin-top: 30px;
            background: url(${ctxStatic}/images/xiaolian.jpg) no-repeat 17.9% 33.4%;
        }

        .yycg h3 {
            margin-top: 167px;
            text-align: center;
        }

        .yycg input {
            margin-top: 100px;
            margin-left: 11.81%;
        }

        .yycg input.i {
            margin-left: 34.6363%;
        }

        .zh_btn {
            background: #f14349;
            color: #f2f2f2;
            height: 32px;
            width: auto;
            border-radius: 5px;
            line-height: 20px;
        }
    </style>
    <script type="text/javascript">
        function goIndex() {
            window.location.href = "${pageContext.request.contextPath}${fns:getFrontPath()}";
        }

        function checkOtherfinance() {
            window.location.href = "${ctx }/financing/p2pFinancingInformation/preLoadFinancingList";
        }

    </script>

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx }/financing/p2pFinancingInformation/preLoadFinancingList">我要投资</a></li>
        <li><a href="javascript:;" onClick="javascript :history.back(-1);">债项详情</a></li>
        <li class="lg-active">标的已满</li>
    </ol>
</div>
<div class="yycg">
    <h3>对不起，您晚了一步，您投资的标的已融满，标的已关闭投资，您可以看看其他适合您的产品。</h3>
    <input type="button" value="返回首页" class="btn btn-default zh_btn i" onclick="goIndex();">
    <input type="button" value="看看其他债项" class="btn btn-default zh_btn" onclick="checkOtherfinance();">
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("li").click(function () {
            $(this).addClass('current').siblings().removeClass('current');
            $(this).css("border-bottom", "none").siblings().css("border-bottom", "1px solid #bf1a20;")
            //var index = $("ul li").index(this);
            //$('.one').eq(index).show().addClass('current').siblings().hide().removeClass('current');
        });
    });
</script>
</body>
</html>