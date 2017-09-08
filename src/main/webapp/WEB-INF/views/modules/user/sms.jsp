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
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li><b>我的位置：</b></li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active">绑定手机号</li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con">
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
    <!--账户总览页面-->
    <!-- 引入账户菜单文件 -->
    <%-- <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp"%> --%>

    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left yanzheng ">
        <form id="defaultForm" method="post" class="form-horizontal youxiangyz"
              action="${ctx}/msg/msgSmsRecord/sendSms">
            <h3>绑定手机号</h3>
            <div class="form-group shuru">
                <label class="col-sm-3 control-label ">输入我的手机号：</label>
                <div class="col-sm-5" style="padding:0px 15px">
                    <input type="text" id="smsPhoneId" class="form-control" name="smsPhone" value="${phoneNumber}"/>
                </div>
            </div>
            <p class="zt" style="color:red">
                <span>状态：</span>
                <b>
                    已绑定
                </b>
            </p>

            <div class="form-group" style=" text-align: center;">
                <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                    <button id="btn_submit" type="submit" class="btn sure-yz" name="signup" value="Sign up" onclick="">
                        发送手机验证码
                    </button>
                </div>
            </div>
        </form>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

</body>
<script type="text/javascript">
    //1.验证手机号码正确性
    //2.如果用户未填写验证码,则不允许发送信息
    //3.禁止同一个号码重复点击验证
    $(function () {
        $("#btn_submit").attr("disabled", "disabled");
        $("#smsPhoneId").blur(function () {
            if ($("#smsPhoneId").val() == null || $("#smsPhoneId").val() == '' || $("#smsPhoneId").val() == undefined) {
                $("#btn_submit").attr("disabled", "disabled");
            }
            else {
                var phoneVal = $("#smsPhoneId").val();//获取输入手机号的值
                //if(!/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/i.test(mobile))
                if (/^1[34578]\d{9}$/i.test(phoneVal)) {
                    //后端校验该号码是否注册
                    if (remotePhoneVal(phoneVal)) {
                        $("#btn_submit").removeAttr("disabled");//如果前手机验证规则都满足的话,则移除按钮禁用的样式
                    }
                    else {
                        $("#btn_submit").attr("disabled", "disabled");
                    }
                }
                else {
                    $("#btn_submit").attr("disabled", "disabled");
                }
            }
        });
    })
    /**
     服务端校验该手机号的正确性
     */
    function remotePhoneVal(phoneVal, url) {

        return true;
    }
    /**
     远程校验登录密码
     */
    function remotePasswordVal(passwordVal, url) {

    }
    /**
     全局计数器
     每天的点击次数:CountByPerDay
     验证码的有效期：valCodeExpire

     */
    var GlobalCountObj = {
        countByPerDay: 5,
        valCodeExpire: 0.5 * 60 * 60
    }


    /**
     载入倒计时页面
     */
    function loadTimePage() {
        //存储倒计时变量
        var time = 60;//60秒
        var interval = setInterval(function () {
            if (time == 0) {//禁用该按钮状态
                $("#btn_time").attr("disabled", "disabled").val("还剩下" + (--time) + "秒");
                clearInterval(interval);
            } else {
                //激活该按钮状态
                //判断该用户一天之中是否超过5次(利用cookie技术)
                $("#btn_time").removeAttr("disabled");
            }

        }, 1000);//该定时器每秒钟执行1次

    }
    /**
     全局cookie函数
     */
    function setCookie(name, value) {
        //此cookie将被保存一天
        var days = 1;
        var date = new Date();
        exp.setTime(exp.getTime() + days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
    /**
     取cookie的函数
     */
    function getCookie(name) {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) return unescape(arr[2]);
        return null;
    }
    /**
     删除cookie函数
     */
    function delCookie(name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cVal = getCookie(name);
        if (cVal != null) {
            document.cookie = name + "=" + cVal + ";expires=" + exp.toGMTString();
        }
    }
</script>
</html>
