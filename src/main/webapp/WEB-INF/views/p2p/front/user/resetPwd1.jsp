<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrapValidator.min.js"></script>
    <style>
        .czmm_box {
            width: 32%;
            margin: 0 auto;
        }

        .czmm_box {
            margin-top: 80px;
        }

        .czmm_box h3 {
            color: #be1c1a;
            text-align: center;
            margin: 22px 0 50px;
        }

        .input_box {
            margin-bottom: 25px;
            text-align: center;
            position: relative;
        }

        .input_box:last-of-type {
            margin: 72px 0 220px;
        }

        .input_box label {
            text-align: right;
            font-size: 18px;
            font-weight: normal;
            margin-right: 4%;
        }

        .form-control {
            display: inline-block;
            width: 70%;
        }

        #next {
            color: #ffffff;
            background: #f2434a;
            padding: 6px 20px;
        }

        .has-feedback label ~ .form-control-feedback {
            top: 0px;
            right: 5%;
        }

        .btn {
            font-size: 16px;
            border-radius: 8px;
        }

        .verificationCode {
            background: #c9c7c8;
            color: #ffffff;
            position: absolute;
            right: -110px;
            top: 0;
        }

        .bv-form .help-block {
            margin-bottom: 0;
            padding-left: 28%;
            text-align: left;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户设置页面-->
<div class="zh" style="border-bottom: 1px solid #d6d7dc;">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="#">首页</a></li>
        <li><a href="#">登录</a></li>
        <li class="lg-active">忘记密码</li>
    </ol>
</div>

<!--内容区域-->
<div class="zh-con rzsq_con">
    <div class="czmm_box">
        <form id="resetpwForm" class="" action="${ctx}/sys/user/preResetPwd2" method="post">
            <div class="input_box form-group">
                <label>&emsp;手机号码:</label>
                <input class="form-control" type="text" id="phone" name="phone">
            </div>
            <div class="input_box form-group">
                <label>手机验证码:</label>
                <input class="form-control" type="text" name="smsCode">
                <sapn class="verificationCode btn" style="background:#f2434a;margin-right:-30px" id="yzmNum"
                      onclick="sendSms()">发送验证码
                </sapn>
            </div>
            <div class="input_box">
                <button type="submit" class="btn" id="next">下一步</button>
            </div>
        </form>
    </div>
</div>
<!--账户总览内容区域结束-->

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    function sendSms() {
        var css = $('input[name="phone"]').next().attr('class');
        var arr = css.split(' ');
        var phone = $('#phone').val();
        if (arr[2] == 'glyphicon-ok') {
            $.ajax({
                type: 'POST',
                url: '${ctx}/msg/msgSmsRecord/sendRegSmsRestful2',
                data: {smsPhone: phone},
                success: function (data) {
                    data = eval("(" + data + ")");
                    if (data.status == 1) {
                        countDown();
                    } else {
                        alert(data.message);
                    }
                }
            });
        } else {
            alert('请输入正确的手机号码！');
        }
        //countDown();
    }
    var onoff = true;
    var num = 60;
    function countDown() {
        if (onoff) {
            onoff = false;
            timer = setInterval(function () {
                $("#yzmNum").addClass("disabled")
                $("#yzmNum").html('还剩' + num + '秒可获取');
                if (num < 0) {
                    clearInterval(timer);
                    $("#yzmNum").html('获取验证码');
                    $("#yzmNum").removeClass("disabled")
                    num = 11;
                    onoff = true;
                }
                num--;
            }, 1000)
        }
    }
</script>
<script>
    $(function () {
        $('#resetpwForm').bootstrapValidator({
            message: "您的输入值不合法",
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                //手机号码
                phone: {
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空'
                        },
                        regexp: {
                            regexp: /^1[3|5|8|7]{1}[0-9]{9}$/,
                            message: '请输入正确的手机号码'
                        },
                        remote: {
                            url: '${ctx}/sys/user/isPhoneExist',
                            message: '手机号不存在'
                        },
                    }
                },
                smsCode: {
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        },
                        remote: {
                            url: '${ctx}/msg/msgSmsRecord/validSmsCode2',
                            type: 'POST',
                            message: '验证码不正确'
                        }
                    }
                }
            }
        });
    })

</script>
</body>
</html>