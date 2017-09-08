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
        <li><a href="${ctx }/cms/article/helpCenter">关于我们</a></li>
        <li class="lg-active">新闻平台</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">
<div class="help-guide">
    <div class="contentbox">
        <h3>新闻平台</h3>
        <br><br>
        <br><br>
        <div class="select_faq">
            <ul>
                <li><a href="javascript:void(0)" onclick="FAQ1();">年度重点新闻</a></li>
            </ul>
            <br><br>
            <div>
                <div id="faq1" class="answer">
                    <p><span></span>&nbsp;&nbsp;<b>江苏再担保 大公国际联合举办AAA信用评级发布暨金融服务推介会</b></p>
                    <div class="answer-content">
                        <p>
                            6月27日，江苏省信用再担保有限公司与大公国际资信评估公司联合举办AAA用评级发布暨金融服务推介会，介绍江苏再担保公司荣获AAA信用评级的有关情况，同时举行战略合作签约仪式，并就相关金融产品、
                            直融增信业务展开研讨、交流与推介活动，旨在为江苏各级政府主管部门和金融业界搭建一个信息交流、渠道合作、资源共享的金融服务平台，共同助力供给侧结构性改革，为“金融强省”建设献计献策。</p>
                        <p>
                            省政府金融办查斌仪主任出席会议并讲话，省发改委、财政厅、经信委、国资委、金融办分管处长及13个省辖市金融办、发改委分管主任到会。省再担保公司董事长、党委书记、总裁张乐夫在会上对公司情况作了介绍，
                            大公国际营销总部陈爱国副总裁发布了江苏再担保信用评级的有关情况。省再担保公司副总裁王屹、党委委员黄成参加会议，副总裁陆文毛主持会议。来自大公国际、合作银行、证券公司、发债主体企业、新闻媒体的代表以及省再担保公司各部门、各分（子）公司负责人等近150人出席了会议。</p>
                        <p>5月16日，经大公国际综合分析和评估，江苏再担保获得长期主体信用最高等级AAA评级，评级展望为稳定。6月8日，上海新世纪资信评估有限公司也给予了江苏再担保相同评级。
                            由此，江苏再担保成为全国首家获得AAA信用双评级的政策性担保再担保公司。依据央行规定，企业主体长期信用等级分为三等九级，
                            AAA级为最高等级，代表企业“偿还债务能力极强，基本不受不利经济环境影响，违约风险极低”。
                            张乐夫介绍，江苏再担保评级从AA+提升为AAA后，将进一步提升影响力和公信力，增强资本市场议价能力，
                            健全再担保体系。为政府平台融资降低1个点的成本，为中小企业融资降低2.5个点的成本。截至目前，公司实收资本53.49亿元，总资产94.08亿元，净资产66.06亿元，
                            银行授信规模近600亿元。公司管理的资产规模超1000亿元，再担保规模累计突破3400亿元，再担保体系覆盖全省，服务中小微企业项目超8万个，直保规模累计超600亿元</p>
                        <p>省政府金融办主任查斌仪在讲话中充分肯定了此次会议的重要意义，并对江苏再担保获得长期主体信用最高等级AAA评级表示祝贺。他表示，省再担保公司信用评级由AA+上升到最高等级AAA，
                            是公司发展历程上具有里程碑意义的一件大事，既是资本市场对公司现有实力和未来成长的认可，更是对公司在规范运作、
                            科学发展、行业引领等方面提出的更高要求和期待，并对公司下步发展提出三项要求：一是要强化主业，以再担保政策属性引领行业的健康发展；二是要特色发展，
                            增强再担保金融服务的供给弹性；三是要苦练内功，以科学高效的风控能力提升企业核心竞争力。并希望省再担保公司继续保持严谨务实的工作作风，加强行业动态研究，
                            有效整合各方金融资源，把更多金融“活水”引向实体经济和中小微企业，持续为江苏创新型省份和金融强省建设增加新动能。</p>
                        <p>
                            会上，大公国际、江苏再担保、华泰证券分别就业务品类、市场研判、合作方向等作了主题演讲，与会人员展开了深入的交流与探讨，为下一步优化各方资源、有效降低融资成本、调整政府债务结构、更好服务中小微企业和地方经济发展打下坚实基础。</p>
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