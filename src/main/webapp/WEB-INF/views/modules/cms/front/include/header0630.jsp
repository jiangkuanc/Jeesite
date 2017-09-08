<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta name="author" content="http://thinkgem.iteye.com"/>
<meta http-equiv="X-UA-Compatible" content="IE=11,IE=9,IE=10"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/letter/easydialog.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/dist/css/bootstrapValidator.min.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/xcConfirm/css/xcConfirm.css">
<script type="text/javascript" src="${ctxStatic}/letter/easydialog.js"></script>
<script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/xcConfirm/js/xcConfirm.js"></script>
<link rel="stylesheet" href="${ctxStatic}/dist/css/indexfront.css">
<!-- <script src="/dagongp2p/static/dist/js/jquery-1.11.1.min.js"></script> -->
<%-- <link rel="stylesheet" type="text/css" href="${ctxStatic}/letter/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/letter/icon.css"> --%>

<%-- <script type="text/javascript" src="${ctxStatic}/letter/jquery.easyui.min.js"></script> --%>

<style type="text/css">
    .nav-top {
        margin-top: 15px;
    }

    .nav-top div.pull-left a {
        color: #000;
        margin: 0 5px;
    }

    .nav-top div.pull-left a:first-child {
        border-right: 1px solid #be191f;
        padding-right: 10px;
        color: #be191f;
    }

    .nav-top div.pull-left a:hover {
        color: #be191f;
        text-decoration: none;
    }

    .nav-top div.pull-right span:nth-child(2) {
        color: #ef7320;
    }

    .nav-top div.pull-right span:nth-child(2) img {
        vertical-align: text-bottom;
        margin-right: 5px;
    }

    .nav-top div.pull-right div.pull-right {
        margin: -6px 0 0 5px;
        border: 1px solid #cccccc;
        border-radius: 4px;
        overflow: hidden;
    }

    .nav-top div.pull-right div.pull-right input {
        border-radius: 2px;
        padding-left: 5px;
        border: 0;
        height: 30px;
    }

    .nav-top div.pull-right div.pull-right button {
        vertical-align: bottom;
        background: url("images/index_03.png") 50% no-repeat;
        margin: 0px;
        height: 30px;
        width: 40px;
        border: 0.5px solid #cccccc;
    }

    .nav-bot ul {
        padding: 0;
        margin-bottom: 0px;
    }

    .nav-bot ul li {
        list-style: none;
        border-bottom: 5px solid #FFFFFF;
        float: right;
        margin: 0 0 0 1%;
        line-height: 70px;
        width: 11.5%;
        text-align: center;
        font-size: 18px;
    }

    .nav-bot ul li:hover {
        border-bottom: 5px solid #be191f;
    }

    .nav-bot ul li a {
        color: #000000;
    }

    .nav-bot ul li a:hover {
        text-decoration: none;
    }

    .nav-bot ul li div.li-div {
        position: absolute;
        display: none;
        background: #FFFFFF;
        top: 66px;
        margin-left: -2.5%;
        width: 15%;
        z-index: 100;
        overflow: visible;
    }

    .nav-bot ul li div.li-div a {
        line-height: 30px;
        width: 100%;
        display: block;
        background: #FFFFFF;
    }

    .nav-bot ul li div.li-div a:hover {
        background: #be191f;
    }

    /* 进入进入丝路互金网弹框css */
    .trz-xcConfirm .popBox {
        height: 560px;
        width: 800px;
        background: rgba(255, 255, 255, 1);
        left: 50%;
        margin-left: -400px;
        margin-top: -320px;
    }

    .trz-xcConfirm .popBox .ttBox .clsBtn {
        z-index: 666;
        width: 42px;
        height: 42px;
        background: url("${ctxStatic}/dist/images/trz-tkgb.png") no-repeat center;
    }

    .trz-xcConfirm .popBox .ttBox {
        width: 100%;
        height: 110px;
        border-bottom: solid 4px #c41820;
        color: #c41820;
        text-align: center;
        margin: 0 auto;
    }

    .trz-xcConfirm .popBox .txtBox {
        height: 360px;
        margin: 10px 0 0 0;
    }

    .trz-xcConfirm .popBox .ttBox .tt {
        width: 100%;
        line-height: 80px;
        font-size: 42px;
        font-weight: 700;
        font-family: "Microsoft YaHei";
    }

    .trz-xcConfirm .popBox .txtBox p {
        margin: 0;
        height: 360px;
    }

    .trz-xcConfirm .popBox .txtBox p > h5 {
        color: #666666;
        text-align: center
    }

    .trz-xcConfirm .input-group-addon {
        width: 140px;
        padding: 6px 15px;
        height: 35px;
        border: none;
        background: transparent;
        font-size: 20px;
        font-weight: 700;
        line-height: 35px;
        text-align: left
    }

    #code-trz {
        margin: 6px 12px;
        width: 90px;
        height: 34px;
        color: aquamarine;
        border-radius: 4px;
        font-family: Arial;
        font-style: italic;
        font-weight: bold;
        letter-spacing: 5px;
        background-size: 100% 100%;
        font-size: 24px;
        outline: none;
    }

    #load-data-trz {
        font-size: 14px;
        margin-bottom: 10px;
    }

    #load-data-trz input {
        width: 15px;
        height: 15px;
        vertical-align: -2px;
        margin-left: 140px
    }

    #ztlx label {
        font-size: 18px;
        font-weight: normal;
        line-height: 47px;
        margin-right: 35px;
    }

    #ztlx input {
        width: 18px;
        height: 18px;
        border: solid 1px #eef0f1;
        margin-right: 12px;
        margin-top: 0;
        vertical-align: -3px;
    }

    #trzForm {
        width: 60%;
        margin: 20px auto;
    }

    .trz-xcConfirm .form-group {
        margin-bottom: 10px;
    }

    #code-span-trz {
        vertical-align: 2px;
        color: #666666;
    }

    #login-ok-trz {
        margin-top: 30px;
        padding-left: 20px;
    }

    #login-alert-trz {
        width: 78%;
        color: #fff;
        background-color: #bf1a20;
        border-color: #bf1a20;
        font-size: 30px;
    }

    #tzlj {
        position: absolute;
        bottom: 110px;
        right: 30px;
        font-size: 18px;
        color: #333333;
        font-weight: normal;
    }

    .trz-xcConfirm .xc_layer {
        background: black;
        opacity: 0.5;
    }

    #hqyzm {
        width: 120px;
        text-align: center;
        display: inline-block;
        border: none;
        line-height: 34px;
        margin: 6px 0 0 10px;
        padding: 0;
        background: #bf1a20;
        color: #ffffff;
        border-radius: 4px;
        cursor: pointer
    }

    .form-horizontal-trz .has-feedback .form-control-feedback {
        right: 215px;
        top: 6px;
    }

    .form-horizontal-trz .sjh .form-control-feedback {
        right: 85px;
        top: 6px;
    }

    #trzForm .help-block {
        margin: 0;
    }

    .trz-xcConfirm .has-feedback .form-control {
        padding-right: 25px;
    }

