<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <%-- <link rel="stylesheet" href="${ctxStatic}/dist/css/regist.css"> --%>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.min.css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.min.js"></script>
    <style>
        .form-horizontal .has-feedback .form-control-feedback {
            right: 15px;
            top: 0px;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--我要融资内容区域-->
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页 </a></li>
        <li class="lg-active">注册</li>
    </ol>
</div>
<div class="container">
    <div class="row">
        <!-- form: -->
        <section>
            <div class="col-lg-8 col-lg-offset-2">
                <div class="page-header">
                    <h3 style="color: #bf1a20;text-align: center;">我要注册</h3>
                </div>

                <form id="defaultForm" method="post" class="form-horizontal" action="${ctx}/sys/user/userRegister">
                    <input name="token" type="hidden" value="${token }">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">主体类型<b style="color:#C1181D;font-size:16px;">*</b></label>
                        <div class="col-lg-2">
                            <label style="margin-left: 10px;color:#929292;word-break:keep-all;white-space:nowrap;margin-top: 8px">
                                <span style="margin-left: 20px"><input type="radio" name="userBodyType" value="1"
                                                                       checked="checked">融资企业</span>
                                <span style="margin-left: 80px"><input type="radio" name="userBodyType"
                                                                       value="2">投资个人</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">用户名<b style="color:#C1181D;font-size:16px;">*</b></label>
                        <div class="col-lg-5">
                            <input id="loginName" type="text" class="form-control" name="loginName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">密码<b style="color:#C1181D;font-size:16px;">*</b></label>
                        <div class="col-lg-5">
                            <input id="password" type="password" class="form-control" name="password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">确认密码<b style="color:#C1181D;font-size:16px;">*</b></label>
                        <div class="col-lg-5">
                            <input id="confirmPassword" type="password" class="form-control" name="confirmPassword"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">手机号<b style="color:#C1181D;font-size:16px;">*</b></label>
                        <div class="col-lg-5">
                            <input id="phone" type="text" class="form-control" name="phone"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">手机验证码<b
                                style="color:#C1181D;font-size:16px;">*</b></label>
                        <div class="col-lg-2">
                            <input id="smsCode" type="text" class="form-control" name="smsCode" style="width: 110%"/>
                        </div>
                        <div class="col-lg-3">
                            <input type="button" id="yzmNum" onclick="sendSms()" class="btn btn-info" value="获取验证码"
                                   style="background-color: #bf1a20;border-color:#bf1a20;width:124px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label"></label>
                        <div class="col-lg-6">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="languages[]" value="english"/>我已阅读并同意《<a
                                        style="color: #2f84d7" href="javascript:openAgreement()">大公注册用户服务协议</a>》
                                    <b style="color:#C1181D;font-size:16px;">*</b></label>
                            </div>
                        </div>
                    </div>
                    <!-- 验证码 -->
                    <div class="form-group">
                        <label class="col-lg-3 control-label" for="validateCode">验证码</label>
                        <div class="col-lg-5">

                            <input type="text" id="validateCode" name="validateCode" maxlength="4"
                                   class="txt required form-control" style="padding: 6px 12px;width:70px;"/>
                            <div style="position: absolute; left:100px;top:5px">
                                <img src="${pageContext.request.contextPath}/servlet/validateCodeServlet"
                                     onclick="$('.validateCodeRefresh').click();" class="mid validateCode"/>
                                <a href="javascript:"
                                   onclick="$('.validateCode').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());"
                                   class="mid validateCodeRefresh" style="">看不清</a>
                            </div>
                        </div>
                    </div>
                    <!-- 验证码结束 -->
                    <div class="form-group" style=" text-align: center;">
                        <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; width: 780px;">
                            <button type="submit" class="btn btn-primary" name="signup" value="Sign up">注册</button>
                            <button type="button" class="btn btn-info" onclick="resetBtn()">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- :form -->
    </div>
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    function sendSms() {
        var css = $('input[name="phone"]').next().attr('class');
        var arr = css.split(' ');
        var phone = $('#phone').val();
        if (arr[2] == 'glyphicon-ok') {
            $.ajax({
                type: 'POST',
                url: '${ctx}/msg/msgSmsRecord/sendRegSmsRestful',
                data: {'smsPhone': phone},
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
            return;
        }
    }
    var onoff = true;
    var num = 60;
    function countDown() {
        if (onoff) {
            onoff = false;
            timer = setInterval(function () {
                $("#yzmNum").addClass("disabled");
                $("#yzmNum").attr("disabled", true);
                $("#yzmNum").val('还剩' + num + '秒可获取');
                if (num < 0) {
                    clearInterval(timer);
                    $("#yzmNum").val('获取验证码');
                    $("#yzmNum").removeClass("disabled");
                    $("#yzmNum").removeAttr("disabled");
                    num = 11;
                    onoff = true;
                }
                num--;
            }, 1000)
        }
        $('#phone').attr('readonly', true);
        $('#phone').css('cursor', 'pointer')
    }
    function resetBtn() {
        $('#smsCode').val('');
        $('#phone').val('');
        $('#loginName').val('');
        $('#password').val('');
        $('#confirmPassword').val('');
        $('#validateCode').val('');
        $('#phone').removeAttr("readOnly");
        $('.glyphicon-ok').each(function () {
            $(this).removeClass('glyphicon-ok');
            $(this).addClass('glyphicon-remove');
            $(this).parent().parent().addClass('has-error');
        });
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        // Generate a simple captcha
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

        $('#defaultForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {
                            message: 'The first name is required and cannot be empty'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {
                            message: 'The last name is required and cannot be empty'
                        }
                    }
                },
                loginName: {
                    message: '用户名是无效的',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 4,
                            max: 16,
                            message: '用户名只能为4-16个字符'
                        },
                        regexp: {
                            regexp: /^[A-Za-z0-9_]+$/,
                            message: '用户名只能由英文、数字、点和下划线组成'
                        },
                        remote: {
                            url: '${ctx}/sys/user/getByLoginName',
                            message: '用户名已被注册'
                        },
                        different: {
                            field: 'password',
                            message: '用户名和密码不能相同'
                        }
                    }
                },
                email: {
                    validators: {
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: /^1(3|4|5|7|8)\d{9}$/,
                            message: '请输入一个有效的手机号'
                        },
                        remote: {
                            url: '${ctx}/sys/user/getByPhone',
                            message: '手机号已被注册'
                        },
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 8,
                            max: 20,
                            message: '密码不能少于8个字符，不得大于20个字符'
                        },
                        regexp: {
                            regexp: /(?=.*[\d]+)(?=.*[a-zA-Z]+)(?=.*[^a-zA-Z0-9]+)/,
                            message: '*必须由英文、数字、符号组成'
                        },
                        different: {
                            field: 'loginName',
                            message: '密码不能与用户名相同'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'password',
                            message: '密码和确认密码不一样'
                        },
                        different: {
                            field: 'loginName',
                            message: '密码不能与用户名相同'
                        }
                    }
                },
                smsCode: {
                    validators: {
                        notEmpty: {
                            message: '手机验证码不能为空'
                        },
                        stringLength: {
                            max: 6,
                            min: 6,
                            message: '手机验证码为6个字符'
                        },
                        regexp: {
                            regexp: /^[A-Za-z0-9]+$/,
                            message: '手机验证码格式错误'
                        },
                        remote: {
                            url: '${ctx}/msg/msgSmsRecord/validSmsCode2',
                            type: 'POST',
                            message: '验证码不正确'
                        }
                    }
                },
                validateCode: {
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        },
                        stringLength: {
                            max: 4,
                            min: 4,
                            message: '验证码为4个字符'
                        },
                        remote: {
                            url: '${pageContext.request.contextPath}/servlet/validateCodeServlet',
                            type: 'GET',
                            message: '验证码不正确'
                        }
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {
                            message: '同意服务协议才能进行注册'
                        }
                    }
                },
                captcha: {
                    validators: {
                        callback: {
                            message: '答案错误',
                            callback: function (value, validator) {
                                var items = $('#captchaOperation').html().split(' '),
                                    sum = parseInt(items[0]) + parseInt(items[2]);
                                return value == sum;
                            }
                        }
                    }
                }
            }
        });

        // Validate the form manually
        $('#validateBtn').click(function () {
            $('#defaultForm').bootstrapValidator('validate');
        });

        $('#resetBtn').click(function () {
            $('#defaultForm').data('bootstrapValidator').resetForm(true);
        });
    });
    function openAgreement() {
        window.open('${pageContext.request.contextPath}' + "/uploadFiles/default/registAgreement.pdf")
    }
</script>
</body>
</html>