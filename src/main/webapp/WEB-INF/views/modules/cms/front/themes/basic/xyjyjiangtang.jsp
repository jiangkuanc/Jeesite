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
    <script type="text/javascript">
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            return false;
        }
    </script>
</head>

<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/article/xinyongjiaoyu">信用教育</a></li>
        <li class="lg-active">信用教育讲堂</li>
    </ol>
</div>
<div class="index-banner">
    <ul class="" style="padding-left:0;">
        <li><img src="${ctxStatic}/style/images/xyjy-banner1_02.jpg" width="1440px" height="358px" alt=""></li>
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


    <div class="xyjy-content-top-bot" style="margin-bottom: 100px;">
        <div id="itemContainer1">
            <c:forEach items="${publishArticleList}" var="article" varStatus="i">
                <div>
                    <div class="xyjy-content-top-bot-content pull-left">
                        <div class="xyjyjt-content-top-bot-content-left pull-left">
                            <c:forEach var="img" items="${fn:split(article.image,'|') }" varStatus="status">
                                <p class="pull-left"><a
                                        href="${ctx}/cms/article/JiangTangDetails?pid=${article.id}"><img alt=""
                                                                                                          src="${article.image }"
                                                                                                          height="200px"
                                                                                                          width="200px"></a>
                                </p>
                            </c:forEach>
                            <div class="clearfix"></div>
                            </ul>
                            <p>${article.lectureNumber}</p>
                            <p align="center"><a href="${ctx}/cms/article/JiangTangDetails?pid=${article.id}"
                                                 style="color:${article.color}">${fns:abbr(article.title,28)}</a></p>
                        </div>
                    </div>
                    <div class="xyjyjt-content-top-bot-content-right pull-left" style="margin-top:65px;">
                        <p>讲堂名称：<a href="${ctx}/cms/article/JiangTangDetails?pid=${article.id}"
                                   style="color:${article.color}">${fns:abbr(article.title,80)}</a></p>
                        <p>讲堂作者：<a style="color:${article.color}">${fns:abbr(article.speaker,28)}</a></p>
                        <p>发布时间：<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        <p class="pull-left" style="width: 70px;">讲堂内容：</p>
                        <p class="pull-right" style="width: 700px; margin-bottom: 20px;">
                            <a href="${ctx}/cms/article/JiangTangDetails?pid=${article.id}"
                               style="color:${article.color}">${fns:abbr(article.description,200)}</a></p>
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
                /* animation: 'wobble', */
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