</style>
<script type="text/javascript">
    $(document).ready(function () {
        $(window).resize(function () {
            var boxheight = $("#easyDialogBox").height() / 2;
            var boxwidth = $("#easyDialogBox").width() / 2;
            $("#easyDialogBox").css({'top': $(window).height() - boxheight + 'px'});
            $("#easyDialogBox").css({'left': $(window).width() - boxwidth + 'px'});
        });
    });

    var updater = {
        poll: function () {
            var user = {'userId': '${user.id}'};
            //根据用户ID查询用户站内信并返回站内信数据
            $.ajax({
                url: '${ctx}/msg/msg/sendLetter',
                data: user,
                type: 'POST',
                dataType: 'text',
                async: true,
                success: updater.onSuccess,
                error: updater.onError
            });
        },
        onSuccess: function (data, dataStatus) {
            try {
                if (data.indexOf("#_#") == -1) {
                    if (${user.roleList[0].id == 102}) {
                        $('#number1').text('0');
                    }
                    if (${user.roleList[0].id == 101}) {
                        $('#number2').text('0');
                    }
                    if (${user.roleList[0].id == 104}) {
                        $('#number3').text('0');
                    }
                    setTimeout(updater.poll, 5000);
                    return;
                }
                var dataArr = data.split("#_#");
                //站内信编号
                $('#letterID').val(dataArr[3]);
                //如果条数等于显示的条数方法结束
                if (${user.roleList[0].id == 102}) {
                    if (dataArr[2] == $('#number1').text()) {
                        return;
                    }
                }
                if (${user.roleList[0].id == 101}) {
                    if (dataArr[2] == $('#number2').text()) {
                        return;
                    }
                }
                if (${user.roleList[0].id == 104}) {
                    if (dataArr[2] == $('#number3').text()) {
                        return;
                    }
                }
                //如果条数等于0显示0,不等于0显示数，并弹出提示框
                if (${user.roleList[0].id == 102}) {
                    if (dataArr[2] === '0') {
                        $('#number1').text('0');
                    } else {
                        $('#number1').text(dataArr[2]);
                        show(dataArr[0], dataArr[1], dataArr[3]);
                    }
                }
                if (${user.roleList[0].id == 101}) {
                    if (dataArr[2] === '0') {
                        $('#number2').text('0');
                    } else {
                        $('#number2').text(dataArr[2]);
                        show(dataArr[0], dataArr[1], dataArr[3]);
                    }
                }
                if (${user.roleList[0].id == 104}) {
                    if (dataArr[2] === '0') {
                        $('#number3').text('0');
                    } else {
                        $('#number3').text(dataArr[2]);
                        show(dataArr[0], dataArr[1], dataArr[3]);
                    }
                }
            } catch (e) {
                updater.onError();
                return;
            }
            interval = window.setTimeout(updater.poll, 5000);
        },
        onError: function () {
            console.log("Poll error;");
        }
    };


    //计数器
    function show(data1, data2, data3) {
        easyDialog.open({
            container: {
                header: '您有新的站内信!',
                content: '<c:if test="${user.roleList[0].id == '101'}">' +
                '<a href="${ctx}/user/Institution/ctrlMenu?mode=msgContent&msgId=' + data3 + '">' + data1 + '</a>' +
                '</c:if>' +
                '<c:if test="${user.roleList[0].id == '102'}">' +
                '<a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgContent&msgId=' + data3 + '">' + data1 + '</a>' +
                '</c:if>' +
                '<c:if test="${user.roleList[0].id == '104'}">' +
                '<a href="${ctx}/msg/msgLetterRecord/getById?id=' + data3 + '">' + data1 + '</a>' +
                '</c:if>'
            },
            autoClose: 10000,
            overlay: false
        });
        return;
    }

    if (!${empty user.id }) {
        //alert("用户ID存在");
        updater.poll();
    }

    /**
     *  点击用户名跳转到个人中心
     */
    function accountCentral() {
        var roleList = '${user.roleList[0].id}';
        if (roleList == 101) {
            window.location.href = '${ctx}/user/Institution/ctrlMenu';
        } else if (roleList == 102) {
            window.location.href = '${ctx}/user/p2pUserInformation/accountPermission';
        } else if (roleList == 104) {
            window.location.href = '${ctx}/user/accountGeneration/showAllInformation';
        }
    }

    $(function () {
        $('.nav-bot ul li').hover(function () {
            $(this).find('.li-div').slideToggle();
        });
    });
    /* function model_eidt(){
     $.ajax({
     url : '${ctx}/msg/msg/listQianTai?id='+$('#letterID').val(),
     dataType:'html',
     type:'post',
     success:function(data){
     //alert("显示页面");
     $("#myModal_view").html(data);
     $('#myModal_view').modal('show');
     }
     });
     } */
    function toEnglish() {
        window.location.href = 'http://www.silkroaditfin.com/fwpt_en/en/f';
    }
    function toPhone() {
        window.location.href = '${ctx}/image/linkMobile';
    }
