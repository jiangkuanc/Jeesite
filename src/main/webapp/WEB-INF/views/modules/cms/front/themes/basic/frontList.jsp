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
    <link rel="stylesheet" href="${ctxStatic}/style/css/jeesite.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
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
        </div>
        <div class="clearfix"></div>
    </div>


    <div class="xyjy-content-top-bot">
        <div id="itemContainer1">
            <c:forEach items="${fnc:getArticleList(site.id, 29, 8, '')}" var="article">
                <div>
                    <div class="xyjy-content-top-bot-content pull-left">
                        <div class="xyjyjt-content-top-bot-content-left pull-left">
                            <img alt="" src="http://10.10.10.136:8008/dagongp2p/${fns:abbr(article.image,28)}">
                            <p class="xyjyjt-content-top-bot-content-left-p-1" align="center">第一讲</p>
                            <p align="center"><a href="${article.url}"
                                                 style="color:${article.color}">${fns:abbr(article.title,28)}</a></p>
                        </div>
                    </div>

                    <div class="xyjyjt-content-top-bot-content-right pull-left" style="margin-top:65px;">
                        <p>讲堂名称：<a href="${article.url}"
                                   style="color:${article.color}">${fns:abbr(article.title,28)}</a></p>
                        <p>讲堂作者：<a style="color:${article.color}">${fns:abbr(article.user.name,28)}</a></p>
                        <p>发布时间：<fmt:formatDate value="${article.beginDate}" pattern="yyyy-MM-dd"/></a></p>
                        <p class="pull-left" style="width: 70px;">内容简介：</p>
                        <p class="pull-right" style="width: 700px; margin-bottom: 20px;">
                            <a href="${article.url}"
                               style="color:${article.color}">${fns:abbr(article.description,28)}</a></p>
                    </div>


                    <div class="clearfix"></div>
                    <hr style="height:2px;border:none;border-bottom:1px dashed #cccccc; padding-bottom: 10px">
                </div>
            </c:forEach>
        </div>
        <div class="holder1"></div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/dist/js/jPages.min.js"></script>
<script>
    $(function () {
        function fenye(content, id) {
            $(content).jPages({
                containerID: id,
                first: '首页',
                last: '尾页',
                previous: '上页',
                next: '下页',
                perPage: 2,
                startPage: 1,
                startRange: 2,
                midRange: 3,
                endRange: 2,
                animation: 'wobble',
                keyBrowse: true,
                callback: function (pages, items) {
                    items.showing.find("img").trigger("turnPage");
                    items.oncoming.find("img").trigger("turnPage");
                }
            });
        };

        fenye("div.holder1", "itemContainer1");
    });
</script>
</body>
</html>