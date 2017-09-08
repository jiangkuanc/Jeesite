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
                    <li><a href="${ctx }/cms/article/CEOSpeech">总裁致辞</a></li>
                    <li><a href="${ctx }/cms/article/creditAptitude">平台简介</a></li>
                </ul>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx }/cms/article/orgStructure">组织架构</a></p>
            </li>
            <li data-i="1" class=" zhzllevel1tzsy-zh">
                <p class="zhtext "><a href="${ctx }/cms/article/dagongwenhua" style="color:#bf1a20;">大公数据文化</a></p>
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
    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0;">
        <h3>大公文化</h3>
        <div style="text-indent:2EM;">
            <p>
                大公思想文化是在对信用经济和评级发展规律的长期探索实践与理想追求中形成的思想结晶，这一原创的信用思想理论代表了人类进入信用经济社会发展阶段的先进文化，已成为人类信用思想宝库中最为耀眼的部分，并正在成为改变世界的一种力量。

                大公思想文化包含七个方面内容：</p>

            <p>1、民族品牌国际化发展战略；</p>

            <p>2、以天下为己任的价值观；</p>

            <p>3、爱国家爱人类的境界与胸怀；</p>

            <p>4、勇于追求真理的创新精神；</p>

            <p>5、求真务实的辩证唯物主义思想；</p>

            <p>6、逆势而上顺势而为的胆识；</p>

            <p>7、以人为本的管理观念。</p>

            <p><b>一、民族品牌国际化发展战略</b></p>

            <p>民族品牌，即大公作为本土评级机构首先要研究中国信用风险的形成规律，运用揭示风险的服务能力维护本国经济社会安全发展，保障中国海外债权资产安全。

            <p>国际化，即作为中国的评级机构有责任把大公在评级领域的智慧贡献给世界，为全球信用经济的可持续发展履行应尽的责任。</p>

            <p><b>二、以天下为己任的价值观</b></p>

            <p>信用评级关系着人类社会安全发展，人类社会需要公正的评级是历史的召唤，揭示现存评级体系的本质，凝聚天下各方力量，寻求和构建符合人类共同利益的科学公正的评级体系是大公的使命与责任。</p>

            <p><b>三、爱国家爱人类的境界与胸怀</b></p>

            <p>爱国家就是一家本土评级机构应当从信用评级发展规律的深刻认识中自觉把评级业的崛起作为中华民族伟大复兴的重要组成部分，勇敢地承担起最具时代挑战的历史责任。</p>

            <p>
                爱人类就是一家世界最大债权国评级机构应当从信用经济社会发展规律的深入探索中主动把建立公正的国际评级体系作为人类社会安全发展的重要保障，把建立能承担起世界评级责任的新型国际评级体系、捍卫人类共同利益视为当代最伟大的爱人类行动，义不容辞地担当起最具时代意义的历史使命。</p>

            <p><b>四、勇于追求真理的创新精神</b></p>

            <p>创新评级思想理论，构建新型国际评级体系，冲破百年控制人类评级思想的铁幕，阻止旧体制对人类经济社会的破坏，用真理的火炬照亮信用世界前进的方向。</p>

            <p><b>五、求真务实的辩证唯物主义思想</b></p>

            <p>坚持辩证唯物主义思想认识方法，坚持从事物的内在联系入手进行最公正的评判，坚持以求真务实的理念践行评级社会责任。</p>

            <p><b>六、逆势而上顺势而为的胆识</b></p>

            <p>逆势而上，就是要认识事物的本质，以挑战现实的意志独立做出战略判断，确定自身的发展方向。</p>

            <p>顺势而为，就是制定战略规划和大政方针要顺应历史潮流，选择正确的发展方向。</p>

            <p><b>七、以人为本的管理理念</b></p>

            <p>坚持以人的发展为根本，把员工发展作为大公核心管理理念和一切管理实践的出发点、着力点与落脚点 </p>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>