</script>
<style>
    <!--
    /* 	.a{ */
    /* 		-moz-border-radius-bottomleft: 5px; */
    /* 	    -webkit-border-bottom-left-radius: 5px; */
    /* 		-moz-border-radius-bottomright: 5px; */
    /* 		-webkit-border-bottom-right-radius: 5px; */
    /* 	} */
    /* 	.index-nva .pull-left li .a-p a{ */
    /* 	    display: block; */
    /* 	    width: 100%; */
    /* 	    height: 35px; */
    /* 	    text-align: center; */
    /* 	    opacity: 0.95; */
    /* 	    font-size: 16px; */
    /* 	    color: black; */
    /* 	    background-color: white; */
    /* 	    line-height: 30px; */
    /* 	} */
    -->
</style>
<%-- <div class="index-top">
    <div class="index-top-left pull-left">
        <c:choose>
 		<c:when test="${empty user.id }">
           <p class="index-top-left-p"><a href="${ctx}/sys/user/preUserLogin" class="pull-left">登录</a> &nbsp;&nbsp;<a href="${ctx}/sys/user/preUserRegister" class="pull-left">免费注册</a></p>
 		</c:when>
 		<c:otherwise>
           <p class="index-top-left-p"><a href="#" onclick="accountCentral()" class="pull-left">欢迎您，${user.loginName }</a>
           ${requestScope.get }
           <input type="hidden" value="" id="letterID"/>
           <!-- <a href="#" id="aaa" onclick="model_eidt();" data-toggle="modal" data-target="#myModal_view" class="pull-left"><font color="red"  style="font-weight: bold;font-family:Tahoma" >消息&nbsp;<span id="number">0</span>&nbsp;</font></a> -->
           <c:if test="${user.roleList[0].id == 102}">
           		<a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter" id="aaa" class="pull-left" style="font-weight: bold;font-family:Tahoma;color:red;">我的消息&nbsp;<span id="number1">0</span>&nbsp;
           		</a>
           </c:if>
           <c:if test="${user.roleList[0].id == 101}">
           		<a href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter" id="bbb" class="pull-left" style="font-weight: bold;font-family:Tahoma;color:red;">我的消息&nbsp;<span id="number2">0</span>&nbsp;           		
           		</a>
           </c:if>
           <c:if test="${user.roleList[0].id == 104}">
           		<a href="${ctx}/msg/msgLetterRecord/getMsgList?mode=message" id="ccc" class="pull-left" style="font-weight: bold;font-family:Tahoma;color:red;">我的消息&nbsp;<span id="number3">0</span>&nbsp;         		
           		</a>
           </c:if>
           <a href="${ctx}/sys/user/userLogout" class="pull-left">退出</a></p>
 		</c:otherwise>
 	</c:choose>
    </div>
    <div class="index-top-right pull-right">
        <p class="index-top-right-p"><img class="pull-left" src="${ctxStatic}/dist/images/bangzhu.png" alt=""><a href="${ctx }/cms/article/helpCenter" class="pull-left">帮助中心                   </a> &nbsp;&nbsp;<img class="pull-left" src="${ctxStatic}/dist/images/dianhua.png" alt=""><a href="#" class="pull-left">热线电话：400-888 8888（周一至周五：8:30~17:30）</a></p>
    </div>
