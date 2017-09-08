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
    <script type="text/javascript">
        var userId = '${user.id}';
        function contactInfo() {
            $.ajax({
                type: 'POST',
                url: '${ctx}/user/p2pUserInformation/findContactInfo',
                data: {'userId': userId},
                success: function (data) {
                    if (data != null && data != '') {
                        data = eval('(' + data + ')');
                        $('#name').val(data.contactName);
                        $('#address').val(data.contactAddress);
                        $('#phone').val(data.contactPhone);
                        $('#post').val(data.contactPost);
                        document.onkeydown = function (event) {
                            if (window.event) {
                                event = window.event;
                            }
                            if (event.keyCode == 13) {
                                document.getElementById("save").click();
                            }
                        }
                    }
                }
            });
            $('#myModal').modal();
        }
        function doSubmit() {
            var name = $('#name').val();
            var address = $('#address').val();
            var phone = $('#phone').val();
            var post = $('#post').val();
            if (checkForm(name, address, phone, post)) {
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/user/Institution/addContactInfo',
                    data: $('#defaultForm').serialize(),
                    success: function () {

                        //window.location.reload();
                        var html = '<li class="sz-text">联系信息</li><li class="sz-btn1"><button class="btn ysz">已设置</button></li>' +
                            '<li class="sz-text2">' + name + '</li><li  class="sz-btn2"><button class="btn" onclick="contactInfo()">更改</button></li>';
                        $('#ulul').html(html);
                        document.onkeydown = function (event) {
                            if (window.event) {
                                event = window.event;
                            }
                            if (event.keyCode == 13) {

                            }
                        }
                        $('#myModal').modal("hide");
                    }
                });
            }
        }

        $(function () {
            $('#cancel').click(function () {
                document.onkeydown = function (event) {
                    if (window.event) {
                        event = window.event;
                    }
                    if (event.keyCode == 13) {

                    }
                }
            });
        });

        function checkForm(name, address, phone, post) {
            if (name == '' || name == null || address == '' || address == null ||
                phone == '' || phone == null || post == '' || post == null) {
                alert('信息请填写完整！');
                return false;
            }
            var nameReg = /^[\u4E00-\u9FA5]{2,5}$/;
            var phoneReg = /^1(3|4|5|7|8)\d{9}$/;
            if (!nameReg.test(name)) {
                alert('姓名格式输入有误！');
                return false;
            }
            if (!phoneReg.test(phone)) {
                alert('手机格式输入有误！');
                return false;
            }
            return true;
        }


    </script>
