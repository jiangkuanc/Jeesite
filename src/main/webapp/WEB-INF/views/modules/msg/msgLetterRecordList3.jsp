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
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css"/>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/manhuaDate.1.0.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhzl.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic }/dist/js/zhzl.js"></script>
    <script type="text/javascript" src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script>
    <style type="text/css">
        .selected {
            background: #f14349;
            color: #fff;
        }

        a {
            cursor: pointer;
        }

        .btna {
            -moz-user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            cursor: pointer;
            display: inline-block;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857;
            margin-bottom: 0;
            padding: 6px 12px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
        }

        .weizhi {
            float: right;
        }

        .btn:hover {
            color: #fff;
            cursor: default;
        }

        /*     	table{table-layout: fixed;} */
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
        <li>我的位置：</li>
        <li><a href="#">首页</a></li>
        <li><a href="#">我的账户</a></li>
        <li class="lg-active">消息中心</li>
    </ol>
</div>
<div class="zh-con">
    <!--左侧内容区域-->
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    </c:if>
    <div class="zh-right pull-left zhzl_xxzx">
        <h3>我的消息</h3>
        <ul class="xxList clearfix">
            <c:if test="${user.roleList[0].id == '102'}">
                <li class="pull-left">消息<span><a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">（${readJson + unReadJson}）</a></span>
                </li>
                <li class="pull-left">未读消息<span><a
                        href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter&readState=0">（${unReadJson}）</a></span>
                </li>
                <li class="pull-left">已读消息<span><a
                        href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter&readState=1">（${readJson}）</a></span>
                </li>
            </c:if>
            <c:if test="${user.roleList[0].id == '101'}">
                <li class="pull-left">消息<span><a
                        href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter">（${readJson + unReadJson}）</a></span>
                </li>
                <li class="pull-left">未读消息<span><a
                        href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter&readState=0">（${unReadJson}）</a></span>
                </li>
                <li class="pull-left">已读消息<span><a
                        href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter&readState=1">（${readJson}）</a></span></li>
            </c:if>
            <c:if test="${user.roleList[0].id == '104'}">
                <li class="pull-left">消息<span><a
                        href="${ctx}/msg/msgLetterRecord/getMsgList">（${readJson + unReadJson}）</a></span></li>
                <li class="pull-left">未读消息<span><a
                        href="${ctx}/msg/msgLetterRecord/getMsgList?readState=0">（${unReadJson}）</a></span></li>
                <li class="pull-left">已读消息<span><a href="${ctx}/msg/msgLetterRecord/getMsgList?readState=1">（${readJson}）</a></span>
                </li>
            </c:if>
        </ul>
        <div class="xxBox">
            <p class="xxHd">系统消息</p>
            <div class="xxCont">
                <p class="xxCont_1 ">${msgLetterRecord.title }</p>
                <p class="xxCont_3 ">${msgLetterRecord.content }</p>
                <p class="xxCont_4 ">丝路互金网信用信息服务平台</p>
                <p class="xxCont_5 ">发送于<fmt:formatDate value="${msgLetterRecord.sendDate }"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></p>
            </div>
        </div>
        <div class="zhzl_xxzx_bot clearfix">
            <c:if test="${user.roleList[0].id == '101'}">
                <a href="${ctx}/user/Institution/ctrlMenu?mode=msgCenter">返回消息列表</a>
            </c:if>
            <c:if test="${user.roleList[0].id == '102'}">
                <a href="${ctx}/user/p2pUserInformation/accountPermission?mode=msgCenter">返回消息列表</a>
            </c:if>
            <c:if test="${user.roleList[0].id == '104'}">
                <a href="${ctx}/msg/msgLetterRecord/getMsgList">返回消息列表</a>
            </c:if>
            <!--             <span id="sccxx">删除此消息</span> -->
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script type="text/javascript">
</script>
</html>