<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>

    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <style>
        .input-group {
            width: 90%;
        }

        .form-group span {
            font-size: 18px;
            color: #909090;
            width: 22%;
            text-align: right;
        }

        .form-group .btn-default {
            margin-left: 0;
        }

        .kv-fileinput-upload {
            height: 34px;
            width: 49%;
            margin-bottom: 5px;
        }

        .fileinput-remove {
            height: 34px;
            width: 49%;
            margin-bottom: 5px;
        }

        .btn-primary {
            background-color: #fff;
            border-color: #ccc;
            color: #555;
            width: 100%;
        }

        .form-horizontal .has-feedback .form-control-feedback {
            right: 15px;
        }

        .btn-primary:hover {
            background-color: #909090;
            border-color: #909090;
            color: #fff;
        }

        .btn-primary:focus {
            background-color: #909090;
            border-color: #909090;
            color: #fff;
        }

        .btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:active:hover, .open > .dropdown-toggle.btn-primary.focus, .open > .dropdown-toggle.btn-primary:focus, .open > .dropdown-toggle.btn-primary:hover {
            background-color: #909090;
            border-color: #909090;
            color: #fff;
        }

        .file-thumbnail-footer {
            display: none;
        }

        .form-horizontal {
            margin-left: 15%;
            margin-top: 50px;
            width: 99%
        }

        .btn-info {
            margin-left: 20px
        }

        .btn-default {
            margin-left: 0;
            width: 100%;
        }

        .btn-default[type='submit'] {
            display: none;
        }

        .file {
            margin-top: 10px;
        }

        .file-caption-name, .file-preview-other, .file-other-error, .file-preview-frame {
            width: 220px;
        }

        .file-thumbnail-footer {
            display: block;
        }

        .file-error-message {
            word-wrap: break-word;
            word-break: break-all;
        }

        body a {
            color: #909090
        }

        /* 面包屑导航样式  */
        .breadcrumb > li + li:before {
            padding: 0px;
            color: #ccc;
            content: "";
        }

        .breadcrumb > li + li:after {
            padding: 0 2px;
            color: #ccc;
            content: ">";
        }

        .breadcrumb > li:last-of-type:after {
            padding: 0px;
            color: #ccc;
            content: "";
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">身份认证</li>
    </ol>
</div>
<div class="renzheng-index">
    <!-- renzheng开始 -->
    <div class="pull-left" style="margin-left:8%; text-align: center;">
        <h3 style="color: #b81c1d">第一步:身份认证</h3>
        <div class="icn_lis active_bgred bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3>第二步:绑定银行卡</h3>
        <div class="icn_lis  bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3>第三步:风险评测</h3>
        <div class="icn_lis  bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3>第四步：成为会员</h3>
        <div class="icn_lis  bg">
            <span class="bg"></span>
        </div>
    </div>
    <div class="clearfix"></div>
    <!-- renzheng结束 -->
    <div class="renzheng-form pull-left">
        <form enctype="multipart/form-data" id="defaultForm" method="post" class="form-horizontal"
              action="${ctx}/user/idCardCertify/certifyForm">
            <div class="form-group">
                <span class="pull-left">姓名<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input type="text" class="form-control" name="realName"/>
                </div>
            </div>
            <div class="form-group">
                <span class="pull-left">我的身份证号<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input type="text" class="form-control" name="idNumber"/>
                </div>
            </div>

            <img src="${ctxStatic}/dist/images/renzheng_banner_03.png" style="margin-top:-120px" class="pull-right"
                 alt="">
            <div class="form-group">
                <span class="pull-left" style="margin-top: 12px">手持身份证照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left ">
                    <input class="file pull-left gyh_inp" type="file" name="file">
                    <div class="gyh" style="display: none; color: #f1318e">
                        您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                    </div>
                </div>
            </div>
            <div class="form-group">
                <span class="pull-left" style="margin-top: 12px">身份证正面照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input class="file pull-left gyh_inp" type="file" name="file">
                    <div class="gyh" style="display: none; color: #f1318e">
                        您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                    </div>
                </div>
            </div>
            <div class="form-group">
                <span class="pull-left" style="margin-top: 12px">身份证背面照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input class="file pull-left gyh_inp" type="file" name="file">
                    <div class="gyh" style="display: none; color: #f1318e">
                        您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                    </div>
                </div>
            </div>
            <!-- 信息提示字段 -->
            <div class="form-group">
                <div style="margin-left: 24%;">
                    <span style="color: #bf1a20;">1 身份证照片、手持身份证照片需清晰<br/>真实有效文件大小不超过5M</span><br>
                    <span style="color: #bf1a20;">2 支持.jpg .gif .jpeg .png .bmp的图片格式</span>
                </div>
            </div>
            <div class="form-group" id="yzm">
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
            </div>
            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; width: 95%;">
                    <button type="submit" class="btn btn-primary" style="width:auto;" name="signup" value="Sign up">提交
                    </button>
                    <button type="button" class="btn btn-info" id="resetBtn" onclick="abc()">取消</button>
                </div>
            </div>
        </form>
    </div>
    <div class="clearfix"></div>

</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    function abc() {
        window.location.href = '${frontPath}';
    }
</script>
<script type="text/javascript">
    $("input[type='file']").fileinput({
        'allowedFileExtensions': ['jpg', 'png', 'gif', 'jpeg', 'bmp'],
        showCaption: false,
        showUpload: false,
        maxFileSize: 5000,
    });


    /*验证上传*/
    $(".fileinput-remove").on("click", function () {
        $(this).parents(".has-feedback").removeClass("has-success").addClass("has-error");
        $(this).parents(".file-input").find(".file").next().removeClass("glyphicon-ok").addClass("glyphicon-remove");
        $(this).parents(".file-input").next().show();
        $("#validateBtn").attr("disabled", "disabled");
    })
    $(".form-group").append("<div class='clearfix'></div>");


    $(document).ready(function () {
        // Generate a simple captcha
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

        $('#defaultForm').bootstrapValidator({
            //        live: 'disabled',
            message: '输入无效的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                realName: {
                    message: '姓名是无效的',
                    validators: {
                        notEmpty: {
                            message: '请输入您的姓名'
                        },
                        stringLength: {
                            min: 2,
                            max: 5,
                            message: '用户名必须大于或等于2,小于或等于5个字符'
                        },
                        regexp: {
                            regexp: /^[\u4E00-\u9FA5]{2,5}$/,
                            message: '姓名输入有误，请重新输入  '
                        }
                    }
                },
                idNumber: {
                    message: '身份证号是无效的',
                    validators: {
                        notEmpty: {
                            message: '身份证号不能为空'
                        },
                        remote: {
                            url: '${ctx}/user/p2pRegUserCertify/checkIdNumber',
                            message: '请输入正确的身份证号，目前暂不支持台港澳人士认证'
                        }
                    }
                },
                file: {
                    message: '请上传附件',
                    validators: {
                        notEmpty: {
                            message: '请上传附件'
                        },
                    }
                },
                validateCode: {
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        },
                        remote: {
                            url: '${pageContext.request.contextPath}/servlet/validateCodeServlet',
                            type: 'GET',
                            message: '验证码不正确'
                        }
                    }
                },
            }
        });

        // Validate the form manually
        $('#validateBtn').click(function () {
            //校验港澳人士身份证
            //^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)
            var idNumber = $("#idNumber").val();
            if (!/^[A-KM-QT-XZ]{1}[0-9]{9}$/.test(idNumber)) {
                alert("目前不支持港澳人士的身份证");
            }
            $('#defaultForm').bootstrapValidator('validate');
        });

        $('#resetBtn').click(function () {
            $('#defaultForm').data('bootstrapValidator').resetForm(true);
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $(".file").parent(".btn-file").css("width", "100%");
        $(".file").parent(".btn-file").css("margin-top", "10px");
        $(".file").parent(".btn-file").find("i").eq(1).css("left", "85%");

        $(".close").click(function () {
            $(".file").parent(".btn-file").find("i").eq(1).css("left", "85%");
        })
        $(".fileinput-remove-button").click(function () {
            $(".file").parent(".btn-file").find("i").eq(1).css("left", "85%");
        })

        /* 改动内容 */
        var explorer = window.navigator.userAgent.toLowerCase();
        var ver = explorer.match(/msie ([\d.]+)/)[1];
        $(document).ready(function () {
            if (explorer.indexOf("msie") >= -1) {
                if (ver === '9.0' || ver === '8.0' || ver === '7.0' || ver === '6.0') {
                    $('.gyh').css('display', 'block');
                    $('.gyh_inp').attr('disabled', 'disabled');
                    $('.gyh_inp').css({
                        'background': '#ccc',
                        'cursor': 'no-drop'
                    });
                }
            }
        });
    })
</script>
<script language="javascript" type="text/javascript">
    var code; //在全局 定义验证码
    createCode();
    function createCode() {
        code = "";
        var codeLength = 4;//验证码的长度
        var checkCode = document.getElementById("checkCode");
        var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//所有候选组成验证码的字符，当然也可以用中文的

        for (var i = 0; i < codeLength; i++) {
            var charIndex = Math.floor(Math.random() * 36);
            code += selectChar[charIndex];
        }
        if (checkCode) {
            checkCode.value = code;
        }

    }

    function validate() {

        var inputCode = document.getElementById("input1").value;
        var errors = document.getElementById("errors");
        var yzm = document.getElementById("yzm");
        if (inputCode.length <= 0) {
            errors.innerHTML = "请输入验证码";
            errors.style.color = "#a94442";
            //yzm.setAttribute("class", "has-error");

        }
        else if (inputCode != code) {
            errors.innerHTML = "验证码输入错误！";
            errors.style.color = "#a94442";
            //createCode();//刷新验证码
        }
        else {
            errors.innerHTML = "OK~！";
            errors.style.color = "#a94442";
        }

    }

</script>
</html>