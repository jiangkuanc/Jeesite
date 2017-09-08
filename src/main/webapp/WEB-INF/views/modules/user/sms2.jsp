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
    <%-- <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css"> --%>
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhzl.css">

    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <%-- <script type="text/javascript" src="${ctxStatic}/dist/js/jcalculator.js"></script> --%>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
    <script type="text/javascript">
        function checkForm() {
            var phone = $('#phone').val();
            var reg = /^1(3|4|5|7|8)\d{9}$/;
            $.ajax({
                type: 'POST',
                url: '${ctx}/sys/user/getByPhone',
                data: {'phone': phone},
                success: function (result) {
                    data = eval("(" + result + ")");
                    if (phone == '') {
                        alert('手机号不能为空！');
                        return;
                    } else if (!reg.test(phone)) {
                        alert('手机号格式错误！');
                        return;
                    } else if (data.valid == false) {
                        alert('手机号已被绑定！');
                    } else {
                        $('#defaultForm').submit();
                    }
                }
            });
        }
    </script>
</head>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
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
<!--账户总览页面-->
<!-- 引入账户菜单文件 -->
<%-- <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp"%> --%>

<!--左侧内容区域结束-->
<!--右侧内容区域-->
<div class="zh-right pull-left yanzheng " style="margin-bottom: 200px;">
    <form id="defaultForm" method="post" class="form-horizontal youxiangyz" action="${ctx}/msg/msgSmsRecord/sendSms">
        <h3>手机认证</h3>
        <div class="form-group shuru">
            <label class="col-sm-3 control-label ">输入我的手机号：</label>
            <div class="col-sm-5" style="padding:0px 15px">
                <input id="phone" type="text" class="form-control" name="smsPhone" placeholder="${smsPhonePlaceHonder}"
                       value="${smsPhone}"/>
            </div>
        </div>
        <p class="zt">
            <span>状态：</span>
            <b>
                已绑定
            </b>
        </p>

        <div class="form-group" style=" text-align: center;">
            <div class="col-lg-7 col-lg-offset-2" style="margin-left: 0; width: 90%;margin-top:30px">
                <button type="button" class="btn sure-yz" name="signup" value="Sign up" onclick="checkForm()">发送手机验证码
                </button>
            </div>
        </div>
    </form>
    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<div style="height:100%;"></div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>
