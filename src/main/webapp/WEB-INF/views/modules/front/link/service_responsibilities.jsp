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
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--投资收益页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <%-- <li><a href="${ctx}/cms/article/serviceTerms"> 网站协议</a></li>  --%>
        <li><a href="JavaScript:void(0)"> 网站协议</a></li>
        <li class="lg-active">服务条款</li>
    </ol>
</div>
<div class="zh-con">
    <!--左侧内容区域-->
    <div class="zh-left pull-left" style="background:#fff">
        <a href="javascript:void(0)"><h3 class="jianjietitle">网站协议</h3></a>
        <ul class="zhzl">
            <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                <!--  <p class="zhtext "><a href="javascript:;" >服务条款简介</a></p> -->
                <ul class="zhzllevel2">
                    <li class="tz-active"><a href="${ctx}/cms/article/serviceResponsibilities">服务条款</a></li>
                    <li><a href="${ctx}/cms/article/disclaimer">免责声明</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--左侧内容区域结束-->

    <!--右侧内容区域-->
    <div class="zh-right pull-left jianjie" style="width:72.5%;padding-top: 0">
        <h3>信息中介服务协议</h3>
        <div style=" align:center;margin: 20px">
            <img src="${ctxStatic}/dist/images/help-banner_02.jpg" alt="" width="100%">
        </div>
        <div style="text-indent:2EM;">

            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方：（投资者名称）</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乙方：大公信用数据有限公司</p>
            <p>鉴于：</p>
            <p>
                1、乙方是一家在北京市合法成立并有效存续的有限责任公司。该协议所称“平台”指由大公信用数据有限公司所有并提供投融资信息、信用信息产品的丝路互金网平台（以下简称“平台”）；
            </p>
            <p>
                2、甲方了解融资项目信贷风险，确认具有相应的风险认知和承受能力，并自行承担借贷产生的本息损失，并承诺其提供给乙方的信息完全真实；
            </p>
            <p>
                3、根据《中华人民共和国合同法》及相关法律法规的规定，各方遵循平等、自愿、互利和诚信原则，经友好协商，就甲方接受乙方的信息中介服务达成如下一致意见：
            </p>
            <p></p>
            <p>【第1条】服务内容</p>
            <p>1.1乙方为甲方在平台的投资行为提供信息中介服务，就甲方的投资信息与融资方的借款信息进行信息撮合。</p>
            <p>【第2条】甲方的权利与义务</p>
            <p>2.1甲方通过其用户名和密码登陆的任何操作均视为甲方的真实意思表示；</p>
            <p>
                2.2甲方有义务充分知悉平台发布关于借款项目及风险提示的有关信息（包括但不限于出借限额和出借标的限制的提醒、关于网络借贷风险提示和禁止性行为、融资方风险评估及可能产生的风险结果、已撮合未到期融资项目有关信息等），了解融资项目信贷风险，确认具有相应的风险认知和承受能力，并自行承担借贷产生的本息损失；</p>
            <p>2.3甲方已认真阅读了平台服务协议及本信用中介服务协议并自愿按本协议相关约定履行各自的权利义务。</p>
            <p>【第3条】乙方的权利与义务</p>
            <p>3.1乙方有权代甲方在有必要时对融资方进行贷款的违约提醒工作，包括但不限于电话、短信通知等。甲方在此确认明确委托乙方为其进行以上工作，并授权乙方可以将此工作委托给其他方进行；</p>
            <p>3.2甲方的原始资料，乙方负有保密义务，但因法定事由（包括但不限于依照法律、法规、监管机构、自律组织的要求进行的披露、报备及对外发布、协助司法机关调查等）或另有书面协议约定的除外；</p>
            <p>3.3乙方有权对甲方在平台上的任何记录进行备份；</p>
            <p>3.4乙方并不保证甲方的投资能够被满足，亦不对甲方的投资进行任何形式的担保。</p>
            <p>3.5基于甲方投资行为发生的相关的资金管理及划付服务均由具有法定资质的第三方机构提供，乙方对甲方以完成交易为目的的资金管理及划付的指令及最终的结果、时效性不承担任何责任。</p>
            <p>【第4条】服务变更</p>
            <p>4.1若服务变更的，双方互相商定认可并签署补充协议。</p>
            <p>【第5条】免责条款</p>
            <p>5.1对因甲方或其他方（包括但不限于技术问题）造成的延误或错误，乙方不承担任何责任。</p>
            <p>5.2甲方通过平台风险偏好测试对其风险承受能力进行的评估及乙方向甲方提供的评估报告仅供甲方参考，不得视为乙方对甲方的实际投资建议，乙方不承担任何与甲方投资决策相关的责任。</p>
            <p>【第6条】适用法律及争议解决</p>
            <p>6.1本协议的全部事项，包括但不限于本协议的效力、解释、履行以及争议的解决均受中国大陆法律管辖。</p>
            <p>6.2在本协议的履行过程中如发生争议，甲乙双方应通过友好协商解决，协商不成的，任何一方有权提交北京仲裁委员会适用北京仲裁委员会仲裁规则项下的简易程序进行仲裁。仲裁裁决为终局裁决，对双方均具有约束力。</p>
            <p>6.3在仲裁期间，本协议中不涉及争议的条款仍须履行，各方均不得以解决争议为由拒不履行其在本协议项下的任何义务。</p>
            <p>6.4本协议中的任何条款或部分条款因违反中国法律而无效的，不影响本协议其他条款的效力。</p>
            <p>【第7条】其他</p>
            <p>7.1本协议采用电子文本形式制成，各方均认可该形式的协议效力。甲方在平台网站对本协议进行确认时，视为甲方接受本协议条款内容并签署本服务协议。</p>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>