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

<!--投资收益内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <h3 class="jianjietitle">关于我们</h3>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <p class="zhtext "><a href="javascript:;">大公数据简介</a></p>
                <ul class="zhzllevel2">
                    <%-- <li class="tzsy"><a href="${ctx }/cms/article/guanYuWoMen">关于大公</a></li> --%>
                    <li><a href="${ctx }/cms/article/CEOSpeech" style="color:#bf1a20;">总裁致辞</a></li>
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
                <p class="zhtext "><a href="${ctx }/cms/article/heZuoHuoBan">合作伙伴</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx}/cms/article/operationData">运营数据</a></p>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0">
        <h3>总裁致辞</h3>
        <br>
        <div>
            <h4 align="center">
                <img alt="" src="${ctxStatic }/dist/images/guan.jpg" align="left"/> <strong><span
                    style="line-height:2;font-size:14px;">勇敢地承担起历史赋予的使命</span></strong> <br/>
            </h4>
            <p>
                <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                    style="font-family:Arial;"><span><span style="line-height:2;"><span
                    style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                    style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                    style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 全球信用危机所证明的是：信用评级关系人类经济社会安全发展，现存国际评级体系坚持维护所在国利益的立场，把其价值观和意识形态作为评级标准，成为危机的制造者，而不能承担世界评级责任。然而，处于信用经济社会发展阶段的人类社会仍然需要公正的评级才能可持续发展，面对一个控制着人类生存与发展命脉的超级评级强权，人类前行的路在哪里？回答这个关系全人类发展前途的时代问题是最具挑战的历史使命。 </span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span><span></span><span></span></span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>2008年当整个世界被突如其来的金融海啸震惊之时，大公最先揭示了最大债务国控制的国际评级体系是导致危机的根源,提出了构建新型国际评级体系的思想。大公第一次提出了近六十年来资本主义生产与消费的矛盾推动了一场世界范围内的信用革命，人类社会从此进入信用经济社会发展阶段;发现了生产与信用、信用与评级是推动现代信用经济社会发展的两对矛盾，科学地解释了信用评级在人类社会进程中的历史方位。正是对信用经济社会和评级发展规律的深入研究使大公拥有了认识信用世界的思想武器。大公以独特的视角向世界诠释了国际评级体系与人类社会安全发展的关系；现存国际评级体系的弊端；改革国际评级体系与世界经济复苏的关系；改革国际评级体系的目标和路线图；如何创新信用评级思想推动世界评级技术革命等一系列最具时代前沿的理论与实践问题。大公所做的一切顺应了历史发展需要，客观上自觉承担起了历史使命。</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>大公从对西方评级思想理论和实践的研究中，从对信用经济社会和评级发展规律的探索中，确立了对信用世界的认识方法和自身的历史方位，选择了民族品牌国际化发展道路，那就是把中国人在信用评级领域创造的成果贡献给世界。大公的发展战略代表了人类社会的整体利益，顺应了历史潮流，必然使大公具有超乎寻常的意志、胆识、智慧、胸怀和动力，任何艰难险阻都不能动摇大公的理想与追求。这是一项得道多助最具时代号召力的伟大事业，她如同吹响的集结号，吸引无数有识之士投身到这个最具使命感的价值追求中来。</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span><span></span><span></span></span><span
                        style="line-height:2;"><span></span><span style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>大公以作为推动人类历史进步的勇敢者而自豪，为奉献于这一壮丽的事业而光荣。</span></span></span>
            </p>
            <p>
                &nbsp;
            </p>
            <p align="right">
                <span><br/></span>
            </p>
            <p align="right">
                <span></span>
            </p>
            <p align="right">
                <span style="line-height:1.5;font-family:Arial;">大公国际资信评估有限公司董事长兼总裁&nbsp;&nbsp;&nbsp;关建中</span>
            </p>
            <p align="right">
                <span style="line-height:1.5;font-family:Arial;">二〇一二年九月十六日</span>
            </p>
            <br>
            <br>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>