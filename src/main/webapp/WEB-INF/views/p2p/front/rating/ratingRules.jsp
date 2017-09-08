<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/safety.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <style>
        p {
            margin: 0;
        }

        a:focus, a:hover {
            color: #bf1a20;
        }

        /* .breadcrumb {
            width: 1100px;
            margin: 10px auto;
        } */

        .breadcrumb li.active {
            color: #373737;
            font-weight: bold;
        }

        .wyrz-banner-box {
            position: relative;
        }

        .wyrz-banner-box .wyrz-banner {
            width: 100%;
            background-size: cover;
        }

        .sqztpj {
            position: absolute;
            bottom: 35px;
            right: 178px;
            color: #bf1a20;
            font-size: 30px;
            padding: 16px 30px;
            background: rgba(255, 255, 255, .8);
            border: 2px solid #ffffff;
            border-radius: 5px;
        }

        .contBox {
            width: 1100px;
            margin: 0 auto;
            font-size: 18px;
            color: #666666;
            line-height: 36px;
        }

        .pjsm {
            font-size: 26px;
            color: #bf1a20;
        }

        .pjText {
            margin-bottom: 20px
        }

        .textIndent {
            text-indent: 2em;
        }

        .contBox h4 {
            font-size: 20px;
            color: #333333;
            margin-bottom: 20px
        }

        .contBox-div1 {
            padding-left: 40px;
        }

        .contBox-div1 p {
            margin-bottom: 36px
        }

        .djsm-table > thead > tr > th {
            border-bottom: none;
            text-align: center;
            color: #ffffff;
            background: #4f81bd;
            padding: 16px 0
        }

        .djsm-table {
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 5px;
            box-shadow: 2px 4px 6px rgba(0, 0, 0, .1);
            margin-bottom: 46px
        }

        /* .djsm-table>tbody>tr:nth-of-type(odd) {
            background: #c7e5fd;
        } */

        .djsm-table > tbody > tr:nth-of-type(even) {
            background: #eeeeee;;
        }

        .djsm-table > tbody > tr > td {
            border: none;
            padding-left: 96px;
            color: #333333;
            font-size: 14px;
        }

        .djsm-table > tbody > tr > td:first-of-type {
            width: 25%
        }

        .djsm-table > tbody > tr > .bz {
            /* 	background: #83c3f9; */
            padding: 30px 0;
            text-align: center;
            color: #666;
        }

        table tr > th:first-child {
            -moz-border-radius-topleft: 5px;
            -webkit-border-top-left-radius: 5px;
            border-top-left-radius: 5px
        }

        table tr > th:last-child {
            -moz-border-radius-topright: 5px;
            -webkit-border-top-right-radius: 5px;
            border-top-right-radius: 5px
        }

        table tr:last-child td:first-child {
            -moz-border-radius-bottomleft: 5px;
            -webkit-border-bottom-left-radius: 5px;
            border-bottom-left-radius: 5px
        }

        table tr:last-child td:last-child {
            -moz-border-radius-bottomright: 5px;
            -webkit-border-bottom-right-radius: 5px;
            border-bottom-right-radius: 5px
        }

        .sqztpj-btn {
            text-align: center;
            margin: 80px 0;
        }

        .sqztpj-btn a {
            color: #000000;
            font-size: 36px;
            background: #cc0001;
            padding: 27px 110px;
            display: inline-block;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active">评级服务</li>
    </ol>
</div>
<!--内容开始-->
<div class="cont-wyrz">
    <div class="wyrz-banner-box">
        <img src="${ctxStatic}/dist/images/pjbg-banner1.jpg" alt="" class="wyrz-banner"> <a
            href="${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp" class="sqztpj">申请主体评级</a>
    </div>
    <div class="contBox">
        <h3 class="pjsm">评级说明</h3>
        <div class="pjText">
            <p class="textIndent">
                大公互联网数字化评级依据《大公信用评级原理》理论，以受评主体偿债来源对总量债务的覆盖度评价其偿债能力，充分考虑偿债来源对财富创造能力的偏离度，并运用大量历史数据预测未来信息，最终揭示其信用风险。</p>
            <p class="textIndent">
                基于此，大公在深入研究中小企业以及互联网金融信用风险形成规律的基础上，全面深入梳理影响互联网债务人偿债能力的内外部因素，即数据项，并将其进行标准化处理，对评级指标层层分解，最终独创数字化信用评级方法。</p>
        </div>
        <h4>一、数字化评级逻辑架构</h4>
        <div class="contBox-div1">
            <p>本评级方法遵循现代信用经济生产与信用、信用与评级的矛盾运动规律，体现了以下评级思想：</p>
            <p>（一）信用风险形成因素的内在联系是构成评级要素的源泉；</p>
            <p>（二）判定信用关系所处状态，发挥评级逆周期作用；</p>
            <p>（三）创富能力是偿还债务的基石；</p>
            <p>（四）各偿债来源的偏离度是判定企业偿债能力的关键；</p>
            <p>（五）根据债务人的总债务偿还能力、存量债务偿还能力以及新增债务偿还能力这三种偿债能力判定其信用级别。
                为实现评级结果的一致性和可比性，本方法遵循大公中小企业评级方法的一般逻辑结构，主要包括五大要素：偿债环境、创富能力、偿债来源、偿债能力以及调整项。通过对偿债环境指数、创富能力指数、偿债来源指数和偿债能力指数进行风险加权后得到债务主体相应的信用评级分值，将其映射到所对应级别区间，得到初始信用评级结果。由评审委员会对计算结果进行审核，并考虑评级系统中未以指标形式出现的因素，根据行业环境和外部支持调整项对初始级别进行调整，确定最终级别。</p>
        </div>
        <h4>二、数字化评级流程具体而言,大公互联网数字化评级方法通过以下四个步骤得到最终级别：</h4>
        <div class="contBox-div1">
            <p>（一）确定各要素的核心指标
                根据外部偿债环境和企业内部创富能力的一般影响因素，确定衡量各要素的核心指标，包括定量和定性指标。指标打分方法采取5分制的评分标准。</p>
            <p>（二）编制偿债环境、创富能力和偿债来源指数
                运用层层递进分析方法对偿债环境、创富能力和偿债来源的评级要素进行分析，根据各项核心指标的重要性确定权重，进行逐级风险加权，形成偿债环境指数、创富能力指数和偿债来源指数。</p>
            <p>（三）确定债务偿还能力指数
                根据经偏离度调整后的可用偿债来源及总量债务，来计算存量债务偿还能力和新增债务偿还能力，进而得到总量债务偿还能力。</p>
            <p>（四）确定级别
                将评级要素指数映射到所对应的等级区间，得到评级结果。由评审委员会根据调整项对初始评级结果进行审核、投票。评审委员会首先需要复核定性指标的打分结果和定量指标的准确性，对数字化评级系统的评级结果进行校正。若评审委员会认为存在可能影响个体信用级别的特殊因素未在评级模型中得到反映，可对评级结果进行调整。
                大公互联网数字化评级信用级别划分为三等九级，级别符号采用大写英文字母表示，分为A、B、C三等，每等分为三级，即AAA、AA、A；BBB、BB、B；CCC、CC、C。除AAA和CCC（含）以下级别外，每一信用级别可用“+”、“-”符号进行微调。每个信用级别符号表达的是经偿债环境、创富能力等风险因素调整后的偿债来源对债务的保障能力。具体登记含义如下表所示：</p>
            <h4>网络贷款企业信用等级符号和定义说明</h4>
            <table class="table djsm-table">
                <thead>
                <tr>
                    <th>信用等级</th>
                    <th>定义</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>AAA</td>
                    <td>偿还债务能力极强，债务偿还安全度很高，违约风险极低</td>
                </tr>
                <tr>
                    <td>AA</td>
                    <td>偿还债务能力很强，债务偿还安全度高，违约风险很低</td>
                </tr>
                <tr>
                    <td>A</td>
                    <td>偿还能力较强，债务偿还安全度较高，违约风险较低</td>
                </tr>
                <tr>
                    <td>BBB</td>
                    <td>偿还债务能力一般，债务偿还安全度较低，违约风险一般</td>
                </tr>
                <tr>
                    <td>BB</td>
                    <td>偿还债务能力较弱，债务偿还安全度低，有较高违约风险</td>
                </tr>
                <tr>
                    <td>B</td>
                    <td>偿还债务能力不足，违约风险很高</td>
                </tr>
                <tr>
                    <td>CCC</td>
                    <td>偿还债务能力弱，债务偿还安全度差，违约风险极高</td>
                </tr>
                <tr>
                    <td>CC</td>
                    <td>在破产或重组时可获得保护较小，基本不能保证偿还债务</td>
                </tr>
                <tr>
                    <td>C</td>
                    <td>不能偿还债务</td>
                </tr>
                <tr>
                    <td class="bz" colspan="2">注：除AAA级、CCC级（含）以下等级外，每个信用等级可用“+”、“-”符号进行微调，表示略高或略低于本等级。</td>
                </tr>


                </tbody>
            </table>
        </div>
        <h4>三、数字化评级优势</h4>
        <div class="contBox-div1">
            <p>（一）信息采集自动化</p>
            <p>
                数字化评级依托大数据时代背景，线上获取受评主体所提交的评级资料清单，并自动化采集评级所需的信息，且数据来源广泛，具有一定的权威性。自动化采集过程遵循原始数据筛选严格、数据真实可靠、操作人员专业规范三项原则，力争数据源准确无误，保证采集的信息可全面、精确反映受评主体的信用状况，高效便捷完成信息采集基础工作。</p>
            <p>（二）数据处理标准化；</p>
            <p>
                数字化评级要求对数据项的来源、性质、作用、位置及编码进行标准化处理。通过对标准化后的数据项进行全面审计，以对企业提供的内部信息进行偏离度调整，最终填报至大公信用信息报表。此信用信息报表经互联网金融债务人确认后便可依据该报表和信用评级指标体系进行评级操作，最终得出相应级别。</p>
            <p>（三）报告生成智能化；</p>
        </div>
    </div>
    <div class="sqztpj-btn">
        <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp" style="color: #fff">申请主体评级</a>
    </div>
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>
