<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>


<link rel="stylesheet" href="${ctxStatic}/index0623/dist/css/style.css">
<link rel="stylesheet" href="${ctxStatic}/index0623/src/liMarquee/css/liMarquee.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/dist/css/bootstrapValidator.min.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/xcConfirm/css/xcConfirm.css">
<style type="text/css">

    /* 进入进入一带一路信息搜索引擎 css */
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
<div class="header">
    <div class="container">
        <!--顶部-->
        <div>
            <!--左侧-->
            <div class="top-left pull-left">
                <img src="${ctxStatic}/index0623/dist/img/kefu.png" alt=""/>
                <span>客服电话：4008-84-4008&nbsp;&nbsp;&nbsp;010-83032098 </span>
            </div>
            <!--右侧-->
            <div class="top-right pull-right">
                <c:choose>
                    <c:when test="${empty user.id }">
                        <a href="${ctx}/sys/user/preUserLogin">登录</a>
                        <a href="${ctx}/sys/user/preUserRegister">免费注册</a>
                    </c:when>
                    <c:otherwise>
                        <span>欢迎您，<a href="javascript:;" onclick="accountCentral()">${user.loginName }</a></span>


                        <input type="hidden" value="" id="letterID"/>
                        <c:if test="${user.roleList[0].id == 102}">
                            <span>我的消息<a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">(<span
                                    id="number1">0</span>)</a></span>
                        </c:if>
                        <c:if test="${user.roleList[0].id == 101}">
                            <span>我的消息<a href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter">(<span
                                    id="number2">0</span>)</a></span>
                        </c:if>
                        <c:if test="${user.roleList[0].id == 104}">
                            <span>我的消息<a href="${ctx}/msg/msgLetterRecord/getMsgList?mode=message">(<span
                                    id="number3">0</span>)</a></span>
                        </c:if>


                        <a href="${ctx}/sys/user/userLogout">退出</a>
                    </c:otherwise>
                </c:choose>
                <a href="${ctx}/image/linkMobile"><img src="${ctxStatic}/index0623/dist/img/iphone-top.png" alt=""/>手机客户端</a>
                <a href="${ctx}/cms/article/helpCenter"><img src="${ctxStatic}/index0623/dist/img/xinshou.png" alt=""/>新手帮助</a>
                <a href="${ctx}/cms/article/disclaimer">免责声明</a>
                <a href="http://www.silkroaditfin.com/fwpt_en/en/f">English</a>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>


<!--导航条-->
<div class="navbars">
    <div class="container ">
        <!--左侧-->
        <div class="nav-left pull-left">
            <a class="navbarLogo" href="${pageContext.request.contextPath}${fns:getFrontPath()}">
                <img src="${ctxStatic}/index0623/dist/img/logo.png" alt="丝路互金网" style=""/>
            </a>
        </div>

        <!--右侧-->
        <div class="nav-right pull-right">
            <ul class="nav-ul">
                <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
                <%--  <li class="active"><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li> --%>
                <li><a href="${ctx}/user/p2pUserInformation/investmentPermission">投资专区</a></li>
                <li><a href="${ctx}/user/p2pUserInformation/financingRule">企业融资</a></li>
                <li><a href="${ctx}/rating/front/viewRatingRules">评级服务</a></li>
                <li><a href="###" id="ydyl">一带一路</a></li>
                <li><a href="${ctx}/cms/article/xinyongjiaoyu">信用教育</a></li>
                <li><a href="${ctx}/cms/article/xinyongjlcx">信用记录</a></li>
                <!-- 	        <li><a href="" target="_blank">信用记录</a></li> -->
                <li><a href="${ctx}/cms/article/cydiaProfile">走进丝路互金网</a></li>
            </ul>
            <c:if test="${ not empty user.id }">
                <div id="dropdown-type" class="dropdown">
                    <div class="btn-group">
                        <img src="${ctxStatic}/index0623/dist/img/user.png" class="pull-left"/>
                        <a class="dropdown-toggle btns" type="button" id="dropdownMenu-type" data-toggle="dropdown">
                            <!--选中option之后，要在这里显示选中值，类似原始select里面的文本框-->
                            <span class="placeholder">我的账户</span>
                            <input style="display:none" name="payInterestWay"/>
                            <span class="carets"> <img src="${ctxStatic}/index0623/dist/img/caret.png" alt=""/></span>
                        </a>
                        <!-- <ul class="dropdown-menu meues" role="menu" aria-labelledby="dropdownMenu-type">
                          <li role="presentation" value="0"><a role="menuitem" tabindex="0" href="javascript:void(0);">我的账户</a></li>
                          <li role="presentation" value="1"><a role="menuitem" tabindex="1" href="javascript:void(0);">11</a></li>
                          <li role="presentation" value="2"><a role="menuitem" tabindex="2" href="javascript:void(0);">22</a></li>
                          <li role="presentation" value="3"><a role="menuitem" tabindex="3" href="javascript:void(0);">33</a></li>
                        </ul> -->
                    </div>
                </div>
            </c:if>
            <div class="clearfix"></div>
        </div>

    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/xcConfirm/js/xcConfirm.js"></script>
<script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
    var p = '${user.phone}';
    if (${empty user.id }) {
        $.ajax({
            type: "POST",
            url: "${ctx}/sys/user/returnIndex",
            dataType: 'json',
            success: function (d) {
                if (d.flag) {
                    $("#ydyl").attr("href", d.data);
                    //$("#ydyl").attr("target", "_blank");
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
                        window.location.href = d.data;
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
                        $("#trzForm").bootstrapValidator({
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
                                    //  $("#tzlj").attr("target", "_blank");
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
    $("#dropdown-type").click(function () {
        accountCentral();
    });

    /**
     * 显示未读消息
     */

    var updater = {
        poll: function () {
            var user = {'userId': '${user.id}'};
            //根据用户ID查询用户站内信并返回站内信数据
            $.ajax({
                //url: '${ctx}/msg/msg/sendLetter',
                url: '${ctx}/msg/msgLetterRecord/unReadMsgNum',
                data: user,
                type: 'POST',
                dataType: 'json',
                async: true,
                success: updater.onSuccess,
                error: updater.onError
            });
        },
        onSuccess: function (data, dataStatus) {
            try {
                //情况一：没有登录情况下，不触发此方法。
                //情况二：登录了，返回值为0
                //情况三：登录了，返回值不为0
                //data = Json.eval(data);
                var unRead = data.unRead;
                if (unRead == '0') {
                    return;
                }
                if (unRead != '0') {
                    //根据角色分配未读数
                    if (${user.roleList[0].id == 102}) {
                        $('#number1').text(unRead);
                    }
                    if (${user.roleList[0].id == 101}) {
                        $('#number2').text(unRead);
                    }
                    if (${user.roleList[0].id == 104}) {
                        $('#number3').text(unRead);
                    }

                }

            } catch (e) {
                updater.onError();
                return;
            }
            //没必要实时传递吧？
            //interval = window.setTimeout(updater.poll, 5000);
        },
        onError: function () {
            console.log("Poll error;");
        }
    };
    if (${not empty user.id }) {
        //alert("用户ID存在");
        updater.poll();
    }
</script>