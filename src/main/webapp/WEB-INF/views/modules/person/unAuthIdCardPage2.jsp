<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
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
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb">
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">身份认证</li>
    </ol>
</div>
<!--内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <div class="zh-right pull-left zhaimima ">
        <div class="renzheng ">
            <h3 class="zhai-mima rz-h3">身份认证</h3>
            <form id="interviewForm" method="post" class="form-horizontal " style="margin-top: 35px;"
                  action="${ctx}/user/idCardCertify/certify">
                <div class="form-group">
                    <label class="col-lg-2 control-label">姓名：</label>
                    <div class="col-lg-5 ">
                        <c:choose>
                            <c:when test="${p2pRegUserCertify.realName==''||p2pRegUserCertify.realName==null}">
                                <input type="text" class="form-control sfrz" value="无"/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify.realName!=''||p2pRegUserCertify.realName!=null}">
                                <input type="text" class="form-control sfrz" placeholder="${p2pRegUserCertify.realName}"
                                       value="${p2pRegUserCertify.realName}" readonly/>
                            </c:when>
                        </c:choose>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">我的身份证号：</label>
                    <div class="col-lg-5 ">
                        <c:choose>
                            <c:when test="${p2pRegUserCertify.idNumber==''||p2pRegUserCertify.idNumber==null}">
                                <input type="text" class="form-control sfrz" value="无"/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify.idNumber!=''||p2pRegUserCertify.idNumber!=null}">
                                <input type="text" class="form-control sfrz" placeholder="${p2pRegUserCertify.idNumber}"
                                       value="${p2pRegUserCertify.idNumber}" readonly/>
                            </c:when>
                        </c:choose>
                    </div>
                </div>

                <!-- idCardInhand -->
                <div class="form-group">
                    <label class="col-lg-2 control-label">手持身份证照片：</label>
                    <div class="col-lg-5 ">
                        <c:choose>
                            <c:when test="${p2pRegUserCertify.idCardInhand==''||p2pRegUserCertify.idCardInhand==null}">
                                <input type="text" class="form-control sfrz" value="无"/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify.idCardInhand!=''||p2pRegUserCertify.idCardInhand!=null}">
                                <img src="${ctx}/image/test?path=${fns:getConfig('p2pRegUserCertify.idCardInhand')}"/>
                            </c:when>
                        </c:choose>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证正面照片：</label>
                    <div class="col-lg-5 ">
                        <c:choose>
                            <c:when test="${p2pRegUserCertify.idCardFront==''||p2pRegUserCertify.idCardFront==null}">
                                <input type="text" class="form-control sfrz" value="无"/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify.idCardFront!=''&&p2pRegUserCertify.idCardFront!=null&&p2pRegUserCertify.}">
                                <img src="${ctx}/image/test?path=${fns:getConfig('p2pRegUserCertify.idCardFront')}"/>
                            </c:when>
                        </c:choose>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">身份证背面照片：</label>
                    <div class="col-lg-5 ">
                        <c:choose>
                            <c:when test="${p2pRegUserCertify.idCardBack==''||p2pRegUserCertify.idCardBack==null}">
                                <input type="text" class="form-control sfrz" value="无"/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify.idCardBack!=''||p2pRegUserCertify.idCardBack!=null}">
                                <img src="${ctx}/image/test?path=${fns:getConfig('p2pRegUserCertify.idCardBack')}"/>
                            </c:when>
                        </c:choose>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">认证状态：</label>
                    <div class="col-lg-5 ">
                        <c:choose>
                            <c:when test="${p2pRegUserCertify.auditState==null&&p2pRegUserCertify.auditState=='2'}">
                                <span id="wrz">认证失败</span>
                                <a href="${ctx}/user/idCardCertify/certify" class="wrz-btn">
                                    <button class="btn">立刻认证</button>
                                </a>
                            </c:when>
                            <c:when test="${p2pRegUserCertify.auditState=='1'}">
                                <span id="wrz">已认证</span>
                            </c:when>
                            <c:when test="${p2pRegUserCertify.auditState=='3'}">
                                <span id="wrz">审核中</span>
                            </c:when>

                        </c:choose>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-2 control-label">状态说明：</label>
                    <div class="col-lg-5 ">
                        <c:choose>
                            <c:when test="${p2pRegUserCertify!=null&&p2pRegUserCertify.auditState==1}">
                                <input type="text" class="form-control sfrz" placeholder="认证成功" value="${'认证成功'}"
                                       readonly/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify!=null&&p2pRegUserCertify.auditState==2}">
                                <input type="text" class="form-control sfrz" placeholder="认证失败" value="${'未认证'}"
                                       readonly/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify!=null&&p2pRegUserCertify.auditState==3}">
                                <input type="text" class="form-control sfrz" placeholder="认证中" value="${'认证中'}"
                                       readonly/>
                            </c:when>
                            <c:when test="${p2pRegUserCertify==null}">
                                <input type="text" class="form-control sfrz" placeholder="无" value="无"/>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="clearfix"></div>
    <!--账户总览内容区域结束-->
    <!-- 引入footer文件 -->
    <%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>


</body>
</html>
  