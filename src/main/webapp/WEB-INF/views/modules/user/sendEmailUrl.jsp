<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/jcalculator.js"></script>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
    <style type="text/css">
        .jCalculator {
            position: absolute;
            top: 25px;
            right: 249px;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<c:if test="${user.roleList[0].id == '101'}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '102'}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '104'}">
<div class="zh">
    <ol class="breadcrumb">
        <li>我的位置：</li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">邮箱认证</li>
    </ol>
</div>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>

    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left ">
        <div class="zh-right pull-left yanzheng" style="border:0px;">
            <form id="defaultForm" class="form-horizontal youxiangyz" onsubmit="return false;">
                <h3>邮箱认证</h3>
                <div class="form-group shuru">
                    <label class="col-sm-3 control-label ">请输入邮箱验证码：</label>
                    <div class="col-sm-5" style="padding:0px 15px">
                        <input type="text" class="form-control" name="clientCode" placeholder="请输入邮箱验证码"
                               id="phoneCode"/>
                    </div>
                </div>

                <div class="form-group" style=" text-align: center;">
                    <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                        <button type="button" class="btn sure-yz" name="signup" value="Sign up" id="btn_submit">验证
                        </button>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    $(function () {
        $("#btn_submit").attr("disabled", "disabled");
        var phoneCodeRegex = /^\S{4}$/;//\S
        //alert(phoneCodeRegex);
        //页面加载时,默认禁用验证按钮
        //$("#btn_submit").attr("disabled","disabled");
        $("#phoneCode").keyup(function () {
            //alert("xxx");
            /* 	$("#btn_submit").attr("disabled","disabled"); */
            if ($("#phoneCode").val() == null || $("#phoneCode").val() == '' || $("#phoneCode").val() == undefined) {
                //alert("if");
                $("#btn_submit").attr("disabled", "disabled");
            } else {
                //alert("else")
                if (valCode($("#phoneCode").val()) == false) {
                    $("#btn_submit").attr("disabled", "disabled");
                    //alert("您输入的邮箱验证码有误!");
                }
                if (valCode($("#phoneCode").val()) == true) {
                    $("#btn_submit").removeAttr("disabled");
                }
            }
        });

        //手机验证码校验(四位数字校验)
        function valCode(code) {
            if (phoneCodeRegex.test(code)) {
                return true;
            } else {
                return false;
            }
        }
    });

    var ValidEmail = {
        code: "",//验证码
        validEmailUrl: "${ctx}/user/validEmailCode/authEmail",//邮箱验证地址,请求地址应该加密,不能直接暴露
        sendEmailUrl: "${ctx}/user/validEmailCode/sendEmail",//邮箱发送地址页面；
        showEmailPage: "${ctx}/user/validEmailCode/showEmail",//展示邮箱验证页面；
        emailSuccessPage: "${ctx}/user/validEmailCode/emailSuccessPage",//账户总览地址
        //
        //初始化函数
        init: function () {
            if (ValidEmail.code != null && ValidEmail.code != null && ValidEmail.code != undefined) {
                $.ajax({
                    type: 'post',
                    url: this.validEmailUrl,
                    data: {clientCode: ValidEmail.code},
                    success: function (data) {
                        data = eval("(" + data + ")");
                        if (data != null && data != '') {
                            if (data.status == 0) {
                                if (true == confirm(data.message + "请您重新验证")) {
                                    window.location.href = ValidEmail.showEmailPage;
                                }
                            }
                            else if (data.status == 1) {
                                if (true == confirm(data.message)) {
                                    window.location.href = ValidEmail.emailSuccessPage;//邮箱验证成功页面
                                }
                            } else if (data.status == 2) {
                                if (true == confirm(data.message)) {
                                    window.location.href = ValidEmail.showEmailPage;
                                }
                            } else {
                                if (true == confirm(data.message)) {
                                    if (data.status == 2) {
                                        //验证码超时
                                        window.location.href = ValidEmail.showEmailPage;
                                    }
                                    else if (data.status == 3) {
                                        //验证失败,并超时
                                        window.location.href = ValidEmail.showEmailPage;
                                    } else if (data.status == 4) {

                                        $("#phoneCode").val("");//清除input中的验证码值,使之重新获取焦点
                                        $("#phoneCode")[0].focus();
                                    }
                                }
                            }
                        }
                    }
                });
            } else {
                return;
            }
        }
        /* checkStatus:function(data,retValUrl){
         if(data.status == 0){
         this.echoMessage(data.message,retValUrl);
         }else if(status == 1){
         this.echoMessage(data.message,this.)
         }else if(status == 2){
         confirm();
         }else if(status == 3){
         confirm();
         }else{
         return;
         }
         }，
         echoMessage:function(message,retValUrl){
         if(true==confirm(message)){
         window.location.href=retValUrl;
         }else{
         return;
         }
         } */
    }
    $("#btn_submit").click(function () {
        var phoneCode = $("#phoneCode").val();
        ValidEmail.code = phoneCode;
        //alert("ValidEmail.code:"+ValidEmail.code);
        ValidEmail.init();//调用服务端进行验证
    });

    $('#btn_submit').keydown(function (e) {
        if (e.keyCode == 13) {
            alert(15641561)
            var phoneCode = $("#phoneCode").val();
            ValidEmail.code = phoneCode;
            //alert("ValidEmail.code:"+ValidEmail.code);
            ValidEmail.init();//调用服务端进行验证
        }
    });

</script>
<script type="text/javascript">
    $(function () {
        $(document).ready(function () {
            $('#defaultForm').bootstrapValidator({
//        live: 'disabled',
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    clientCode: {
                        validators: {
                            notEmpty: {
                                message: 'The first name is required and cannot be empty'
                            }
                        }
                    }
                }
            })

            // Validate the form manually
            $('#validateBtn').click(function () {
                $('#defaultForm').bootstrapValidator('validate');
            });

            $('#resetBtn').click(function () {
                $('#defaultForm').data('bootstrapValidator').resetForm(true);
            });
        });
</script>


</html>