</div> --%>
<div class="container">
    <div class="row nav-top">
        <div class="col-md-3">
            <div class="pull-left">
                <c:choose>
                    <c:when test="${empty user.id }">
                        <a href="${ctx}/sys/user/preUserLogin">登录</a>
                        <a href="${ctx}/sys/user/preUserRegister">免费注册</a>
                    </c:when>
                    <c:otherwise>
                        <p class="index-top-left-p"><a href="#" onclick="accountCentral()"
                                                       class="pull-left">欢迎您，${user.loginName }</a>
                            <input type="hidden" value="" id="letterID"/>
                            <c:if test="${user.roleList[0].id == 102}">
                                <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter" id="aaa"
                                   class="pull-left"
                                   style="font-weight: bold;font-family:Tahoma;color:red;">我的消息&nbsp;<span id="number1">0</span>&nbsp;
                                </a>
                            </c:if>
                            <c:if test="${user.roleList[0].id == 101}">
                                <a href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter" id="bbb" class="pull-left"
                                   style="font-weight: bold;font-family:Tahoma;color:red;">我的消息&nbsp;<span id="number2">0</span>&nbsp;
                                </a>
                            </c:if>
                            <c:if test="${user.roleList[0].id == 104}">
                                <a href="${ctx}/msg/msgLetterRecord/getMsgList?mode=message" id="ccc" class="pull-left"
                                   style="font-weight: bold;font-family:Tahoma;color:red;">我的消息&nbsp;<span id="number3">0</span>&nbsp;
                                </a>
                            </c:if>
                            <a href="${ctx}/sys/user/userLogout" class="pull-left">退出</a></p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="col-md-9">
            <div class="pull-right">
                <span><a href="${ctx}/cms/article/helpCenter" style="color: #000000;">帮助中心</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span><img src="${ctxStatic}/dist/images/index_06.png"
                           alt="">客服电话：4008-84-4008 010-83032098（7*24小时）</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span><a href="javascript:toEnglish()" style="color: #000000;">English</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span><a href="javascript:toPhone()" style="color: #000000;">手机APP</a></span>
            </div>
        </div>
    </div>
