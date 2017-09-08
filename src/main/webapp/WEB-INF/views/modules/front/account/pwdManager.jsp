<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>

    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
    <style type="text/css">
        #messageBox {
            width: 410px;
            margin-left: 25%;
            height: 34px;
            line-height: 4px;
            color: #C3181E;
            text-align: center;
            font-family: '微软雅黑';
            margin-bottom: 10px;
            display: none;
        }

        #messageBox .error {
            font-weight: normal;
        }

        .close {
            line-height: 0.1;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<c:if test="${user.roleList[0].id == 101}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == 102}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '104'}">
<div class="zh">
    <ol class="breadcrumb">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">密码管理</li>
    </ol>
</div>
<div class="zh-con" style="height:900px;">
    <!--左侧内容区域-->
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>
    <c:if test="${user.roleList[0].id == '105'}">
        <%@include file="/WEB-INF/views/p2p/front/supplyCredit/assetValuationMenu.jsp" %>
    </c:if>
    <c:if test="${user.roleList[0].id == '106'}">
        <%@include file="/WEB-INF/views/p2p/front/supplyCredit/guaranteeMenu.jsp" %>
    </c:if>


    <!--右侧内容区域-->
    <div class="zh-right pull-left xgmm ">
        <div class="mima">
            <h3>修改登录密码</h3>
            <div class="alert alert-error " type="hidden" id="messageBox">
                <label class="error" id="loginError">您尚未修改初始密码，需先修改密码再进行其他操作。</label>
            </div>
            <c:choose>
            <c:when test="${user.roleList[0].id == 101 && certificateState == 101}">
            <form id="defaultForm" method="post" class="form-horizontal" onsubmit="return false;"
                  style="margin-top: 30px;">
                </c:when>
                <c:otherwise>
                <form id="defaultForm" method="post" action="${ctx}/sys/user/updatePwd" class="form-horizontal"
                      style="margin-top: 30px;">
                    </c:otherwise>
                    </c:choose>
                    <div class="form-group">
                        <label for="dlmm" class="col-lg-3 control-label dlmm" style="font-size:14px;">原始登录密码：</label>
                        <div class="col-lg-5 ">
                            <input type="password" class="form-control" id="dlmm" name="oldPwd" placeholder="请输入原始登录密码"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="xmm" class="col-lg-3 control-label">密码：</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" id="xmm" name="newPwd" placeholder="请输入新登录密码"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">确认密码：</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="confirmNewPwd" placeholder="请输入确认密码"
                                   required="required"/>
                        </div>
                    </div>


                    <div class="form-group" style=" text-align: center;">
                        <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                            <a href="javascript:;" class="sure1">
                                <c:choose>
                                    <c:when test="${user.roleList[0].id == 101 && certificateState == 101}">
                                        <button class="btn btn-default" name="signup" onclick="checkUser()"
                                                value="Sign up" type="submit">保存
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-default" name="signup" value="Sign up" type="submit">保存
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <button type="button" class="btn off" id="resetBtn" onclick="abc()">取消</button>
                        </div>
                    </div>
                </form>


                <div class="clearfix"></div>
        </div>

    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">


    function abc() {
        var userId = '${user.id}';
        if (userId != null && userId != "") {
            var userRoleList = '${user.roleList[0].id}';
            if (userRoleList == 101) {
                window.location.href = "${ctx}/user/Institution/ctrlMenu";
            }
            if (userRoleList == 102) {
                window.location.href = "${ctx}/user/p2pUserInformation/accountPermission";
            }
            if (userRoleList == 104) {
                window.location.href = "${ctx}/user/accountGeneration/showAllInformation";
            }
        }
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
            //        live: 'disabled',
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
                oldPwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        remote: {
                            url: '${ctx}/sys/user/checkPwd',
                            message: '原始密码输入错误'
                        }
                    }
                },
                newPwd: {
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
                            message: '*必须由英文、字母、符号组成'
                        },
                        identical: {
                            field: 'confirmNewPwd',
                            message: '密码和确认密码不一样'
                        },
                        remote: {
                            url: '${ctx}/sys/user/differentPwd',
                            message: '新密码不能为原始密码'
                        }
                    }
                },
                confirmNewPwd: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'newPwd',
                            message: '密码和确认密码不一样'
                        },
                        different: {
                            field: 'oldPwd',
                            message: '新密码不能为原始密码'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            // 获取表单实例
            $.ajax({
                url: '${ctx}/sys/user/modifyPwdReception',
                type: 'post',
                data: {'password': $('#xmm').val()},
                success: function (d) {
                    if (d == 'false') {
                        $('#defaultForm').submit;
                    } else {
                        alert(d);
                    }
                }
            });
        });

        // Validate the form manually
        $('#validateBtn').click(function () {
            $('#defaultForm').bootstrapValidator('validate');
        });

        $('#resetBtn').click(function () {
            $('#defaultForm').data('bootstrapValidator').resetForm(true);
        });
    });


    $(function () {
        var roleList = '${user.roleList[0].id}';
        if (roleList == "101") {
            var certificateState = '${certificateState}';
            if (certificateState == 200) {
                $('#messageBox').show();
            }
        }
    });
    function checkUser() {
        alert("您好，您是新注册用户，尚未签订服务协议，请签订协议后再进行其他操作。")
        window.location.href = '${ctx}/sys/user/signAgreementPage';
    }
</script>


</body>
</html>
