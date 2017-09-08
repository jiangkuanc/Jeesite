<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <style>
        .input-group {
            width: 90%;
        }

        .form-group span {
            font-size: 14px;
            color: #929292;
            width: 26%;
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
            margin-top: 30px;
            width: 100%
        }

        .btn-info {
            margin-left: 20px
        }

        .renzheng-form {
            width: 82%;
            margin-left: 50px;
        }

        .form-horizontal .form-group > label {
            color: #929292;
        }

        .btn-primary {
            background-color: #f2434a;
            border-color: #f2434a;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #909090;
            border-color: #909090;
            color: #fff;
        }

        .form-group span.ytg {
            width: 90%;
            text-align: left;
            margin-left: 12%
        }

        .form-horizontal {
            margin-top: 30px;
            width: 100%
        }

        .btn-info {
            margin-left: 20px
        }

        .renzheng-form {
            width: 82%;
            margin-left: 50px;
        }

        #input1 {
            width: 30%;
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

        .file-preview {
            overflow: hidden;
            min-width: 226px;
        }

        .file-preview-frame {
            text-align: center;
        }

        .file-caption-name {
            padding: 0;
        }

        .file-preview-other, .file-other-error {
            width: 90%;
            margin-left: 60%;
        }

        .file-thumbnail-footer {
            display: block;
        }

        .file-error-message {
            word-wrap: break-word;
            word-break: break-all;
        }

        .update {
            margin-left: 189px;
            margin-top: 10px
        }

        .Imargin {
            margin-top: 16px
        }
    </style>
</head>
<body onload="createCode()">
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<div class="zh-right pull-left zhaimima ">
    <div class="renzheng ">
        <h3 class="zhai-mima rz-h3">身份认证</h3>
        <div class="renzheng-form pull-left">
            <form enctype="multipart/form-data" id="defaultForm" method="post" class="form-horizontal"
                  action="${ctx}/user/p2pRegUserCertify/userCertify">
                <input type="hidden" name="token" value="${token}"/>
                <input type="hidden" name="id" value="${p2pRegUserCertify.id}"/>
                <div class="form-group">
                    <span class="pull-left">姓名:</span>
                    <div class="col-lg-5 pull-left">
                        <input type="text" class="form-control" name="realName" value="${p2pRegUserCertify.realName}"/>
                    </div>
                </div>
                <div class="form-group">
                    <span class="pull-left">我的身份证号:</span>
                    <div class="col-lg-5 pull-left">
                        <input type="text" class="form-control" name="idNumber" value="${p2pRegUserCertify.idNumber}"/>
                    </div>
                </div>

                <input type="hidden" name="inhandIsReject" value="${p2pRegUserCertify.inhandIsReject}"/>
                <img src="${ctxStatic}/dist/images/renzheng_banner_03.png" style="margin-top:-120px" class="pull-right"
                     alt="">
                <div class="form-group form-group-01">
                    <span class="pull-left Imargin">手持身份证照片:</span>
                    <c:choose>
                        <c:when test="${p2pRegUserCertify.inhandIsReject == 1}">
                            <img src="${p2pRegUserCertify.idCardInhandView}" alt=""
                                 style="width:300px;margin-left:16px;margin-top: 16px">
                        </c:when>
                        <c:otherwise>
                            <div class="col-lg-5 pull-left">
                                <input class="file pull-left" type="file" name="file">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <input type="hidden" name="frontIsReject" value="${p2pRegUserCertify.frontIsReject}"/>
                <div class="form-group form-group-02">
                    <span class="pull-left Imargin">身份证正面照片:</span>
                    <c:choose>
                        <c:when test="${p2pRegUserCertify.frontIsReject == 1}">
                            <img src="${p2pRegUserCertify.idCardFrontView}" alt=""
                                 style="width:300px;margin-left:16px;margin-top: 16px">
                        </c:when>
                        <c:otherwise>
                            <div class="col-lg-5 pull-left">
                                <input class="file pull-left" type="file" name="file">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <input type="hidden" name="backIsReject" value="${p2pRegUserCertify.backIsReject}"/>
                <div class="form-group form-group-03">
                    <span class="pull-left Imargin">身份证背面照片:</span>
                    <c:choose>
                        <c:when test="${p2pRegUserCertify.backIsReject == 1}">
                            <img src="${p2pRegUserCertify.idCardBackView}" alt=""
                                 style="width:300px;margin-left:16px;margin-top: 16px">
                        </c:when>
                        <c:otherwise>
                            <div class="col-lg-5 pull-left">
                                <input class="file pull-left" type="file" name="file">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label"></label>
                    <div class="col-lg-9 ">
                        <span class="ytg">*1 身份证照片、手持身份证照片及企业委托书扫描件需清晰真实</span>
                        <span class="ytg">有效，文件大小不超过5M</span>
                        <span class="ytg">&nbsp;2 支持.jpg、.jpeg、.png、.bmp的图片格式</span>
                    </div>
                </div>


                <input type="hidden" name="attorneyIsReject" value="${p2pRegUserCertify.attorneyIsReject}"/>
                <div class="form-group form-group-04">
                    <span class="pull-left Imargin">上传企业委托书扫描件:</span>
                    <c:choose>
                        <c:when test="${p2pRegUserCertify.attorneyIsReject == 1}">
                            <img src="${p2pRegUserCertify.powerOfAttorneyView}" alt=""
                                 style="width:300px;margin-left:16px;margin-top: 16px">
                        </c:when>
                        <c:otherwise>
                            <div class="col-lg-5 pull-left">
                                <input class="file" type="file" name="file">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <!--<div class="form-group">-->
                <!--<label  class="col-lg-2 control-label"></label>-->
                <!--<div class="col-lg-9 ">-->
                <!--&lt;!&ndash;<span class="ytg">*《企业委托书》需采用大公标准模板，填写完成并加盖企业公章</span>&ndash;&gt;-->
                <!--&lt;!&ndash;<span class="ytg">或财务公用章。</span>&ndash;&gt;-->
                <!--<span class="ytg"><a href="">点击下载此模板</a></span>-->
                <!--</div>-->
                <!--</div>-->

                <div class="form-group" style=" text-align: center;">
                    <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; width: 95%;">
                        <button type="submit" class="btn btn-primary"
                                style="width:auto;background-color:#f2434a;color: #fff" name="signup" value="Sign up">
                            下一步
                        </button>
                        <button type="button" class="btn btn-info" id="resetBtn" onclick="abc()">取消</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="clearfix"></div>