</div>
<hr style="width: 100%;height: 1px;background: #cccccc;margin-top: 10px;">
<div class="container" style="padding-right:0;">
    <div class="row nav-bot" style="margin: 0px; height: 75px;">
        <div class="col-md-2" style="padding: 0px;">
            <a href="${pageContext.request.contextPath}${fns:getFrontPath()}"><img
                    src="${ctxStatic}/dist/images/logo_03.png" alt="" style="margin-left: 20%"></a>
        </div>
        <div class="col-md-10" style="float: right;">
            <ul>
                <li>
                    <a href="###">走进大公数据</a>
                    <div class="li-div">
                        <a href="${ctx}/cms/article/companyProfile">公司简介</a>
                        <a href="${ctx}/cms/article/cydiaProfile">丝路互金网简介</a>
                        <a href="${ctx}/cms/article/newsList">新闻动态</a>
                        <a href="${ctx}/cms/article/safetyGuarantee">风控体系</a>
                        <a href="${ctx}/cms/article/contactUs">联系我们</a>
                        <a href="${ctx}/cms/article/partner">合作伙伴</a>
                        <%--   <a href="${ctx}/cms/article/operationData">运营数据</a> --%>
                    </div>
                </li>
                <c:if test="${user.roleList[0].id == 102}">
                    <li>
                        <a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a>
                    </li>
                </c:if>
                <c:if test="${user.roleList[0].id == 104}">
                    <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
                </c:if>
                <c:if test="${user.roleList[0].id == 101}">
                    <li><a href="${ctx}/user/Institution/ctrlMenu">我的账户</a></li>
                </c:if>
                <c:if test="${user.roleList[0].id == 105}">
                    <li><a href="${ctx}/user/AssetValuation/ctrlMenu">我的账户</a></li>
                </c:if>
                <c:if test="${user.roleList[0].id == 106}">
                    <li><a href="${ctx}/user/Guarantee/ctrlMenu">我的账户</a></li>
                </c:if>
                <li>
                    <a href="###">信用建设</a>
                    <div class="li-div">
                        <a href="${ctx}/cms/article/xyjyjiangtang">信用教育讲堂</a>
                        <a href="${ctx}/cms/link/xyjyshipin">信用教育视频</a>
                        <a href="${ctx}/cms/article/xyjyhuodong">信用教育活动</a>
                        <a href="${ctx}/cms/article/xinyongjlcx">信用记录查询</a>
                    </div>
                </li>
                <li>
                    <a href="###">网络借贷</a>
                    <div class="li-div">
                        <a href="${ctx}/user/p2pUserInformation/investmentPermission">我要投资</a>
                        <a href="${ctx}/user/p2pUserInformation/financingRule">我要融资</a>
                    </div>
                </li>
                <li>
                    <a href="${ctx}/rating/front/viewRatingRules">评级服务</a>
                </li>
                <li>
                    <a id="ydyl" href="###">一带一路</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a>
                </li>

                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
