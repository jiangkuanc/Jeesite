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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
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
        <li>当前位置：</li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li><a href="#"><b>邮箱认证</b></a></li>
    </ol>
</div>
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>
    <div class="zh-right pull-left yanzheng ">
        <form id="defaultForm" method="post" class="form-horizontal youxiangyz"
              action="${ctx}/user/validEmailCode/sendEmail">
            <h3>邮箱认证</h3>
            <div class="form-group shuru">
                <label class="col-sm-3 control-label ">输入我的邮箱：</label>
                <div class="col-sm-5" style="padding:0px 15px">
                    <input id="email" type="text" class="form-control" name="toEmailAddress" placeholder="请输入邮箱"/>
                </div>
            </div>

            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                    <button type="submit" class="btn sure-yz" name="signup" value="Sign up" id="btn_submit">发送验证邮件
                    </button>
                </div>
            </div>
        </form>


        <div class="clearfix"></div>
    </div>
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
    /**
     验证邮箱函数
     */
    function checkMail(mail) {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (filter.test(mail)) return true;
        else {
            //alert('您的电子邮件格式不正确');
            return false;
        }
    }
    $(function () {
        $("#btn_submit").attr("disabled", "disabled");
        $("#email").blur(function () {

            if ($("#email").val() == null || $("#email").val() == '' || $("#email").val() == undefined) {
                $("#btn_submit").attr("disabled", "disabled");
            }
            if (checkMail($("#email").val()) == false) {
                $("#btn_submit").attr("disabled", "disabled");
                alert("您的电子邮箱格式不正确");
            }
            else {
                $("#btn_submit").removeAttr("disabled");
            }
        });

        $('#defaultForm').bootstrapValidator({
            //        live: 'disabled',
            message: '输入无效的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                email: {
                    message: '邮箱是无效的',
                    validators: {
                        notEmpty: {
                            message: '请输入您的邮箱'
                        },
                        stringLength: {
                            min: 2,
                            max: 30,
                            message: '用户名必须超过2,小于30个字符'
                        },
                        regexp: {
                            regexp: /^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/,
                            message: '邮箱输入有误，请重新输入  '
                        }
                    }
                }
            }
        });


    });


</script>
</html>
