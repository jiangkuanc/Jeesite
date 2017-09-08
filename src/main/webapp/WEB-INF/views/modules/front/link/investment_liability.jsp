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
            color: #333
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资收益页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/cms/article/serviceTerms">服务条款</a></li>
        <li><a href="${ctx}/cms/article/disclaimer">免责声明</a></li>
        <li class="lg-active">投资免责</li>
    </ol>
</div>
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <h3 class="jianjietitle">免责声明</h3>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <ul class="zhzllevel2">
                    <li><a href="${ctx}/cms/article/financing_liability">融资免责</a></li>
                    <li class="tz-active tzsy"><a href="${ctx}/cms/article/investmentLiability">投资免责</a></li>
                </ul>
            </li>
        </ul>

    </div>
    <!--左侧内容区域结束-->

    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0">
        <br>
        <div>
            <h4 align="center">
                投资免责
            </h4>
            <p>
                <span style="line-height:2;"></span><span></span><span><span></span><span></span><span
                    style="font-family:Arial;"><span><span style="line-height:2;"><span
                    style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                    style="line-height:2;"><span> </span><span style="font-family:Arial;"><span><span><span
                    style="font-family:Arial;"></span></span></span></span></span></span><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果您进入、访问或使用本网站及其任何网页，即表明您已同意接受以下条款与条件的约束。下列条款与条件可能会做出变更。如您不同意下列条款与条件，请勿进入、访问或使用本网站或其任何信息。“本网站”指由大公国际（北京）评级有限公司（以下简称“本公司”）所有并发布的本大公国际（北京）网站（http://10.10.10.136:dagongP2p/f）及其网站内包含的所有信息及材料。 </span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span><span></span><span></span></span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>1. 本网站所载信息和资料的来源皆被本公司认为可靠，且本公司尽力严谨处理本网站所载信息和资料，但本公司对其准确性、足够性、完整性及其使用的适当性等不作任何担保。未经本公司许可，不得转载和发布本网站内的任何信息。</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>2. 本网站介绍的信息、工具和资料仅供一般性参考，除非另有明确协议，不应被视为购买或销售任何金融产品的某种要约，亦非对任何交易的正式确认。本网站介绍的信息、工具和资料并非旨在提供任何形式的建议，包括但不限于投资、税收、会计或法律上的建议。投资有风险，投资产品的过往业绩并不预示其未来表现，您在做出投资决策前应认真阅读相关产品合同，并自行承担投资风险。</span></span></span>
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
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>3. 本公司就本网站各项服务的安全、无误及不中断不承担任何明示或默示的保证责任。您同意自行承担使用本网站服务的所有风险及因该等风险可能造成的任何损害。对于因技术故障（如传输错误、技术缺陷、第三者侵入等）而导致的任何数据缺失等，本公司不承担任何责任</span></span></span>
            </p>
            <p>
                <span><span></span><span></span><span></span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>4. 本网站的内容将定期更新或修正。本公司对网站所载或所涉及的信息和资料的及时性不作任何担保或保证。本公司保留无需事先通知即可删除或修改网站信息的权利。</span></span></span>
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
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>5. 除非存在故意不当或欺诈行为，本公司及其董事、员工对于因您进入、访问或使用本网站，或无法进入、访问或使用本网站而可能对您导致的任何直接或间接损失，不承担任何责任。</span></span></span>
            </p>


            <p>
                <span><span></span><span></span><span></span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"><span><span
                        style="line-height:2;"><span> </span><span
                        style="line-height:1.5;font-family:Arial;"><span><span style="line-height:2;"><span
                        style="line-height:1.5;font-family:Arial;"></span></span></span></span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;"> </span></span></span><span><span
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>6. 本公司应当具有法律法规规定的其它有关免责规定项下所有的一切权利，本公司没有主张或迟延主张该等权利并不应当被视为大公国际（北京）评级有限公司对于该等权利的弃权。</span></span></span>
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
                        style="font-family:Arial;"><span style="line-height:1.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span>7. 进入、访问与使用本网站，以及本条款与条件受中华人民共和国法律管辖，并依照中华人民共和国法律解释。若因本网站产生的任何争议，将以本网站发布者所在地法院为管辖法院，除非中国法律对此有强制性规定。</span></span></span>
            </p>

            <br>
            <br>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>