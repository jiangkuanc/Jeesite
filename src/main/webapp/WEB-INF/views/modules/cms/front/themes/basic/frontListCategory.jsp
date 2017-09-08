<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/style/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/xyjy.css">
    <script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
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
            <a href="${ctx}/list-29${urlSuffix}">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="xyjy-content-top-bot">
        <c:forEach items="${fnc:getArticleList(site.id, 29, 8, '')}" var="article">
            <div class="xyjy-content-top-bot-content pull-left">
                <div class="xyjy-content-top-bot-content pull-left">
                    <img src="${ctxStatic}/style/images/xyjy-index-top_09.png" alt="">
                    <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a href="${article.url}"
                                                                                                   style="color:${article.color}">${fns:abbr(article.title,28)}</a>
                    </p>
                </div>
            </div>
        </c:forEach>
        <div class="clearfix"></div>
    </div>
</div>
<div class="xyjy-content-top" style="margin-top: 30px;">
    <div class="xyjy-content-top-top">
        <div class="xyjy-content-top-top-left pull-left">
            <h3>信用教育视频</h3>
        </div>
        <div class="xyjy-content-top-top-right pull-left">
            <a href="${ctx}/list-30${urlSuffix}">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="xyjy-content-top-bot">
        <c:forEach items="${fnc:getLinkList(site.id, 30, 8, '')}" var="link">
            <div class="xyjy-content-top-bot-content pull-left">
                <img src="${ctxStatic}/style/images/xyjy-index-top_09.png" alt="">
                <p class="xyjy-content-top-bot-content-p-1"><span class="pull-right"></span><a href="${link.href}"
                                                                                               style="color:${link.color}">${fns:abbr(link.title,28)}</a>
                </p>
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
            <a href="${ctx}/list-31${urlSuffix}">了解更多&nbsp;&nbsp;>></a>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="xyjy-content-bot-bot pull-left">
        <h4 class="xyjy-content-bot-bot-title">进行中的活动</h4>
        <div class="xyjy-content-bot-bot-bg"></div>
        <div class="xyjy-content-bot-bot-content">
            <img src="${ctxStatic}/style/images/xyjy-index-bot-1_03.png" alt="" class="pull-left">
            <ul class="pull-left">
                <!--  <li><span class="pull-right"></span><a href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}" style="color:${article.color}">${fns:abbr(article.title,40)}</a></li>-->
                <%-- <li><p><a href="${ctx}/view-31-62139a54aba246bbac5234457cee945a${urlSuffix}">${fns:abbr(article.title,40)}</a></p></li> --%>
                <c:forEach items="${fnc:getArticleList(site.id, 31, 8, '')}" var="article">
                    <li><p><span class="pull-right"></span><a href="${article.url}"
                                                              style="color:${article.color}">${fns:abbr(article.title,28)}</a>
                    </p></li>
                </c:forEach>
            </ul>
            <span class="clearfix"></span>
        </div>
    </div>
    <div class="xyjy-content-bot-bot-center pull-left"></div>
    <div class="xyjy-content-bot-bot-right pull-left">
        <h4 class="xyjy-content-bot-bot-title">已完成活动</h4>
        <div class="xyjy-content-bot-bot-bg"></div>
        <div class="xyjy-content-bot-bot-content">
            <img src="${ctxStatic}/style/images/xyjy-index-bot-1_03.png" alt="" class="pull-left">
            <ul class="pull-left">
                <li><p><a href="#">大公国际举办第七期走进大公活动</a></p></li>
                <li><p><a href="#">大公国际举办第七期走进大公活动</a></p></li>
                <li><p><a href="#">大公国际举办第七期走进大公活动</a></p></li>
                <li><p><a href="#">大公国际举办第七期走进大公活动</a></p></li>
                <li><p><a href="#">大公国际举办第七期走进大公活动</a></p></li>
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