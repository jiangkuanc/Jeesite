<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctxStatic}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

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
            width: 320px;
        }

        .file-thumbnail-footer {
            display: block;
        }

        .file-error-message {
            word-wrap: break-word;
            word-break: break-all;
        }

    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页 </a></li>
        <li><a href="${ctx}/user/p2pUserInformation/accountPermission">我的账户</a></li>
        <li class="lg-active">投资前准备</li>
    </ol>
</div>
<div class="zh-con">
    <!--左侧内容区域-->
    <!--左侧内容区域结束-->
    <div class="zh-con">
        <div class="zh-left pull-left">
            <p class="zh-p" style="background: #eaeaea;">
                <a href="${ctx}/user/myAccountinformation/allInformation">账户总览</a>
            </p>
            <ul class="zhzl" id="leftMenu">
                <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                    <p class="zhtext "><a href="javascript:void(0);">我的投资</a></p>
                    <ul class="zhzllevel2">
                        <li><a href="${ctx}/user/p2pUserInformation/overview">投资总览</a></li>
                        <li><a href="${ctx}/user/p2pUserInformation/income">投资收益</a></li>
                        <li><a href="${ctx}/user/p2pUserInformation/record">投资记录</a></li>
                    </ul>
                </li>
                <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                    <p class="zhtext "><a href="javascript:void(0);">资金记录</a></p>
                    <ul class="zhzllevel2">
                        <li><a href="${ctx}/user/p2pUserInformation/spendRecord">费用记录</a></li>
                        <li><a href="${ctx}/user/p2pUserInformation/chargeRecord">充值记录</a></li>
                        <li><a href="${ctx}/user/p2pUserInformation/cashRecord">提现记录</a></li>
                    </ul>
                </li>
                <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
                    <p class="zhtext "><a href="javascript:void(0);">账户管理</a></p>
                    <ul class="zhzllevel2 zhgl">
                        <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bindingPhone">绑定手机号</a>
                        </li>
                        <li>
                            <a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=p2pRegUserCertify">身份认证</a>
                        </li>
                        <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=bankMsg">管理银行卡</a></li>
                        <li>
                            <a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=riskEvaluation">风险测评</a>
                        </li>
                        <li>
                            <a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=passwordModify">密码管理</a>
                        </li>
                        <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">举报管理</a>
                        </li>
                        <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=msgCenter">消息中心<span
                                class="badge" style="margin-left:2px;background-color:red;color:white;">4</span></a>
                        </li>
                    </ul>
                </li>

                <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
                    <p class="zhtext "><a href="javascript:void(0);">交易助手</a></p>
                    <ul class="zhzllevel2">
                        <li><a href="${ctx}/user/p2pUserInformation/accountPermissionPerson?mode=accountSet">计算器</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--左侧内容区域结束-->

        <div class="renzheng-form pull-left">
            <form enctype="multipart/form-data" id="defaultForm" method="post" class="form-horizontal"
                  action="${ctx}/user/p2pRegUserCertifyPerson/userCertify">
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
                    <span class="pull-left" style="margin-top: 12px">手持身份证照片<b
                            style="color:#C1181D;font-size:16px;">*</b>:</span>
                    <div class="col-lg-5 pull-left">
                        <input class="file pull-left" type="file" name="file">
                    </div>
                </div>
                <div class="form-group">
                    <span class="pull-left" style="margin-top: 12px">身份证正面照片<b
                            style="color:#C1181D;font-size:16px;">*</b>:</span>
                    <div class="col-lg-5 pull-left">
                        <input class="file pull-left" type="file" name="file">
                    </div>
                </div>
                <div class="form-group">
                    <span class="pull-left" style="margin-top: 12px">身份证背面照片<b
                            style="color:#C1181D;font-size:16px;">*</b>:</span>
                    <div class="col-lg-5 pull-left">
                        <input class="file pull-left" type="file" name="file">
                    </div>
                </div>
                <div style="margin-left: 25%;">
                    <span style="color: #bf1a20;">&nbsp;1 身份证照片、手持身份证照片及企业委托书扫描件需清晰真实有效，文件大小不超过5M</span><br>
                    <span style="color: #bf1a20;">&nbsp;2 支持.jpg .jpeg .png .bmp .gif的图片格式</span>
                </div>


                <div class="form-group" style=" text-align: center;">
                    <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; width: 95%;">
                        <button type="submit" class="btn btn-primary" style="width:auto;" name="signup" value="Sign up">
                            提交
                        </button>
                        <button type="button" class="btn btn-info" id="resetBtn" onclick="abc()">取消</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="clearfix"></div>
        <!-- 引入footer页脚文件 -->
        <%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    //调用中金接口

</script>
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
    $(".form-group").append("<div class='clearfix'></div>");

    $(document).ready(function () {
        // Generate a simple captcha
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

        $('#defaultForm').bootstrapValidator({
            //        live: 'disabled',
            message: 'This value is not valid',
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
                            message: '用户名必须超过2,小于5个字符'
                        },
                        regexp: {
                            regexp: /[\u4E00-\u9FA5]{2,5}/,
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
                        regexp: {
                            regexp: /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
                            message: '请输入正确的身份证号'
                        },
                        remote: {
                            url: '${ctx}/user/p2pRegUserCertify/getByIdNumber',
                            message: '身份证号已存在'
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
            $('#defaultForm').bootstrapValidator('validate');
        });

        $('#resetBtn').click(function () {
            $('#defaultForm').data('bootstrapValidator').resetForm(true);
        });
    });
</script>
<script language="javascript" type="text/javascript">
    var code; //在全局 定义验证码
    function createCode() {
        code = "";
        var codeLength = 4;//验证码的长度
        var checkCode = document.getElementById("checkCode");
        var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//所有候选组成验证码的字符，当然也可以用中文的

        for (var i = 0; i < codeLength; i++) {
            var charIndex = Math.floor(Math.random() * 36);
            code += selectChar[charIndex];
        }
//       alert(code);
        if (checkCode) {
            checkCode.className = "code";
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
<script type="text/javascript">
    $(function () {
        $(".file").parent().css("width", "100%");
        $(".file").parent().css("margin-top", "10px");
        $(".file").parent().find("i").eq(1).css("left", "85%");

        $(".close").click(function () {
            $(".file").parent().find("i").eq(1).css("left", "85%");
        })
        $(".fileinput-remove-button").click(function () {
            $(".file").parent().find("i").eq(1).css("left", "85%");
        })
    })
</script>
</html>