<%-- <div class="index-nva">
    <div class="pull-left">
        <a href="${pageContext.request.contextPath}${fns:getFrontPath()}"><img src="${ctxStatic}/dist/images/logo.png" alt="" ></a>
    </div>
    <ul class="pull-left">
        <li>
        	<a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a>
        </li>
        <li>
        	<a target="_blank" href="">一带一路</a>
        </li>
        <li>
            <a href="#">评级服务</a>
            <p class="a-p">
                <a href="${ctx}/rating/front/viewRatingRules">中小企业评级</a>
                <a class="a" href="javascript:;">大型企业评级</a>
                
            </p>
        </li>
        <li>
            <a href="#">投融资服务</a>
            <p class="a-p">
                <a href="${ctx}/user/p2pUserInformation/investmentPermission">我要投资</a>
                <a class="a" href="${ctx}/user/p2pUserInformation/financingRule">我要融资</a>
                
            </p>
        </li>
        <li>
        	<a href="${ctx}/cms/article/xinyongjiaoyu">信用建设</a>
            <p class="a-p">
                <a href="${ctx}/cms/article/xyjyjiangtang">信用教育讲堂</a>
                <a href="${ctx}/cms/link/xyjyshipin">信用教育视频</a>
                <a href="${ctx}/cms/article/xyjyhuodong">信用教育活动</a>
                <a href="${ctx}/cms/article/xinyongjlcx">信用记录查询</a>              
                
            </p>
        </li>
        <li>
        	<c:if test="${user.roleList[0].id == 102}">
        		<a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></li>
        	</c:if>
        	<c:if test="${user.roleList[0].id == 104}">
        		  <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        	</c:if>
        	<c:if test="${user.roleList[0].id == 101}">
        		<a href="${ctx}/user/Institution/ctrlMenu">我的账户</a></li>
        	</c:if>
        	<c:if test="${user.roleList[0].id == 105}">
        		<a href="${ctx}/user/AssetValuation/ctrlMenu">我的账户</a>
        	</c:if>
        	<c:if test="${user.roleList[0].id == 106}">
        		<a href="${ctx}/user/Guarantee/ctrlMenu">我的账户</a>
        	</c:if>
        <li>
            <a href="${ctx}/cms/article/companyProfile">关于我们</a>
            <p class="a-p">
                <a href="${ctx}/cms/article/companyProfile" >公司简介</a>
                <a href="${ctx}/cms/article/cydiaProfile">平台简介</a>
                <a href="${ctx}/cms/article/safetyGuarantee">安全保障</a>
                <a href="${ctx}/cms/article/contactUs">联系我们</a>
                <a href="${ctx}/cms/article/partner">合作伙伴</a>
                <a href="${ctx}/cms/article/operationData">运营数据</a>
            </p>
        </li>
        <div class="clearfix"></div>
    </ul>

