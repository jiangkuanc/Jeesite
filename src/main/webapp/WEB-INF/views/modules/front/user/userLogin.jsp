<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <style>
        .login-con p:first-child {
            margin-bottom: 10px;
        }

        #messageBox {
            width: 250px;
            margin-left: 120px;
            height: 34px;
            line-height: 4px;
            color: #C3181E;
            text-align: center;
            font-family: '微软雅黑';
            margin-bottom: 10px;
            display: none;
        }

        #messageBox .error {
            font-weight: normal;
        }

        .close {
            line-height: 0.1;
        }

        .form-horizontal .form-group {
            margin-bottom: 15px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //拦截个人用户登录 start
            var geRen = '${geRenMsg}';
            if (geRen != null && geRen != "") {
                var txt = '<div class="bigIcon" style="background-position: 0px -96px;margin-top: 4px;"></div>' +
                    '<div >因系统升级维护，个人账户功能暂停使用，</div>' +
                    '<div >给你带来的不便敬请谅解</div>';
                //window.wxc.xcConfirm(geRen, window.wxc.xcConfirm.typeEnum.warning);
                window.wxc.xcConfirm(txt);
                $(".xcConfirm").addClass("xcConfirm-jg");
                $(".xcConfirm-jg .popBox").css({width: '500px'});
                $(".xcConfirm-jg .popBox .clsBtn").hide();
                $(".xcConfirm-jg .popBox .ttBox").css({height: '46px', border: 0});
                $(".xcConfirm-jg .popBox .txtBox").css({margin: '40px 78px'});
                $(".xcConfirm-jg .popBox .btnArea").css({border: 0}).find('.sgBtn.ok').css({margin: '0 200px 0 0'})
            }
            //拦截个人用户登录 end
            var msg = '${loginMsg}';
            if (msg != null && msg != '') {
                $('#messageBox').show();
                $('#empty').hide();
            } else {
                $('#messageBox').hide();
                $('#empty').show();
            }
        });

        function change() {
            $('#messageBox').hide();
            $('#empty').show();
        }
    </script>
</head>

<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--登录页面banner-->
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active">登录</li>
    </ol>
</div>
<div class="login-banner" style="height: 100%">
    <div class="img subling" style="width:100%;overflow:hidden;">
        <img src="${ctxStatic}/dist/images/login1920.jpg" alt="">
    </div>

    <!--登录信息表-->
    <div class="login-con">
        <p>用户登录</p>
        <div class="alert alert-error " id="messageBox">
            <button class="close" data-dismiss="alert" onclick="change()">×</button>
            <label class="error" id="loginError">${loginMsg}</label>
        </div>
        <div id="empty" style="height:44px;"></div>
        <form id="defaultForm" method="post" class="form-horizontal" action="${ctx}/sys/user/userLogin">
            <div class="form-group">
                <label for="login-input1" class="col-sm-3 control-label">用户名：</label>
                <div class="col-sm-5 inp">
                    <input type="text" class="form-control" id="login-input1" name="loginName"
                           placeholder="请输入用户名/手机号"/>
                </div>
                <!-- <div class="col-sm-3 span">
                    <span><a href="javascript:;" tabindex="-1">忘记用户名</a></span>
                </div> -->
                <div class=" col-sm-offset-3 col-sm-8 span1">
                    <span>*请输入用户名/手机号</span>
                </div>
                <div class=" col-sm-offset-3 col-sm-8 span3" style="display: none;">
                    <span style="color: #c3181e">*请输入正确的用户名</span>
                </div>
            </div>
            <div class="form-group">
                <label for="login-input2" class="col-sm-3 control-label">登录密码：</label>
                <div class="col-sm-5 inp">
                    <input type="password" class="form-control" id="login-input2" name="password"
                           placeholder="请输入登录密码"/>
                </div>
                <div class="col-sm-3 span">
                    <span><a href="${ctx}/sys/user/preResetPwd" tabindex="-1">忘记密码</a></span>
                </div>
                <div class=" col-sm-offset-3 col-sm-8 span2">
                    <span>*请输登录密码</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label"></label>
                <div class="col-lg-5">
                    <div class="checkbox">
                        <label><input type="checkbox" name="rememberMe" value="1" style="margin-top: 10px"/><span
                                style="color: black">记住我</span>
                        </label>
                    </div>
                </div>
            </div>


            <div class="form-group" style=" text-align: center;">
                <div class="col-sm-offset-2 col-sm-4">
                    <button type="submit" class="btn log">登录</button>
                </div>
                <div class="col-sm-4 zc">
                    <span><a href="${ctx}/sys/user/preUserRegister">注册新用户</a></span>
                </div>
            </div>
        </form>

        <p>
            <a href="http://glfxpt.silkroaditfin.com/sjsjpt" target="_blank">审计师登录 &nbsp; &nbsp; &nbsp;</a>
            <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">返回首页</a>
        </p>
    </div>
</div>
<!--登录页banner结束-->

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


<script>
    $(function () {
        //用户名
        $("#login-input1").blur(function () {
            if ($("#login-input1").val() == "") {
                $(".span1").show();
                return;
            }
            if ($("#login-input1").val().length < 4 || $("#login-input1").val().length > 16) {
                $(".span3").show();
            }
        }).focus(function () {
            if ($("#login-input1").length != 0) {
                $(".span1").hide();
                $(".span3").hide();
            }
        });

        //密码
        $("#login-input2").blur(function () {
            if ($("#login-input2").val() == "") {
                $(".span2").show();
            }
        }).focus(function () {
            if ($("#login-input2").length != 0) {
                $(".span2").hide();
            }
        });

        if ($("#login-input1").val() == "" || $("#login-input2").val() == "" || $(".rem").eq(0).attr("checked", false)) {
            return false
        }
        else {
            $("#form").submit();
        }
    })
</script>
</body>
</html>
