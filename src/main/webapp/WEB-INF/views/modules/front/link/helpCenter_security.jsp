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
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
        <li><a href="${ctx }/cms/article/helpCenter">帮助中心</a></li>
        <li class="lg-active">常见问题</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">
<div class="help-guide">
    <div class="contentbox">
        <h3>常见问题>平台安全</h3>
        <br><br>
        <br><br>
        <div class="select_faq">
            <ul>
                <li><a href="javascript:void(0)" onclick="FAQ1();">问题1：大公数据互联网金融信用信息服务平台是什么?</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ2();">问题2：如何保证我的资金安全?</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ3();">问题3：借款人逾期了怎么办?</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ4();">问题4：你们网站安全吗?如果被攻击了、被黑了、是不是数据就没有了呢?</a></li>
                <li><a href="javascript:void(0)" onclick="FAQ5();">问题5：如何保护投资人信息 安全性?</a></li>
            </ul>
            <br><br>
            <div>
                <div id="faq1" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>1、大公数据互联网金融信用信息服务平台是什么?</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>1、对互联网金融的理解</b></p>
                    <div class="answer-content">
                        <p>
                            互联网金融是传统金融行业与互联网精神相结合的新兴领域。互联网金融与传统金融的区别不仅仅在于金融业务所采用的媒介不同，更重要的在于金融参与者深谙互联网“开放、平等、协作、分享”的精髓，通过互联网、移动互联网等工具，使得传统金融业务具备透明度更强、参与度更高、协作性更好、中间成本更低、操作上更便捷等一系列特征。[1]理论上任何涉及到了广义金融的互联网应用，都应该是互联网金融，包括但是不限于为第三方支付、在线理财产品的销售、信用评价审核、金融中介、金融电子商务等模式。
                            互联网金融不是互联网和金融业的简单结合，而是在实现安全、移动等网络技术水平上，被用户熟悉接受后（尤其是对电子商务的接受），自然而然为适应新的需求而产生的新模式及新业务。互联网金融的发展已经历了网上银行、第三方支付、个人贷款、企业融资等多阶段，并且越来越在融通资金、资金供需双方的匹配等方面深入传统金融业务的核心。</p>
                        <p><b>2、信用信息服务</b></p>
                        <p>
                            该系统通过大公信用评级原理对企业信用的关键点进行分析，为每个不同的企业建立一套合理有效的信用评级模型和信用体系，对企业所面临的战略风险、运营风险、市场风险、宏观行业风险、法律风险、财务风险等进行统一管控，同时，还实现以企业历史经营数据、行业经济发展数据等为基础的一套预警评估模型，为企业对未来一段时间内可能发生的信用风险进行预警监控，全方位的提升企业信用风险管理能力。</p>
                    </div>
                </div>
                <div id="faq2" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>2、如何保证我的资金安全?</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>1、查汇款地点；</b></p>
                    <div class="answer-content">
                        <p>交易商在网站公布汇款内容中收款人地址必须与监管机构公布的公司地址要相同</p>
                        <p><b>2、查汇款账户名；</b></p>
                        <p>交易商在其网站公布汇款内容中收款人名称必须与监管机构公布的公司名称相同</p>
                        <p><b>3、差账户；</b></p>
                        <p>查汇款账户是交易商的经营账户还是客户专属账户。</p>
                    </div>
                </div>
                <div id="faq3" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>3、借款人逾期了怎么办?</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>借款人超过借款合同在最后规定的还款期限仍未还清贷款本息的</b></p>
                    <div class="answer-content">
                        <p>
                            借款人未按借款合同规定按月偿还贷款本息的，逾期部分按中国人民银行有关规定计收逾期利息。当发生下列情况之一时，贷款银行除就逾期部分计收逾期利息外，有权会同有关部门处理抵押物或质押物。</p>
                        <br>
                    </div>
                </div>
                <div id="faq4" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>4、你们网站安全吗?如果被攻击了、被黑了、是不是数据就没有了呢?</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>网站安全性能</b></p>
                    <div class="answer-content">
                        <p>（1）数据加密技术 （2）提供即时通知服务 （3）借助地三方在线支付平台</p>
                        <p><b>数据问题：</b>我们对客户的数据都进行了备份和加强防护的措施。</p>
                    </div>
                </div>
                <div id="faq5" class="answer">
                    <p><span>问：</span>&nbsp;&nbsp;<b>5、如何保护投资人信息安全性</b></p>
                    <p><span>答：</span>&nbsp;&nbsp;<b>1、从技术保障角度来实现。</b></p>
                    <div class="answer-content">
                        <p><b>2、保证自身系统的安全性、不被黑客侵犯获取客户资料</b></p>
                        <p><b>3、内控-保证内部信息安全</b></p>
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
        $("#faq4").hide();
        $("#faq5").hide();
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