</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    $("input[type='file']").fileinput({
        'allowedFileExtensions': ['jpg', 'png', 'gif'],
        showCaption: false,
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
            message: '输入无效的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '姓名是无效的',
                    validators: {
                        notEmpty: {
                            message: '*请输入正确的姓名'
                        },
                        stringLength: {
                            min: 2,
                            max: 5,
                            message: '姓名长度为2-5个字符'
                        },
                        regexp: {
                            regexp: /^[\u4E00-\u9FA5]{2,5}$/,
                            message: '姓名为不小于2，且不大于5的汉字  '
                        }
                    }
                },
                idNumber: {
                    message: '*请输入正确的身份证号',
                    validators: {
                        notEmpty: {
                            message: '请输入正确的身份证号'
                        },
                        regexp: {
                            regexp: /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
                            message: '请输入正确的身份证号'
                        },
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
    function abc() {
        window.location.href = '${frontPath}';
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
<script type="text/javascript">
    fillInputBug('01');
    fillInputBug('02');
    fillInputBug('03');
    fillInputBug('04');
    function fillInputBug(num) {
        $('.pull-left[type ="file"]').click(function (e) {
            var $close = $(".form-group-" + num + " " + ".fileinput-remove"); //del
            var $i = $(".form-group-" + num + " " + "i.form-control-feedback");// v
            var $lg5 = $(".form-group-" + num + " " + ".col-lg-5");
            var $form = $(".form-group-" + num);

            $close.click(function () {
                $lg5.children('small').remove();
                var $input = $(".form-group-" + num + " " + " input[name=" + "hand_ID" + "]");
                var file = e.target.files[0];//获取的当前上传的图片
                console.log(file);
                $form.removeClass('has-success').addClass('has-error');
                $i.removeClass('glyphicon-ok').addClass('glyphicon-remove');
                $input.val("");
                var newStr = '<small class="help-block"data-bv-validator="notEmpty" ' +
                    'data-bv-for="hand_ID" data-bv-result="INVALID" >请上传附件</small>';
                $lg5.append(newStr);
                if ($(".form-group-" + num + " " + ".col-lg-5" + " " + "small") || $input.val()) {
                    $('button[type="submit"]').attr('disabled', 'disabled');
                }
            })
        })
    }
</script>
</html>
