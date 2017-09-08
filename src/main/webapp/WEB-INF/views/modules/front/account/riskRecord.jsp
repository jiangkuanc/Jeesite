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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <script src="${ctxStatic }/dist/js/jquery.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <style>

    </style>


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
<div class="zh">
    <ol class="breadcrumb">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li><strong>风险测评</strong></li>
    </ol>
</div>
</c:if>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <c:if test="${totalScore == null}">
        <div class="zh-right pull-left zhaimima ">
            <div class="mima">
                <h3 class="zhai-mima">风险测评</h3>
                <table class="table qyrz-table">
                    <tr class="qyrz-tr">
                        <td style="white-space:nowrap;">风险承受能力等级:</td>
                        <td>未知</td>
                    </tr>
                    <tr class="qyrz-tr">
                        <td>状态：</td>
                        <td>未测评 <a id="riskLink" href="${ctx}/p2p/risk/p2pRiskPaper/riskTest" class="qyrz-a ">
                            <button class="btn">立即测评</button>
                        </a>
                        </td>
                    </tr>
                    <tr class="qyrz-tr">
                        <td>说明：</td>
                        <td>风险承受能力评估是本平台向您履行适当性职责的一个环节，其目的是使本平台为您推荐的金融产品或金融服务与您的风险承受能力等级相匹配。</td>
                    </tr>
                </table>


            </div>
        </div>
        <div class="clearfix"></div>
    </c:if>

    <c:if test="${totalScore != null}">
        <div class="zh-right pull-left zhaimima ">
            <div class="mima">
                <h3 class="zhai-mima">风险测评</h3>
                <table class="table qyrz-table">
                    <tr class="qyrz-tr">
                        <td>风险承受能力等级：</td>
                        <td>已知</td>
                    </tr>
                    <tr class="qyrz-tr">
                        <td>状态：</td>
                        <td>已测评</td>
                    </tr>
                    <tr class="qyrz-tr">
                        <td>说明：</td>
                        <td>风险承受能力评估是本平台向您履行适当性职责的一个环节，其目的是使本平台为您推荐的金融产品或金融服务与您的风险承受能力等级相匹配。</td>
                    </tr>
                </table>


            </div>
        </div>
        <div class="clearfix"></div>
    </c:if>
</div>


<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        $("#riskLink").click(function () {
            getStepForCertify();
            return false;
        })
    })
    /**
     用户在实名认证的过程中出于哪一步?
     */
    function getStepForCertify() {
        var url = "${ctx}/user/bankCard/getCertifyStateVal";
        var certifyState = -1;//实名认证状态值
        $.get(url, function (data) {
            //alert(data);
            var dataVal = eval(data);

            switch (dataVal) {

                /**
                 * -4.网络异常
                 * -3.实名认证失败
                 * -2.实名认证审核
                 * -1.未进行实名认证
                 * 0.未进行绑卡
                 * 1.未进行风险测评
                 * 2.未成为会员
                 * 3.实名认证完成
                 */
                case "-4" :
                    alert("网络错误！");
                    break;
                case "-3" :
                    alert("您的实名认证失败,请您完成实名认证");
                    break;
                case "-2" :
                    alert("您的实名认证审核中,请等待！");
                    break;
                case "-1" :
                    alert("您未进行实名认证,请您完成实名认证！");
                    break;
                case "0" :
                    alert("您未进行银行卡绑定,请您完成银行卡绑定！");
                    break;
                case "1" :
                case "2" :
                case "3" :
                    window.location.href = "${ctx}/p2p/risk/p2pRiskPaper/riskTest";//如果风险测评以前的流程都完成,则跳转到成为风险测评页面
                    break;
                default:
                    break;
            }
        });
    }

</script>
</script>


</
body >
< / html >
