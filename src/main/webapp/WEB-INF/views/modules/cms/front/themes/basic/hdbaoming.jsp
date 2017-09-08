<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.method.js"></script>
    <script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
    <style type="text/css">
        li {
            display: inline
        }

        .divs .imgs {
            display: inline-block;
            vertical-align: middle;
        }

        .nrjj span, .bqhd_name {
            display: inline-block;
        }

        .nrjj span:nth-of-type(2) {
            width: 900px;
            vertical-align: top;
        }

        .bqhd_name {
            display: inline-block;
            width: 80%;
            vertical-align: top;
        }

        .form-horizontal .control-label {
            padding: 0;
            width: 20%;
        }

        .modal-body .control-group {
            margin-bottom: 10px;
        }

        #btnSubmit1 {
            padding: 2px 12px;
        }

        .modal-header .close {
            margin-top: -14px;
        }

        @media (min-width: 768px) {
            .modal-dialog {
                width: 640px;
                margin: 30px auto;
            }
        }

        #inputForm .error {
            color: red;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#btnSubmit").click(function () {
                if (${!empty sessionScope.user}) {
                    /*modal*/
                    $("#myModal").modal();
                    $("#myModal").html('<div class="modal-dialog" role="document">'
                        + '<div class="modal-content">'
                        + '<div class="modal-header">'
                        + '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>'
                        + '</div>'
                        + '<div class="modal-body" style="margin: 20px 15px">'
                        + '<input name="id" value="435b31a2c94841a2a4d967b2d74fa1c7" type="hidden">'
                        + '<div class="control-group">'
                        + '<label class="control-label">本期活动：</label><span class="bqhd_name">${article.title}</span>'
                        + '</div>'
                        + '<div class="control-group">'
                        + '<label class="control-label">报名账号：</label><span id="bmloginName"></span>'
                        + '</div>'
                        + '<div class="control-group">'
                        + '<label class="control-label">真实姓名：</label>'
                        + '<input name="realName" id="realName" class="required" type="text" maxlength="35" style="width: 208px" placeholder="必填，请填写用户真实姓名">'
                        + '<div id="message"></div>'
                        + '</div>'
                        + '<div class="control-group">'
                        + '<label class="control-label">联系方式：</label>'
                        + '<input name="tel" id="phone" placeholder="必填，请填写正确的手机号码" class="required" type="text" maxlength="35" style="width: 208px">'
                        + '<button id="btnSubmit1" class="btn btn-primary" type="button" style="border-radius: 10px;margin-left: 10px;">获取验证码</button>'
                        + '<div id="message"></div>'
                        + '</div>'
                        + '<div class="control-group">'
                        + '<label class="control-label">输入验证码：</label>'
                        + '<input name="verificationCode" id="yanzheng" class="required" type="text" maxlength="35" style="width: 208px">'
                        + '<div id="message"></div>'
                        + '</div>'
                        + '<div class="control-group form-actions" style="text-align: center;">'
                        + '<input id="btnSubmit3" class="btn btn-primary" type="submit" value="确认报名" >&nbsp;'
                        + '</div>'
                        + '<div class="control-group" style="padding-top: 8px;color:red;">*报名审核通过后将短信发送邀请码作为参会凭证,请务必填写真实可用的联系方式'
                        + '</div></div></div></div>')
                    /**********/
                    $("#bmloginName").html("${sessionScope.user.loginName}");
                    $("#myModal").modal();
                    $("#realName").val("");
                    $("#phone").val("");
                    $("#yanzheng").val("");
                } else {
                    alert("请登录后再参与活动报名");
                }
            });

            jQuery.validator.addMethod("isMobile", function (value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && mobile.test(value));
            }, "请正确填写您的手机号码");
            $().ready(function () {
                $("#inputForm").validate({
                    debug: true,
                    rules: {
                        realName: "required",
                        tel: {
                            required: true,
                            minlength: 11,
                            isMobile: true
                        },
                        verificationCode: "required"
                    },
                    messages: {
                        realName: "不能为空",
                        tel: {
                            required: "手机号码不能为空",
                            minlength: "请正确填写手机号码",
                            isMobile: "请正确填写手机号码"
                        },
                        verificationCode: "不能为空"
                    },
                });
            });
        });

        $(document).on("click", "#btnSubmit1", function () {
            var smsPhone = $("#phone").val();
            /* alert(smsPhone) */
            $.ajax({
                type: 'post',
                url: "${ctx}/msg/msgSmsRecord/sendSmsRestfulPhone?smsPhone=" + smsPhone,
                success: function (data) {
                    var d = eval("(" + data + ")");
                    alert(d.message);
                }
            });
        });


        $(document).on("click", "#btnSubmit3", function () {
            var smsCode = $("#yanzheng").val();
            if (smsCode == null || smsCode == undefined || smsCode == '') {
                return;
            } else {

                $.ajax({
                    url: "${ctx}/msg/msgSmsRecord/validSmsCode?smsCode=" + smsCode,
                    type: 'post',
                    success: function (data) {
                        var d = eval("(" + data + ")");
                        if (d.status == 1) {
                            $.ajax({
                                async: false,
                                type: 'post',
                                url: '${ctx}/cms/cmsCreditactivity/commite',
                                data: $("#inputForm").serialize(),
                                dataType: 'JSON',
                                success: function (data) {
                                    /*modal*/
                                    setTimeout(function () {
                                        $("#myModal").modal();
                                    }, 300)
                                    $("#myModal").html('<div class="modal-dialog" role="document">'
                                        + '<div class="modal-content">'
                                        + '<div class="modal-header">'
                                        + '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>'
                                        + '</div>'
                                        + '<div class="modal-body" style="margin: 20px 15px">'
                                        + '<div class="control-group form-actions" style="text-align: center;">'
                                        + '<p style="padding: 50px;">祝贺您，您已报名成功</p>'
                                        + '<span id="" class="btn btn-primary" data-dismiss="modal">确定</span>'
                                        + '</div>'
                                        + '<div class="control-group" style="padding-top: 8px;color:red;">*报名审核通过后将短信发送邀请码作为参会凭证,请务必填写真实可用的联系方式</div>'
                                        + '</div></div></div>');
                                    /******/
                                }
                            });
                        } else {

                            setTimeout(function () {
                                $("#myModal").modal();
                            }, 20)
                            $("#myModal").html('<div class="modal-dialog" role="document">'
                                + '<div class="modal-content">'
                                + '<div class="modal-header">'
                                + '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>'
                                + '</div>'
                                + '<div class="modal-body" style="margin: 20px 15px">'
                                + '<div class="control-group form-actions" style="text-align: center;">'
                                + '<p style="padding: 50px;">验证码不正确,请重新报名</p>'
                                + '<span id="" class="btn btn-primary" data-dismiss="modal">确定</span>'
                                + '</div>'
                                + '<div class="control-group" style="padding-top: 8px;color:red;">*报名审核通过后将短信发送邀请码作为参会凭证,请务必填写真实可用的联系方式</div>'
                                + '</div></div></div>');
                        }

                    }
                });
            }

        });

    </script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx }/cms/article/xinyongjiaoyu">信用教育</a></li>
        <li><a href="${ctx }/cms/article/xyjyhuodong">信用教育活动</a></li>
        <li class="lg-active">进行中活动-活动报名</li>
    </ol>
