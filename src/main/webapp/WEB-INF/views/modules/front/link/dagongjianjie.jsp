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
                    <li><a href="${ctx }/cms/article/CEOSpeech">总裁致辞</a></li>
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
        <h3>关于大公</h3>
        <div style=" align:center;margin: 20px">
            <img src="${ctxStatic }/dist/images/aboutDagong.jpg" alt="大公概况" height="264" width="660">
        </div>
        <div style="text-indent:2EM;">
            <p>1994年5月,大公国际资信评估有限公司（简称“大公”）经国家工商行政管理总局正式核准成立。大公拥有中国政府特许经营的全部评级资质，在全国设有34个分支机构，员工超过800人。
                经过21年的发展，大公已形成独有的信用评级理论创新能力、专业的标准技术研发能力以及面向债务融资市场的公司债、企业债、中期票据和短期融资券等各类融资产品提供权威公正的信用信息生产和市场服务能力。
                并形成可持续发展的大公核心竞争力体系，即：员工发展体系、思想理论体系、技术标准体系、信用产品体系、市场服务体系、运营管理体系、大公品牌体系和风险控制体系八大要素。
                大公坚持民族品牌国际化发展道路，坚持责任与发展的核心价值观，勇于承担民族复兴赋予的评级责任，身体力行引领互联网时代的评级变革，努力实现“成为世界有影响力的跨国信用评级机构”的愿景。

            <p>20年来，大公主要形成了以下发展成果：</p>

            <p> 作为中国早期成立的信用评级机构，大公一直致力于推动中国信用评级行业的健康发展，积极探索评级发展规律，为行业发展做出了历史性贡献。</p>

            <p>
                原创了一系列信用经济和评级思想理论，发现了生产与信用、信用与评级推动信用经济社会的矛盾运动规律，最早提出了人类进入信用经济社会发展阶段和评级关系人类社会安全发展的论断，揭示了信用评级与人类经济社会活动的内在联系，构建了新型信用评级原理，这些原创、发现、揭示与构建代表了当代世界最前沿的信用与评级思想理论成果。</p>

            <p>
                作为改革国际信用评级体系的首倡者和推动者，大公在全球信用危机爆发之初率先指出了现存国际评级体系是危机制造者，揭示了危机形成、发展和结束的规律，提出了唯有构建新型国际评级体系才能推动世界经济复苏的论断，所形成的一系列有关改革国际评级体系的思想理论、目标和路线图得到了最广泛的国际认可，世界因此正在形成改革的思潮和行动。</p>

            <p> 坚持辩证唯物主义思想方法，坚持追求真理的创新精神，已形成了独有的信用评级思想理论自主创新和评级标准制定的能力，因此具备了承担社会评级责任的能力。</p>

            <p> 长期关注并研究中国信用体系建设与社会管理创新，努力探索解决中国信用社会化进程中信用风险信息不对称矛盾的途径，提出了信用管理社会化和社会管理信用化的全新理念。</p>

            <p>
                大公是世界上第一个系统研究并揭示美国评级思想和方法弊端的评级机构，是首家下调最大债务国美国信用等级的评级机构，大公符合事物内在逻辑的评级价值观得到了国际社会最广泛的认可，大公因此成为具有国际影响力的新兴评级力量和构建新型国际评级体系的主导力量。 </p>
            <br/>
            <br/>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--大公简介区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>