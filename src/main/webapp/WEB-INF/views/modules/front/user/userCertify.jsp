<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

    <script type="text/javascript">
        //非极速模式下
        //极速模式下的 值为 Netscape
        if (navigator.appName === 'Microsoft Internet Explorer') {
            //动态添加 meta元素 并设置相关项
            var headV = document.getElementById("header");
            var metaV = document.createElement('meta');
            metaV.name = 'renderer';
            metaV.content = 'ie-comp';
            headV.appendChild(metaV);
            alert(navigator.appName);
        }
    </script>
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

        .renzheng-index h3 {
            font-size: 24px;
        }

        .renzheng-index-top-back {
            width: 27.3%;
            height: 8px;
            border: 1px solid #909090;
            border-radius: 4px;
            margin: 78px 35px 0;
        }

        .file-caption-name, .file-preview-other, .file-other-error, .file-preview-frame {
            width: 220px;
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
        <li class="lg-active">融资前准备</li>
    </ol>
</div>
<div class="renzheng-index">
    <div class="pull-left" style="margin-left:150px; text-align: center;">
        <h3 style="color: #b81c1d">第一步:实名认证</h3>
        <img src="${ctxStatic}/dist/images/sfrz_1_03.jpg" alt="">
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3>第二步:企业认证</h3>
        <img src="${ctxStatic}/dist/images/qyrz.png" alt="">
    </div>
    <div class="clearfix"></div>
    <div class="renzheng-form pull-left">
        <form enctype="multipart/form-data" id="defaultForm" method="post" class="form-horizontal"
              action="${ctx}/user/p2pRegUserCertify/userCertify">
            <input type="hidden" name="token" value="${token}"/>
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
            <div class="form-group form-group-01">
                <span class="pull-left" style="margin-top: 12px">手持身份证照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input class="file pull-left gyh_inp" type="file" name="file">
                    <div class="gyh" style="display: none; color: #f1318e">
                        您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                    </div>
                </div>
            </div>
            <div class="form-group form-group-02">
                <span class="pull-left" style="margin-top: 12px">身份证正面照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input class="file pull-left gyh_inp" type="file" name="file">
                    <div class="gyh" style="display: none; color: #f1318e">
                        您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                    </div>
                </div>
            </div>
            <div class="form-group form-group-03">
                <span class="pull-left" style="margin-top: 12px">身份证背面照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left gyh_inp">
                    <input class="file pull-left gyh_inp" type="file" name="file">
                    <div class="gyh" style="display: none; color: #f1318e">
                        您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                    </div>
                </div>
            </div>
            <div class="form-group form-group-04">
                <span class="pull-left" style="margin-top: 12px">企业委托书扫描件<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <input class="file pull-left gyh_inp" type="file" name="file">
                    <div class="gyh" style="display: none; color: #f1318e">
                        您好，您当前的IE浏览器版本过低，该功能无法实现。请将您的IE版本升级为IE10+或选择其他浏览器！
                    </div>
                </div>
            </div>
            <div style="margin-left: 25%;">
                <!-- UAT-1081 撤销此处查看-委托书模板 -->
                <!-- <span><a href="javascript:openAgreement()" style="color: #1c44c4;">查看委托书模板</a></span><br> -->
                <span style="color: #bf1a20;">*1 委托书需加盖企业公章或财务公章。</span><br>
                <span style="color: #bf1a20;">&nbsp;2 身份证照片、手持身份证照片及企业委托书扫描件需清晰真实有效，文件大小不超过5M</span><br>
                <span style="color: #bf1a20;">&nbsp;3 支持.jpg .jpeg .png .bmp .gif的图片格式</span>
            </div>

            <div class="form-group" style=" text-align: center;margin-top:20px">
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
<script>
    /* 改动内容 */
    var explorer = window.navigator.userAgent.toLowerCase();
    /* var ver = explorer.match(/msie ([\d.]+)/)[1];
     $(document).ready(function () {
     if (explorer.indexOf("msie") >=-1) {
     if(ver === '9.0'||ver === '8.0'||ver === '7.0'||ver === '6.0'){
     $('.gyh').css('display','block');
     $('.gyh_inp').attr('disabled','disabled');
     $('.gyh_inp').css({
     'background':'#ccc',
     'cursor':'no-drop'
     });
     }
     }
     }); */


    $(function () {
        if ((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)) {
            alert('您当前的浏览器版本过低，请升级您的浏览器版本选择其他浏览器！');
        }
    });
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
                            message: '姓名长度为2-5个字符'
                        },
                        regexp: {
                            regexp: /^[\u4E00-\u9FA5]{2,5}$/,
                            message: '姓名为不小于2，且不大于5的汉字  '
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
                            message: '请输入正确的身份证号'
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
<script type="text/javascript">
    $(function () {
        $(".file").parent(".btn-file").css("width", "100%");
        $(".file").parent(".btn-file").css("margin-top", "10px");
        var certify = '${certify}';
        if (certify != null && certify != "") {
            alert(certify);
            //window.wxc.xcConfirm(certify, window.wxc.xcConfirm.typeEnum.warning);
        }
        /*  $(".file").parent().find("i").eq(1).css("left","85%");

         $(".close").click(function(){
         $(".file").parent().find("i").eq(1).css("left","85%");
         })
         $(".fileinput-remove-button").click(function(){
         $(".file").parent().find("i").eq(1).css("left","85%");
         }) */
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
    function openAgreement() {
        window.open('${pageContext.request.contextPath}' + "/uploadFiles/default/ratingAgreement.pdf")
    }
</script>
</html>