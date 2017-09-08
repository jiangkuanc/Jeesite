<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/safety.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="clearfix"></div>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active">安全保障</li>
    </ol>
</div>
<div class="safety">
    <img src="${ctxStatic}/dist/images/nav-safey_03.jpg">
</div>
<div class="safety_tab">

    <div class="bs-example bs-example-tabs">
        <ul id="myTab" class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active" style="border-left:none;"><a href="#home" id="home-tab" role="tab"
                                                                                data-toggle="tab" aria-controls="home"
                                                                                aria-expanded="true">信息安全</a></li>
            <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab"
                                       aria-controls="profile">资金安全</a></li>
            <li role="presentation"><a href="#profile1" role="tab" id="profile-tab1" data-toggle="tab"
                                       aria-controls="profile">技术保障</a></li>
            <li role="presentation" style="border-right:none;"><a href="#profile2" role="tab" id="profile-tab2"
                                                                  data-toggle="tab" aria-controls="profile">风险控制</a>
            </li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
                <p>
                    “一带一路”互联网金融信用信息服务平台从人员、技术和流程三个角度构建平台信息安全防御体系，通过设立信息安全岗位，实行信息安全责任制、对重要信息数据进行备份，定期系统升级、以及控制系统访问权限，建立应急处理流程，保障平台信息安全，满足用户对信息安全防御系统的前瞻性、领先性和可持续性要求。
                </p>
                <div class="home_tab_flow">
                    <ul>
                        <li>安全意识</li>
                        <li>人员安全</li>
                        <li>安全能力</li>
                        <li>操作规范</li>
                        <h3> 人—最薄弱的一环</h3>
                    </ul>
                    <a href="javascript:;">
                    </a>
                    <ul>
                        <h3 class="home_tab_flow_h3"> 技术—安全的基线</h3>
                        <li>业务安全</li>
                        <li>应用安全</li>
                        <li>数据安全</li>
                        <li class="home_tab_flow_li">基础安全</li>
                    </ul>
                    <a href="javascript:;">
                    </a>
                    <ul>
                        <li>计划</li>
                        <li>实施</li>
                        <li>坚持</li>
                        <li>改进</li>
                        <h3> 流程—安全的保障</h3>
                    </ul>

                </div>

                <p class="home_last_p">
                    平台技术团队成员全部来自于国内领先技术公司，拥有丰富的行业经验。平台为保障信息安全，专项建立了信息安全管理部门，对平台各种信息资源安全进行监测、运行和管理，并且在公司内部普及信息安全常识、建立相关安全制度，以及应急处理重大安全事件；同时设立了专职信息安全管理岗位，负责平台发布、传播信息的审核和批准。
                </p>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
                <p>
                    资金安全是保障平台投资者利益的重中之重。“一带一路”互联网金融信用信息服务平台严守国家规定，不设资金池，选择与徽商银行以及实力雄厚、有品牌信誉保证的第三方支付机构进行合作，全面实现信息流和资金流分离。
                </p>
                <p class="profile_last_p">
                    徽商银行为一带一路互金网的每一位用户设立专属电子银行账户，对平台资金进行全权存管、对投资资金进行全权管理。平台与用户主体分别开立电子银行账户，平台无权限调用投资者资金，从而保证平台不在任何时候因任何理由以任何方式接触用户资金，真正实现用户资金与平台自有资金相分离，充分体现了平台作为信用信息服务中介的定位，切实起到保障投资者资金安全的作用。
                </p>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="profile1" aria-labelledBy="profile-tab">
                <p>
                    徽商银行为一带一路互金网的每一位用户设立专属电子银行账户，对平台资金进行全权存管、对投资资金进行全权管理。平台与用户主体分别开立电子银行账户，平台无权限调用投资者资金，从而保证平台不在任何时候因任何理由以任何方式接触用户资金，真正实现用户资金与平台自有资金相分离，充分体现了平台作为信用信息服务中介的定位，切实起到保障投资者资金安全的作用。
                </p>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="profile2" aria-labelledBy="profile-tab">
                <p>
                    “一带一路”互联网金融信用信息服务平台运用“四位一体”互联网金融信用风险管控模式，从债务人公开信息、债权人公开监督、评级专业监控、黑名单公示四个方面联动形成了一整套高效、严密的风险控制体系，为实现平台安全提供了多重保障。
                </p>
                <h3> 1、债务人公开信息 </h3>
                <span>
                     平台根据国家监管要求，采用规范的信息披露机制，全面、真实、专业、规范、及时地公开披露各项信息，并且要求债务人主动提供并公开披露企业信息和债项信息，有效从源头上解决了平台用户信息不对称问题，实现了信用信息开放与共享。
                </span>

                <h3> 2、债权人公开监督 </h3>
                <span>
                      平台鼓励债权人积极关注并且及时反馈交易过程中可能出现的各项风险以及债务人的履约情况，对交易进程及平台运营进行时时监督，从而不断剔除劣质债项、净化平台信用环境。另外，平台设有信用教育专栏，在有效提高投资者风险识别能力、帮助投资者正确认识自身风险偏好及风险承担能力的同时，亦加强了对投资者的风险意识教育，有效引导投资者进行合理投资，避免出现逆向选择。平台站在投资者角度，实现了对平台信用风险的控制。
                </span>

                <h3> 3、评级专业监控 </h3>
                <span>
                    大公数据立足于互联网金融运行规律，实现了基于大数据和多层次信用理论风险模型与高素质分析师队伍的有机结合，对平台用户信息及债项信息实施完全线上数据采集，采用定期评级与连续评级相结合的模式，实现了评级全程数字化、自动化和信用主体、偿债评级数据的实时在线，从传统意义上关注评级目标的静态风险，逐步过渡到了注重评级目标的个性化信用风险的评估，实现了由提供评级报告服务向提供信用管理和风险控制服务的转变。
                </span>

                <h3> 4、黑名单公示 </h3>
                <span>
                    平台基于对用户及债项信息收集整理技术，形成多层次信用记录体系，全面覆盖了债务人、债权人、平台债项和其他参与者，区分信用记录状态，对应建立了正常名单、预警观察名单及黑名单制度体系，并通过主体信用记录黑名单公示，让信用记录成为褒奖诚信、惩戒失信、净化环境的有力武器，保护了交易主体权益，有效降低了信用风险，独立客观地帮助投资人把好信用风险闸门。
                </span>
            </div>
        </div>
    </div>
</div>


<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script>
    $(function () {
        $(".tabs ul li").click(function () {
            $(this).addClass('current').siblings().removeClass('current');
            $(this).find("span").addClass("border-top").parent().siblings().find("span").removeClass('border-top');
            var index = $(".tabs ul li").index(this);
            $('.tabs div .one').eq(index).show().addClass('current2').siblings().hide().removeClass('current2');
        });
    });
</script>
</body>
</html>
