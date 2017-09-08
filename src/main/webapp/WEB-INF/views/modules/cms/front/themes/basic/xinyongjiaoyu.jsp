<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
    <style type="text/css">
        .myCss {
            margin-left: -60px
        }

        .xyjy-content-top .xyjy-content-top-top .xyjy-content-top-top-right {
            height: 34px;
        }

        .xyjy-content-bot .xyjy-content-top-top .xyjy-content-top-top-right {
            height: 34px;
        }
    </style>
</head>

<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li class="lg-active">信用教育</li>
    </ol>
</div>
<div class="index-banner">
    <ul class="" style="padding-left:0;">
        <li><img src="${ctxStatic}/style/images/xyjy-banner1_02.png" width="1440px" height="358px" alt=""></li>
    </ul>
</div>

<div class="xyjy-content-top">
    <div class="xyjy-content-top-top">
        <div class="xyjy-content-top-top-left pull-left">
            <h3>信用教育讲堂</h3>
        </div>
        <div class="xyjy-content-top-top-right pull-left">
            <a href="${ctx}/cms/article/xyjyjiangtang">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="xyjy-content-top-bot">

        <c:forEach items="${publishArticleList}" var="article" varStatus="i" begin="0" end="3">
            <div class="xyjy-content-top-bot-content pull-left">
                <c:forEach var="img" items="${fn:split(article.image,'|') }"
                           varStatus="status">
                    <p class=""><a href="${ctx}/cms/article/JiangTangDetails?pid=${article.id}"><img alt=""
                                                                                                     src="${article.image }"
                                                                                                     height="180px"
                                                                                                     width="180px"></a>
                    </p>
                </c:forEach>
                <p class="xyjy-content-top-bot-content-p-1"><span class=""></span><a class=""
                                                                                     href="${ctx}/cms/article/JiangTangDetails?pid=${article.id}"
                                                                                     style="color:${article.color}">${fns:abbr(article.title,25)}</a>
                </p>
                <p class="xyjy-content-top-bot-content-p-1">${article.lectureNumber}</p>
            </div>
        </c:forEach>

        <div class="clearfix"></div>
    </div>
</div>

</div>

<div class="xyjy-content-top" style="margin-top: 30px;">
    <div class="xyjy-content-top-top">
        <div class="xyjy-content-top-top-left pull-left">
            <h3>信用教育视频</h3>
        </div>
        <div class="xyjy-content-top-top-right pull-left">
            <a href="${ctx}/cms/link/xyjyshipin">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="xyjy-content-top-bot">
        <c:forEach items="${linkList}" var="link" varStatus="i" begin="0" end="3">
            <div class="xyjy-content-top-bot-content pull-left">
                <c:forEach var="img" items="${fn:split(link.image,'|') }" varStatus="status">
                    <p class="pull-left"><a href="${ctx}/cms/link/videodetails?pid=${link.id}&siteId=1"><img alt=""
                                                                                                             src="${link.image }"
                                                                                                             height="180px"
                                                                                                             width="180px"></a>
                    </p>
                </c:forEach>
                <div class="clearfix"></div>
                <p class="xyjyjt-content-top-bot-content-left-p-1 myCss" align="center">主讲人：${link.speaker}</p>
                <p class="xyjy-content-top-bot-content-p-1 myCss"><span class="pull-right"></span><a
                        href="${ctx}/cms/link/videodetails?pid=${link.id}&siteId=1" style="color:${link.color}"
                        title="${title }">${fns:abbr(link.title,25)}</a></p>
            </div>
        </c:forEach>
        <div class="clearfix"></div>
    </div>
</div>

<div class="xyjy-content-bot" style="margin-top: 30px; margin-bottom: 30px;">

    <div class="xyjy-content-top-top">
        <div class="xyjy-content-top-top-left pull-left">
            <h3>信用教育活动</h3>
        </div>
        <div class="xyjy-content-top-top-right pull-left">
            <a href="${ctx}/cms/article/xyjyhuodong">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="xyjy-content-bot-bot pull-left">
        <h4 class="xyjy-content-bot-bot-title">进行中的活动</h4>
        <!-- <div class="xyjy-content-bot-bot-bg"></div> -->
        <div class="xyjy-content-bot-bot-content" style="margin-left:20px;">
            <%--  <img src="${ctxStatic}/style/images/xyjy-index-bot-1_03.png" alt="" class="pull-left">   --%>
            <ul class="pull-left" style='padding:20px 0 0 0;'>
                <c:forEach items="${findJingXingList}" var="article" begin="0" end="4">
                    <li><p><span class="pull-right"></span><a
                            href="${ctx}/cms/article/jxActivityDetails?pid=${article.id}"
                            style="color:${article.color}">${fns:abbr(article.title,28)}</a></p></li>
                </c:forEach>
            </ul>
            <span class="clearfix"></span>
        </div>
    </div>

    <div class="xyjy-content-bot-bot-center pull-left"></div>
    <div class="xyjy-content-bot-bot-right pull-left">
        <h4 class="xyjy-content-bot-bot-title">已完成的活动</h4>
        <!-- <div class="xyjy-content-bot-bot-bg"></div> -->
        <div class="xyjy-content-bot-bot-content" style="margin-left:20px;">
            <%-- <img src="${ctxStatic}/style/images/xyjy-index-bot-1_04.jpg" alt="" class="pull-left">  --%>
            <ul class="pull-left" style='padding:20px 0 0 0;'>
                <c:forEach items="${findWanChengList}" var="article" begin="0" end="4">
                    <li><p><span class="pull-right"></span><a
                            href="${ctx}/cms/article/wcActivityDetails?pid=${article.id}"
                            style="color:${article.color}">${fns:abbr(article.title,28)}</a></p></li>
                </c:forEach>
            </ul>
            <span class="clearfix"></span>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>
<script>
</script>