</div>
<div class="index-banner">
    <ul class="" style="padding-left:0;">
        <li><img src="${ctxStatic}/style/images/xyjy-banner1_02.png" width="1440px" height="358px" alt=""></li>
    </ul>
</div>
<div class="xyjy-content-top" style="padding:50px 0 150px;">
    <ul>
        <li style="font-size:25px">${article.title}</li>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <li>发表于：<fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></li>
    </ul>
    <div style="margin:20px 0 90px;">
        <p style="margin-left:0px;">活动讲师：${article.speaker }</p>
        <p style="margin-left:0px;" class="nrjj">
            <span>活动内容：</span><span>${fns:abbr(article.articleData.content,1000)}</span></p>
        <p>活动时间：<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/>&nbsp;至 &nbsp;<fmt:formatDate
                value="${article.weightDate}" pattern="yyyy-MM-dd"/></p>
        </p>
        <p style="margin-left:0px;">活动地点：${article.activityLocation }</p>
        <p style="margin-left:0px;">报名方式：${article.registrationWay }</p>
    </div>
    <div class="clearfix">
        <c:forEach var="img" items="${fn:split(article.image,'|') }" varStatus="status">
            <%-- <c:if test="${article.image!=null}"></c:if> --%>
            <p style="text-align: center;"><img alt="" class="img" src="${article.image}" height="380px" width="650px">
            </p>

        </c:forEach>
    </div>
    <div class="btns" style="text-align: center;margin: 30px 0;"><input id="btnSubmit" class="btn btn-primary"
                                                                        type="button" value="我要报名"></div>
</div>

<!-- 弹出页面modal -->
<form action="${ctx}/cms/cmsCreditactivity/commite" method="post" class="form-horizontal" id="inputForm">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

    </div>
</form>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>