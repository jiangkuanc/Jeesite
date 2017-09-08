<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bzzx-jklc.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <style>
        .tab-pane img {
            width: 80%;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx }/cms/article/helpCenter">帮助中心</a></li>
        <li class="lg-active" style="font-weight: bold;">借款流程</li>
    </ol>
</div>
<!--内容开始-->
<div class="cont-jklc">
    <div class="safety_tab_jklc">
        <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav" role="tablist">
                <li role="presentation"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
                                           aria-expanded="true"></a></li>
                <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile1" role="tab" id="profile-tab1" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile2" role="tab" id="profile-tab2" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile3" role="tab" id="profile-tab3" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile4" role="tab" id="profile-tab4" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile5" role="tab" id="profile-tab5" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile6" role="tab" id="profile-tab6" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile7" role="tab" id="profile-tab7" data-toggle="tab"
                                           aria-controls="profile"></a></li>
                <li role="presentation"><a href="#profile8" role="tab" id="profile-tab8" data-toggle="tab"
                                           aria-controls="profile"></a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
                    <h4>实名认证</h4>
                    <ol>
                        <li>
                            <h5>登录账号后进入个人中心，点击“完成认证”，进入实名认证页面。</h5>
                            <img src="${ctxStatic}/dist/images/help/1-1.png" alt="">
                        </li>
                        <li>
                            <h5>进入实名认证页面,填写身份认证材料，并提交。</h5>
                            <img src="${ctxStatic}/dist/images/help/1-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>提交完成后，等待审核。</h5>
                            <img src="${ctxStatic}/dist/images/help/1-3.bmp" alt="">
                        </li>
                        <li>
                            <h5>审核通过后即完成认证。</h5>
                            <img src="${ctxStatic}/dist/images/help/1-4.bmp" alt="">
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
                    <h4>企业认证</h4>
                    <ol>
                        <li>
                            <h5>登录账号进入账户中心后，点击“完成认证”，进入企业认证页面。</h5>
                            <img src="${ctxStatic}/dist/images/help/2-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>进入企业认证页面,填写认证材料，并提交。</h5>
                            <img src="${ctxStatic}/dist/images/help/2-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>提交完成后，等待审核。</h5>
                            <img src="${ctxStatic}/dist/images/help/2-3.bmp" alt="">
                        </li>
                        <li>
                            <h5>审核通过后即完成认证。</h5>
                            <img src="${ctxStatic}/dist/images/help/2-4.bmp" alt="">
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile1" aria-labelledBy="profile-tab">
                    <h4>成为会员</h4>
                    <ol>
                        <li>
                            <h5>点击“会员管理”，进入会员管理页面。</h5>
                            <img src="${ctxStatic}/dist/images/help/3-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>进入成为会员页面，点击“成为会员”按钮即可成为免费会员。</h5>
                            <img src="${ctxStatic}/dist/images/help/3-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>成为会员。</h5>
                            <img src="${ctxStatic}/dist/images/help/3-3.bmp" alt="">
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile2" aria-labelledBy="profile-tab">
                    <h4>申请融资</h4>
                    <ol>
                        <li>
                            <h5>点击“我的申请”，进入融资申请页面，查看申请须知内容。</h5>
                            <img src="${ctxStatic}/dist/images/help/4-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>点击“申请融资”按钮后，进入基本信息填写页面，填写完所需信息后，签署“大公评级服务协议”并点击“下一步”。</h5>
                            <img src="${ctxStatic}/dist/images/help/4-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>进入企业基本材料提交页面后，根据页面清单提交基本材料，完成后点击“下一步”。</h5>
                            <img src="${ctxStatic}/dist/images/help/4-3.png" alt="">
                        </li>
                        <li>
                            <h5>进入财务材料提交页面后，提交企业财务材料，完成后点击“提交”。</h5>
                            <img src="${ctxStatic}/dist/images/help/4-4.png" alt="">
                        </li>
                        <li>
                            <h5>提交成功后等待审核，待审核完成后，可进入付费操作。</h5>
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile3" aria-labelledBy="profile-tab">
                    <h4>支付评级费</h4>
                    <ol>
                        <li>
                            <h5>点击“我的申请”，进入付费页面。</h5>
                            <img src="${ctxStatic}/dist/images/help/5-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>点击“支付费用”，进入支付页面，选择相应的银行进行支付。</h5>
                            <img src="${ctxStatic}/dist/images/help/5-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>支付完费用后开始评级。</h5>
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile4" aria-labelledBy="profile-tab">
                    <h4>确认评级结果</h4>
                    <ol>
                        <li>
                            <h5>接收到确认评级结果短信后，登录账号进入账户中心，点击“我的申请”，进入评级结果确认页面。</h5>
                            <img src="${ctxStatic}/dist/images/help/6-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>点击“确认评级结果”后，进入评级结果确认页面，填写意见后提交。</h5>
                            <img src="${ctxStatic}/dist/images/help/6-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>提交意见后等待复评结果。</h5>
                            <img src="${ctxStatic}/dist/images/help/6-3.bmp" alt="">
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile5" aria-labelledBy="profile-tab">
                    <h4>增信</h4>
                    <ol>
                        <li>
                            <h5>接收到确认评级结果短信后，登录账号进去账户中心，点击“我的申请”，进入评级结果确认页面。</h5>
                            <img src="${ctxStatic}/dist/images/help/7-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>点击“选择评估公司”按钮，在新的页面中根据为页面选择“资产评估公司”，并根据联系方式，联系评估公司完成资产评估。</h5>
                            <img src="${ctxStatic}/dist/images/help/7-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>待评估公司将评估材料上传并通过后，即为完成资产评估。</h5>
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile6" aria-labelledBy="profile-tab">
                    <h4>发布借款信息</h4>
                    <ol>
                        <li>
                            <h5>接收到评级结果短信通知后，登录账户，进入账户中心，点击“我的申请”，进入借款信息确认页面。</h5>
                            <img src="${ctxStatic}/dist/images/help/8-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>进入借款产品信息页面后，选择借款产品的利率，点击“发布”按钮进行发布。</h5>
                            <img src="${ctxStatic}/dist/images/help/8-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>借款信息发布后，开始募集款项。</h5>
                            <img src="${ctxStatic}/dist/images/help/8-3.bmp" alt="">
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile7" aria-labelledBy="profile-tab">
                    <h4>联系借款机构</h4>
                    <ol>
                        <li>
                            <h5>接收到募集成功的短信通知后，登录账户，点击“消息中心”，进入消息列表页。</h5>
                            <img src="${ctxStatic}/dist/images/help/9-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>进入消息列表页后点击满标通知查看投资机构联系信息。</h5>
                            <img src="${ctxStatic}/dist/images/help/9-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>根据机构联系信息和投资者取得联系，完成借款合作。</h5>
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile8" aria-labelledBy="profile-tab">
                    <h4>上传还款凭证</h4>
                    <ol>
                        <li>
                            <h5>还完款项后，登录账户，进入账户中心。</h5>
                            <img src="${ctxStatic}/dist/images/help/10-1.bmp" alt="">
                        </li>
                        <li>
                            <h5>点击“我的债项”后，在页面中选择“还款中的债项”。</h5>
                            <img src="${ctxStatic}/dist/images/help/10-2.bmp" alt="">
                        </li>
                        <li>
                            <h5>点击“立即还款”按钮后，根据页面提示录入还款信息。</h5>
                            <img src="${ctxStatic}/dist/images/help/10-3.bmp" alt="">
                        </li>
                        <li>
                            <h5>还款信息通过审核后即完成还款。</h5>
                            <img src="${ctxStatic}/dist/images/help/10-4.bmp" alt="">
                        </li>
                    </ol>
                </div>
            </div>

        </div>
    </div>
</div>
<!--内容结束-->

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script>


    /*
     * 模块建设中齿轮旋转
     * */
    var num = 0;
    setInterval(function () {
        num++;
        num %= 360;
        $(".mkjsz-icon").css({"transform": "rotate(" + num + "deg)"})
    }, 25);

</script>
</body>
</html>