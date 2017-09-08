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


<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
        <li><a href="${ctx }/cms/article/helpCenter">关于我们</a></li>
        <li class="lg-active">平台简介</li>
    </ol>
</div>
<img src="${ctxStatic}/dist/images/help-banner_02.png" alt="" width="100%">

<div class="help-guide">
    <div class="contentbox">
        <h3>平台简介</h3>
        <br><br>
        <br><br>
        <div class="select_faq">
            <ul>
                <li><a href="javascript:void(0)" onclick="FAQ1();">大公信用评级“一带一路”战略平台简介</a></li>
            </ul>
            <br><br>
            <div>
                <div id="faq1" class="answer">
                    <div class="answer-content">
                        <p> 在“一带一路”早期项目纷纷收获之际，建立一个统一的评级体系也纳入全球治理改革决策者视野。
                            　　国家发改委副主任连维良今日在北京举行的世界信用评级论坛中说，促进信用评级业快速发展，要紧密结合实施“走出去”战略，扩大信用评级国际合作和交流。要围绕“一带一路”倡议，加强各国评级机构的有效合作，实现资源共享、优势互补，推进信用评级在外资外贸、产能合作等领域的广泛应用，提升服务能力。
                            　　世界信用评级集团国际顾问理事会主席，法国前总理德维尔潘说，中国政府推动的信用体系建设，是人类社会发展史上国家治理体系的创新，其示范作用将引领亚洲和一带一路信用体系建设，对世界经济治理体系将产生深刻影响。
                            世界信用评级集团是一个无国界、非主权、代表各国共同利益的新型国际评级机构。
                            　　随着“一带一路”战略规划的深入推进，中国与“一带一路”沿线国家的区域经贸合作正在不断加强，“一带一路”战略已成为人类社会发展新的世界观。数据显示，2015年中国企业对“一带一路”沿线的49个国家直接投资总额达到148.2亿美元。同比增长18.2%。仅2016年前四个月，中国企业共对“一带一路”相关的49国家非金融类直接投资就达49.1亿美元，同比增长32%。
                            　　世界信用评级集团董事长、大公国际信用评级集团董事长关建中表示，世界经济治理未能达到预期效果的最直接的原因是世界经济治理背离了信用经济发展规律，未将正确评级纳入世界经济治理体系。他强调说，
                            现行评级模式是评级信息乃至跨国资本互联互通的巨大障碍，需要在整个“一带一路”战略的顶层设计中体现评级联通模式。
                            　　关建中说，“一带一路”沿线国家的基础设施建设融资需求，不能都靠亚洲基础设施投资银行来实现，更广阔的融资天地是民间市场资本。他表示，一套完整的基础设施评级方法有利于其在资本市场上融资，同时也将为“一带一路”资本跨国流动奠定基础。</p>
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