</head>
<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<!--右侧内容区域-->
<div class="zh-right pull-left shezhi ">
    <h3 class="">账户设置</h3>
    <div>
        <ul>
            <c:if test="${user.password != null }">
                <li class="sz-text">密码设置</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已设置</button>
                </li>
                <li class="sz-text2">上次登录时间：<fmt:formatDate value="${user.loginDate}"
                                                            pattern="yyyy-MM-dd hh:mm:ss"/></li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=pwdManager">
                        <button class="btn">修改密码</button>
                    </a>
                </li>
            </c:if>
            <c:if test="${user.password == null }">
                <li class="sz-text">密码设置</li>
                <li class="sz-btn1">
                    <button class="btn wsz">未设置</button>
                </li>
                <li class="sz-text2">上次登录时间：</li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=pwdManager">
                        <button class="btn">设置密码</button>
                    </a>
                </li>
            </c:if>
        </ul>
        <ul>
            <c:if test="${p2pUserInformation.userpic != null}">
                <li class="sz-text">安全头像</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已设置</button>
                </li>
                <li class="sz-text2">用于确认访问的网站是否为大公数据官网</li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=setUserpic">
                        <button class="btn ">更改</button>
                    </a>
                </li>
            </c:if>
            <c:if test="${p2pUserInformation.userpic == null}">
                <li class="sz-text">安全头像</li>
                <li class="sz-btn1">
                    <button class="btn wsz">未设置</button>
                </li>
                <li class="sz-text2">用于确认访问的网站是否为大公数据官网</li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=setUserpic">
                        <button class="btn ">立即设置</button>
                    </a>
                </li>
            </c:if>
        </ul>
        <ul>
            <c:if test="${user.phone != null}">
                <li class="sz-text">手机认证</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已认证</button>
                </li>
                <li class="sz-text2">
                    <c:if test="${user.phone!=null}">${user.phone.replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2")}</c:if>
                </li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=updatePhone">
                        <button class="btn">更改</button>
                    </a>
                </li>
            </c:if>
            <c:if test="${user.phone == null}">
                <li class="sz-text">手机认证</li>
                <li class="sz-btn1">
                    <button class="btn wsz">未认证</button>
                </li>
                <li class="sz-text2">${user.phone}</li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=updatePhone">
                        <button class="btn">立即认证</button>
                    </a>
                </li>
            </c:if>

        </ul>

        <ul>
            <c:if test="${user.email != null}">
                <li class="sz-text">邮箱认证</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已认证</button>
                </li>
                <li class="sz-text2">
                        <%--  ${user.email } --%>
                    <c:if test="${user.email!=null}">${user.email.replaceAll("(^.{4}).{3}","$1***")}</c:if>
                        <%--  <c:if test="${user.email!=null}">${user.email.replaceAll("(\\d{1})\\d{4}(\\d{4})","$1****$2")}</c:if>		                --%>
                </li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/validEmailCode/showEmail">
                        <button class="btn">更改</button>
                    </a>
                </li>
            </c:if>
            <c:if test="${user.email == null}">
                <li class="sz-text">邮箱认证</li>
                <li class="sz-btn1">
                    <button class="btn wsz">未认证</button>
                </li>
                <li class="sz-text2"></li>
                <li class="sz-btn2">
                    <a href="${ctx}/user/validEmailCode/showEmail">
                        <button class="btn">立即认证</button>
                    </a>
                </li>
            </c:if>
        </ul>

        <ul id="ulul">
            <c:if test="${p2pUserInformation.contactName != null}">
                <li class="sz-text">联系信息</li>
                <li class="sz-btn1">
                    <button class="btn ysz">已设置</button>
                </li>
                <li class="sz-text2">
                    <c:if test="${p2pUserInformation.contactName!=null}">
                        ${p2pUserInformation.contactName.substring(0, 1)}**
                    </c:if>
                </li>
                <li class="sz-btn2">
                    <button class="btn" onclick="contactInfo()">更改</button>
                </li>
            </c:if>
            <c:if test="${p2pUserInformation.contactName == null}">
                <li class="sz-text">联系信息</li>
                <li class="sz-btn1">
                    <button class="btn wsz">未设置</button>
                </li>
                <li class="sz-text2" id="review"></li>
                <li class="sz-btn2">
                    <button class="btn" onclick="contactInfo()">立即设置</button>
                </li>
            </c:if>
        </ul>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <form id="defaultForm" method="post" class="form-horizontal zh-modal">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">联系人：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <input type="text" id="name" class="form-control" name="contactName"
                                           required="required" style="height: 30px"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">联系电话：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <input type="text" id="phone" class="form-control" name="contactPhone"
                                           required="required" style="height: 30px"/>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-lg-3 control-label">联系地址：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <input type="text" id="address" name="contactAddress" class="form-control" value=""
                                           required="required" style="height: 30px"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">邮编：<span class="zh-hide">*</span></label>
                                <div class="col-lg-5">
                                    <input type="text" id="post" name="contactPost" class="form-control" value=""
                                           required="required" style="height: 30px"/>

                                </div>

                            </div>


                            <div class="form-group" style=" text-align: center;">
                                <div class="col-lg-9 col-lg-offset-3" style="margin-left: 0; width: 95%;">
                                    <button type="button" id="save" class="btn btn-primary zh-baocun" name="signup"
                                            value="Sign up" onclick="doSubmit()">保存
                                    </button>
                                    <button class="btn quxiao" data-dismiss="modal" id="cancel">取消</button>
                                </div>
                            </div>
                        </form>

                        <div class="clearfix"></div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>


    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

</body>
</html>
