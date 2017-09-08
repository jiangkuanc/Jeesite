<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/shimingrenzheng.css">
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>

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

        .bottomInfo a {
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
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}" style="color:#909090">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation" style="color:#909090">我的账户</a></li>
        <li class="lg-active">身份认证</li>
    </ol>
</div>
<div class="renzheng-index">
    <div class="pull-left" style="margin-left:18%; text-align: center;">
        <h3 style="color: #b81c1d">第一步:身份认证</h3>
        <img src="${ctxStatic}/dist/images/sfrz.png" alt="">
    </div>
    <div class="renzheng-index-top-back pull-left"></div>
    <div class="pull-left" style="text-align: center;">
        <h3>第二步:绑定银行卡</h3>
        <img src="${ctxStatic}/dist/images/qyrz.png" alt="">
    </div>
    <div class="clearfix"></div>
    <div class="renzheng-form pull-left">
        <form enctype="multipart/form-data" id="defaultForm" method="post" class="form-horizontal"
              action="${ctx }/user/idCardCertify/reCertifyForm">
            <div class="form-group">
                <span class="pull-left">姓名<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-7 pull-left">
                    <input type="text" name="realName" class="form-control sfrz"
                           placeholder="${p2pRegUserCertify.realName}" value="${p2pRegUserCertify.realName}" readonly/>
                </div>
            </div>
            <div class="form-group">
                <span class="pull-left">我的身份证号<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-7 pull-left">
                    <input type="text" name="idNumber" class="form-control sfrz"
                           placeholder="${p2pRegUserCertify.idNumber}" value="${p2pRegUserCertify.idNumber}" readonly/>
                </div>
            </div>

            <img src="${ctxStatic}/dist/images/renzheng_banner_03.png" style="margin-top:-120px" class="pull-right"
                 alt="">
            <div class="form-group form-group-01">
                <span class="pull-left" style="margin-top: 12px">手持身份证照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">

                    <c:choose>
                        <c:when test="${p2pRegUserCertify.idCardInhand==''||p2pRegUserCertify.idCardInhand==null}">
                            <input type="text" class="form-control sfrz" value="无"/>
                        </c:when>
                        <c:when test="${p2pRegUserCertify.idCardInhand!=''&&p2pRegUserCertify.idCardInhand!=null&&p2pRegUserCertify.inhandIsReject=='1'}">
                            <img src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pRegUserCertify.idCardInhand}"
                                 width="200px" height="200px"/>
                        </c:when>
                        <c:when test="${p2pRegUserCertify.idCardInhand!=''||p2pRegUserCertify.idCardInhand!=null&&p2pRegUserCertify.inhandIsReject=='0'}">
                            <input class="file pull-left" type="file" name="file">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="form-group form-group-02">
                <span class="pull-left" style="margin-top: 12px">身份证正面照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <c:choose>
                        <c:when test="${p2pRegUserCertify.idCardFront==''||p2pRegUserCertify.idCardFront==null}">
                            <input type="text" class="form-control sfrz" value="无"/>
                        </c:when>
                        <c:when test="${(p2pRegUserCertify.idCardFront!='')&&(p2pRegUserCertify.idCardFront!=null)&&(p2pRegUserCertify.frontIsReject=='1')}">
                            <img src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pRegUserCertify.idCardFront}"
                                 width="200px" height="200px;"/>
                        </c:when>
                        <c:when test="${(p2pRegUserCertify.idCardFront!='')&&(p2pRegUserCertify.idCardFront!=null)&&(p2pRegUserCertify.frontIsReject=='0')||p2pRegUserCertify.frontIsReject==''||p2pRegUserCertify.frontIsReject==null}">
                            <input class="file pull-left" type="file" name="file">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="form-group form-group-03">
                <span class="pull-left" style="margin-top: 12px">身份证背面照片<b style="color:#C1181D;font-size:16px;">*</b>:</span>
                <div class="col-lg-5 pull-left">
                    <c:choose>
                        <c:when test="${p2pRegUserCertify.idCardBack==''||p2pRegUserCertify.idCardBack==null}">
                            <input type="text" class="form-control sfrz" value="无"/>
                        </c:when>
                        <c:when test="${p2pRegUserCertify.idCardBack!=''&&p2pRegUserCertify.idCardBack!=null&&p2pRegUserCertify.backIsReject=='1'}">
                            <img src="${ctx}/image/test?path=${fns:getConfig('filePath')}${p2pRegUserCertify.idCardBack}"
                                 width="200px" height="200px;"/>
                        </c:when>
                        <c:when test="${p2pRegUserCertify.idCardBack!=''&&p2pRegUserCertify.idCardBack!=null&&p2pRegUserCertify.backIsReject=='0'||p2pRegUserCertify.backIsReject==''||p2pRegUserCertify.backIsReject==null}">
                            <input class="file pull-left" type="file" name="file">
                        </c:when>
                    </c:choose>
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
<div class="bottomInfo">
    <%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</div>

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
                        regexp: {
                            regexp: /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
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
        $(".file").parent().css("width", "100%");
        $(".file").parent().css("margin-top", "10px");
        $(".file").parent().find("i").eq(1).css("left", "85%");
    })
</script>
<script type="text/javascript">
    fillInputBug('01');
    fillInputBug('02');
    fillInputBug('03');
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