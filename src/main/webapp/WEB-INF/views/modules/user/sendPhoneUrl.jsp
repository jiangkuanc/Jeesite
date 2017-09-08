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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/manhuaDate.1.0.css">

    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic}/dist/js/ajaxUtil.js"></script>
</head>
<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
<div class="zh">
    <ol class="breadcrumb">
        <li>我的位置：</li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">绑定手机号</li>
    </ol>
</div>
<div class="zh-con">
    </c:if>
    <!--内容区域-->
    <!--账户总览页面-->
    <c:if test="${user.roleList[0].id == '101'}">
        <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
    </c:if>
    <c:if test="${user.roleList[0].id == '102'}">
        <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
    </c:if>
    <c:if test="${user.roleList[0].id == '104'}">
        <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>
    <div class="zh-right pull-left yanzheng ">
        <form id="defaultForm" method="post" class="form-horizontal youxiangyz"
              action="${ctx}/user/validEmailCode/authEmail">
            <h3>手机号认证</h3>
            <div class="form-group shuru">
                <label class="col-sm-3 control-label ">请输入手机号验证码：</label>
                <div class="col-sm-5" style="padding:0px 15px">
                    <input id="smsCode" type="text" class="form-control" name="smsCode" placeholder="请输入手机号验证码"/>
                </div>
            </div>

            <div class="form-group" style=" text-align: center;">
                <div id="validBtnDiv" class="col-lg-7 col-lg-offset-2"
                     style="margin-left: 0; width: 90%;margin-top:30px">
                    <button id="validBtn" type="button" class="btn sure-yz" name="signup" value="Sign up">验证</button>
                </div>
            </div>
        </form>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body text-center " style="height:80px;line-height:80px;font-size:30px;">


            </div>
            <div class="modal-footer">
                <a href="${ctx}/user/accountGeneration/showAllInformation">
                    <button type="button" id="returnResult" class="btn btn-success" data-dismiss="modal">确定</button>
                </a>
                <!-- <button type="button" id="confirmResult" class="btn btn-primary">确定</button> -->
            </div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->

</body>
<script type="text/javascript">
    $(function () {
        $("#smsPhoneId").blur(function () {
            //如果验证码为空则禁用验证按钮
            if ($("#smsCode").val() == null || $("#smsCode").val() == '' || $("#smsCode").val() == undefined) {
                $("#signup").attr("disabled", "disabled");
            }
            else {
                $("#btn_submit").removeAttr("disabled");//如果前手机验证规则都满足的话,则移除按钮禁用的样式
            }
        });

        $("#validBtn").click(function () {
            var smsCode = $("#smsCode").val();								//获取输入的校验码
            /* if(smsCode==null||smsCode ==""){
             alert("请输入验证码！");
             } */
            if (smsCode != '') {
                $.post("${ctx}/msg/msgSmsRecord/validSmsCode",
                    {"smsCode": smsCode},
                    function (data) {
                        data = eval("(" + data + ")")
                        if ("验证成功" == data.message) {
                            if (confirm("验证成功") == true) {
                                var roleCode = '${user.roleList[0].id}';
                                if (roleCode == '101') {
                                    window.location.href = '${ctx}/user/Institution/ctrlMenu';
                                }
                                if (roleCode == '102') {
                                    window.location.href = '${ctx}/user/p2pUserInformation/accountPermission';
                                }
                                if (roleCode == '104') {
                                    window.location.href = '${ctx}/user/accountGeneration/showAllInformation';
                                }
                                //window.location.href="${ctx}/msg/msgSmsRecord/showSmsPage";
                            } else {
                                return;
                            }
                        } else if ("验证码错误" == data.message) {
                            alert("验证码错误！");
                        } else if ("验证码已过期" == data.message) {
                            alert("验证码已过期！");
                        }
                    })
            } else {
                alert('请输入验证码！')
            }
        })
        $(".queren").click(function () {
            $(".yanzheng").css("display", "none");
        });

    })

</script>

</html>
