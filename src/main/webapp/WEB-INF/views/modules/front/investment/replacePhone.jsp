<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrapValidator.css"/>
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/bootstrapValidator.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<!--左侧内容区域结束-->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<c:if test="${user.roleList[0].id == '101'}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '102'}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '104'}">
    <!--左侧内容区域-->
    <div class="zh-left pull-left">
        <p class="zh-p" style="background: #eaeaea;"><a href="${ctx}/user/accountGeneration/showAllInformation"
                                                        style="color:#C1181D;">账户总览</a></p>
        <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </div>
</c:if>
<!--右侧内容区域-->
<p>${message }</p>
<div class="zh-right pull-left bdsjh ">
    <form id="defaultForm" method="post" class="form-horizontal" action="${ctx}/sys/user/updatePhone">
        <div class="form-group">
            <label class="col-lg-3 control-label xsjh">原手机号：</label>
            <div class="col-lg-5">
                <input type="text" class="form-control" name="" value="${user.phone }" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label for="dlmm" class="col-lg-3 control-label dlmm">登录密码：</label>
            <div class="col-lg-5 ">
                <input type="password" class="form-control" id="dlmm" name="oldPassword" placeholder="请输入登录密码"/>
            </div>
        </div>

        <!--             <div class="form-group" style="display:none">确认密码</label> -->
        <!--                 <div class="col-lg-5"> -->
        <!--                     <input type="password" class="form-control" name="confirmPassword" value="123456" /> -->
        <!--                 </div> -->
        <!--             </div> -->

        <div class="form-group">
            <label class="col-lg-3 control-label xsjh">新手机号：</label>
            <div class="col-lg-5">
                <input type="text" class="form-control" name="phone" placeholder="请输入新手机号码"/>
            </div>
        </div>


        <div class="form-group" style=" text-align: center;">
            <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                <input type="submit" class="btn sure" name="signup" value="确定"/>
                <input type="button" class="btn off" id="resetBtn" value="取消" onclick="_quxiao();"/>
            </div>
        </div>
    </form>


    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    function _quxiao() {
        window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=bindingPhone";
    }
    //生成验证码
    $(document).ready(function () {
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));
        $('#defaultForm').bootstrapValidator({
            //live: 'disabled',
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
                phone: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        digits: {},
                        phone: {
                            country: 'US'
                        },
                        remote: {
                            url: '${ctx}/sys/user/getByPhone',
                            message: '手机号已被绑定'
                        }
                    }
                },
                oldPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        remote: {
                            url: '${ctx}/sys/user/getOldPassword',
                            message: '密码错误'
                        }
                    }
                },
//                         confirmPassword: {
//                             validators: {
//                                 notEmpty: {
//                                     message: '确认密码不能为空'
//                                 },
//                                 identical: {
//                                     field: 'password',
//                                     message: '密码和确认密码不一样'
//                                 }
//                             }
//                         },
                gender: {
                    validators: {
                        notEmpty: {
                            message: 'The gender is required'
                        }
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {
                            message: ''
                        }
                    }
                },
                'programs[]': {
                    validators: {
                        choice: {
                            min: 2,
                            max: 4,
                            message: 'Please choose 2 - 4 programming languages you are good at'
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
</script>


</body>
</html>