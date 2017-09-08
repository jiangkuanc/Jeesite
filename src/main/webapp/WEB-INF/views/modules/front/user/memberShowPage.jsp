<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <!--<script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountPersonMenu.jsp" %>

<!--右侧内容区域-->
<div class="row" id="memberStatus">
    <div id="successOpen" style="display: none">
        <div>
            <span class="memberBg"></span>
            <span>恭喜您，您成为我们的免费会员。</span>
        </div>
        <div>
            <button id="confirm" class="btn btn-success" onclick="confirm();">确定</a>
        </div>
    </div>
    <div>
        <span>会员类型:</span>
        <span>个人投资会员</span>
    </div>
    <div>
        <span>支付费用:</span>
        <span>0.00元</span>
    </div>
    <div>
        <span>会员有效期:</span>
        <span>2017年5月31日</span>
    </div>
    <div>
        <button id="freeOpenMember" class="btn btn-success" onclick="loadSuccessPage();">免费开通</a>
    </div>
</div>
<!--内容区域结束-->
<script type="text/javascript">
    $(function () {
        function loadSuccessPage() {
            $("#freeOpenMember").click(function () {
                $("#memberStatus").empty();//移除该div层
                $("#successOpen").show();
            })
        }

        function confirm() {
            alert("开通成功...");
        }
    })
</script>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


</body>
</html>