</div> --%>
<script type="text/javascript">

    //进入一带一路信息搜索引擎项目
    //console.log(${empty user.id })
    var p = '${user.phone}';
    if (${empty user.id }) {
        $.ajax({
            type: "POST",
            url: "${ctx}/sys/user/returnIndex",
            dataType: 'json',
            success: function (d) {
                if (d.flag) {
                    $("#ydyl").attr("href", d.data);
                    $("#ydyl").attr("target", "_blank");
                }
            },
            error: function (d) {
                console.log(d)
            }
        });
    } else {
        $("#ydyl").click(function () {
            $.ajax({
                type: "POST",
                url: "${ctx}/sys/user/jumpWebsite",
                dataType: 'json',
                success: function (d) {
                    if (d.flag) {

                        //window.location.href=d.data;
                        window.open(d.data);
                    } else {
                        var txt = '<h5>请完成手机验证，以获得权限进入一带一路信息搜索引擎平台</h5><form id="trzForm" method="post"' +
                            'class="form-horizontal-trz" action="">' +
                            '<div class="form-group sjh"><div class="input-group">' +
                            '<div class="input-group-addon">' +
                            '<span style="color:#ff0000">*</span>手机号' +
                            '</div>' +
                            '<input style="height: 35px;width: 250px;border-radius: 4px;" class="form-control"' +
                            'type="text"  name="phone" disabled="true" value="' + p + '"></div></div>' +
                            '<div class="form-group"><div class="input-group">' +
                            '<div class="input-group-addon">' +
                            '<span style="color:#ff0000">*</span>手机验证码' +
                            '</div>' +
                            '<input style="height: 35px;width: 120px;border-radius: 4px;" class="form-control"' +
                            'type="text"  name="smsCode"><button type="button" id="hqyzm" class="hqyzm">获取验证码</button></div></div>' +
                            '<div id="load-data-trz" class=" form-group">' +
                            '<input type="checkbox" checked name="programs[]"><i style="color:#ff0000">*</i>我已阅读并同意<a href="javascript:openAgreement()" style="color:#0e4fba">《大公注册用户服务协议》</a>' +
                            '</div>' +
                            '<div class=" form-group">' +
                            '<div class="input-group">' +
                            '<div class="input-group-addon" style="width: 140px;color: #666666;padding-left: 26px">验证码</div>' +
                            '<input  id="input-trz" style="height: 35px;width: 120px;' +
                            'border-radius: 4px;" class="form-control" type="text" name="code">' +
                            '<img id="code-img-trz" style="display: inline-block;width: 100px;height: 34px;margin:6px 4px 0 10px" src="${pageContext.request.contextPath}/servlet/validateCodeServlet" class="mid validateCode">' +
                            '<a href="###" id="code-span-trz">' +
                            '<span>看不清？</span></a></div></div>' +
                            '<div id="login-ok-trz">' +
                            '<button href="javascript:;" type="submit" id="login-alert-trz" class="btn btn-primary"  >登 录</button>' +
                            '</div>' +
                            '<a href="javascript:;" id="tzlj">以游客身份直接跳转 >> </a>' +
                            '</form>';
                        var option = {
                            title: '正在进入一带一路信息搜索引擎'
                        }
                        window.wxc.xcConfirm(txt, option);
                        $(".xcConfirm").addClass("trz-xcConfirm");
                        $('.btnArea').css('display', 'none');
                        //验证码
                        $("#code-img-trz").click(function () {
                            $(this).attr('src', '${pageContext.request.contextPath}/servlet/validateCodeServlet?' + new Date().getTime())
                        })

                        $("#code-span-trz").click(function () {
                            $('#code-img-trz').attr('src', '${pageContext.request.contextPath}/servlet/validateCodeServlet?' + new Date().getTime())
                        })
                        //表单验证
                        $('#trzForm').bootstrapValidator({
                            message: 'This value is not valid',
                            feedbackIcons: {
                                valid: 'glyphicon glyphicon-ok',
                                invalid: 'glyphicon glyphicon-remove',
                                validating: 'glyphicon glyphicon-refresh'
                            },
                            fields: {
                                phone: {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        },
                                        regexp: {
                                            regexp: /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-3]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/,
                                            message: ' '
                                        }
                                    }
                                },
                                smsCode: {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        },
                                        stringLength: {
                                            max: 6,
                                            min: 6,
                                            message: ' '
                                        },
                                        regexp: {
                                            regexp: /^[A-Za-z0-9]+$/,
                                            message: ' '
                                        },
                                        remote: {
                                            url: '${ctx}/msg/msgSmsRecord/validSmsCode2',
                                            type: 'POST',
                                            message: ' '
                                        }
                                    }
                                },
                                'programs[]': {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        }
                                    }
                                },
                                code: {
                                    validators: {
                                        notEmpty: {
                                            message: ' '
                                        },
                                        threshold: 4,
                                        remote: {
                                            type: 'get',
                                            url: '${pageContext.request.contextPath}/servlet/validateCodeServlet',//验证验证码
                                            data: function () {
                                                return {
                                                    validateCode: $("#input-trz").val()
                                                }
                                            },
                                            message: ' ',
                                            delay: 500
                                        }
                                    }
                                }
                            }
                        }).on('success.form.bv', function (e) {
                            // 防止表单提交
                            e.preventDefault();
                            // 获取表单实例
                            var $form = $(e.target);
                            // 得到BootstrapValidator实例
                            var bv = $form.data('bootstrapValidator');
                            var phone = $("input[name=phone]").val();//用户名
                            var smsCode = $("input[name=smsCode]").val();//密码
                            var data = {
                                phone: phone,
                                smsCode: smsCode
                            };
                            $.ajax({
                                type: "POST",
                                url: "${ctx}/sys/user/signIn",
                                dataType: 'json',
                                data: data,
                                success: function (d) {
                                    if (d.flag) {
                                        //window.location.href=d.data;
                                        window.open(d.data);
                                        setTimeout(function () {
                                            window.location.reload()
                                        }, 100);
                                    }
                                },
                                error: function (d) {
                                    console.log(d)
                                }
                            });
                        });
                        $(".form-control-feedback").css({"top": 6})
                        //获取手机验证码
                        var setIntervalTrz;
                        $("#hqyzm").click(function () {
                            var mobile = $.trim($('input[name=phone]').val());
                            if (mobile) {
                                window.clearInterval(setIntervalTrz);
                                var _this = this;
                                var i = 60;
                                setIntervalTrz = setInterval(function () {
                                    i--;
                                    if (i <= 0) {
                                        $("#hqyzm").attr("disabled", false).html("重新获取");
                                        return;
                                    }
                                    $("#hqyzm").attr("disabled", true).html(i + "s重新获取");
                                }, 1000);
                                $.ajax({
                                    type: "POST",
                                    url: "${ctx}/msg/msgSmsRecord/sendRegSmsRestful",
                                    dataType: 'json',
                                    data: {smsPhone: mobile},
                                    success: function (d) {
                                        console.log(d)
                                    }
                                });
                            }
                        });
                        //登录
                        //以游客身份直接跳转 >>
                        $.ajax({
                            type: "POST",
                            url: "${ctx}/sys/user/returnIndex",
                            dataType: 'json',
                            success: function (d) {
                                if (d.flag) {
                                    $("#tzlj").attr("href", d.data);
                                    $("#tzlj").attr("target", "_blank");
                                    $("#tzlj").click(function () {
                                        window.location.reload()
                                    })
                                }
                            }
                        });

                    }
                }
            });
        });

    }

    function openAgreement() {
        window.open('${pageContext.request.contextPath}' + "/uploadFiles/default/registAgreement.pdf")
    }
</script>