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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <link href="${ctxStatic}/dist/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <!--<script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>-->
    <style>
        .form-horizontal .form-group > label {
            color: #929292;
        }

        .myBtn {
            background-color: #f3444a;
            color: #fff;
            height: 22px;
            line-height: 4px;
            margin-left: 15px;
            padding: 0;
            width: 70px;
        }

        .Imargin {
            margin-top: 10px;
        }

        .noWrap {
            word-break: keep-all;
            white-space: nowrap;
        }
    </style>
    <script type="text/javascript">
        function abc() {
            window.location.href = "${ctx}/user/p2pUserInformation/financingPermission";
        }
    </script>
</head>

<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>

<c:if test="${p2pRegUserCertify.auditState == null}">
    <div class="zh-right pull-left zhaimima ">
        <div class="renzheng ">
            <h3 class="zhai-mima rz-h3">身份认证</h3>
            <form id="interviewForm" method="post" class="form-horizontal " style="margin-top: 35px;">
                <div class="form-group">
                    <label class="col-lg-2 control-label">姓名：</label>
                    <div class="col-lg-5 ">无
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">我的身份证号：</label>
                    <div class="col-lg-5 ">无
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">手持身份证照片：</label>
                    <div class="col-lg-5 ">无
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证正面照片：</label>
                    <div class="col-lg-5 ">无
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证背面照片：</label>
                    <div class="col-lg-5 ">无
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">认证状态：</label>
                    <div class="col-lg-5 ">
                        <span id="ytg">未认证</span>
                        <input type="button" value="立刻认证" class="btn myBtn" onclick="abc()"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">审核说明：</label>
                    <div class="col-lg-5 ">
                        <span class="shuoming">无</span>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
    </div>
</c:if>
<c:if test="${p2pRegUserCertify.auditState == 1}">
    <div class="zh-right pull-left zhaimima ">
        <div class="renzheng ">
            <h3 class="zhai-mima rz-h3">身份认证</h3>
            <form id="interviewForm" method="post" class="form-horizontal " style="margin-top: 35px;">
                <div class="form-group">
                    <label class="col-lg-2 control-label">姓名：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz" value="${p2pRegUserCertify.realName}" readonly/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">我的身份证号：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz" value="${p2pRegUserCertify.idNumber}" readonly/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">手持身份证照片：</label>
                    <div class="col-lg-5 ">
                        <img style="width:330px;height:200px" src="${p2pRegUserCertify.idCardInhandView}" alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证正面照片：</label>
                    <div class="col-lg-5 ">
                        <img style="width:330px;height:200px" src="${p2pRegUserCertify.idCardFrontView}" alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证背面照片：</label>
                    <div class="col-lg-5 ">
                        <img style="width:330px;height:200px" src="${p2pRegUserCertify.idCardBackView}" alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">认证状态：</label>
                    <div class="col-lg-5 " style="margin-top: 7px">
                        <span id="ytg" style="margin-top: 10%">已通过</span>
                        <a href="" class="wrz-btn">

                        </a>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">审核说明：</label>
                    <div class="col-lg-5 ">
                        <span class="shuoming">无</span>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
    </div>
</c:if>
<c:if test="${p2pRegUserCertify.auditState == 2}">
    <div class="zh-right pull-left zhaimima ">
        <div class="renzheng ">
            <h3 class="zhai-mima rz-h3">身份认证</h3>
            <form id="interviewForm" method="post" class="form-horizontal " style="margin-top: 35px;">
                <div class="form-group">
                    <label class="col-lg-2 control-label">姓名：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz" value="${p2pRegUserCertify.realName}" readonly/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">我的身份证号：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz" value="${p2pRegUserCertify.idNumber}" readonly/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">手持身份证照片：</label>
                    <div class="col-lg-5 ">
                        <img class="Imargin" style="width:330px;height:200px"
                             src="${p2pRegUserCertify.idCardInhandView}" alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证正面照片：</label>
                    <div class="col-lg-5 ">
                        <img class="Imargin" style="width:330px;height:200px" src="${p2pRegUserCertify.idCardFrontView}"
                             alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证背面照片：</label>
                    <div class="col-lg-5 ">
                        <img class="Imargin" style="width:330px;height:200px" src="${p2pRegUserCertify.idCardBackView}"
                             alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">认证状态：</label>
                    <div class="col-lg-5" style="margin-top: 5px">
                        <span id="ytg">未通过</span>
                        <input type="button" value="重新认证" class="btn myBtn" onclick="abc()"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">审核说明：</label>
                    <div class="col-lg-5 ">
                        <span class="shuoming Imargin">${p2pRegUserCertify.auditExplain}</span>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
    </div>

</c:if>
<c:if test="${p2pRegUserCertify.auditState == 3}">
    <div class="zh-right pull-left zhaimima ">
        <div class="renzheng ">
            <h3 class="zhai-mima rz-h3">身份认证</h3>
            <form id="interviewForm" method="post" class="form-horizontal " style="margin-top: 35px;">
                <div class="form-group">
                    <label class="col-lg-2 control-label">姓名：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz" value="${p2pRegUserCertify.realName}" readonly/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">我的身份证号：</label>
                    <div class="col-lg-5 ">
                        <input type="text" class="form-control sfrz" value="${p2pRegUserCertify.idNumber}" readonly/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">手持身份证照片：</label>
                    <div class="col-lg-5 ">
                        <img class="Imargin" style="width:330px;height:200px"
                             src="${p2pRegUserCertify.idCardInhandView}" alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证正面照片：</label>
                    <div class="col-lg-5 ">
                        <img class="Imargin" style="width:330px;height:200px" src="${p2pRegUserCertify.idCardFrontView}"
                             alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证背面照片：</label>
                    <div class="col-lg-5 ">
                        <img class="Imargin" style="width:330px;height:200px" src="${p2pRegUserCertify.idCardBackView}"
                             alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">认证状态：</label>
                    <div class="col-lg-5 " style="margin-top: 7px">
                        <span id="ytg">审核中</span>
                        <a href="" class="cx-btn">

                        </a>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">审核说明：</label>
                    <div class="col-lg-5 Imargin">无
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
    </div>
</c:if>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>
