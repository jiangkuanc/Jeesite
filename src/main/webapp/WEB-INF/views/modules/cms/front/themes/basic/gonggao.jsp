<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
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
    <style>
        /*
        .xyjyjt-content-top-bot-content-right{width:750px;}
        .xyjyjt-content-top-bot-content-right p{display:inline-block;width:40%;}
        .xyjyjt-content-top-bot-content-right p:first-child{margin-right:130px;}
        .xyjyjt-content-top-bot-content-right p.pull-left{ width:80px;display:inline-block;margin-right:0;padding:0;}
        .xyjyjt-content-top-bot-content-right div.pull-right2{width:660px;display:inline-block;text-align:left;
        margin-bottom:10px;margin-left:0;} */
        .xyjy-content-top-top-left {
            margin-top: 10px
        }

        .update {
            margin: 1% 0 1% 12%
        }
    </style>
</head>

<body>

<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="clearfix"></div>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li class="lg-active">平台公告</li>
    </ol>
</div>

<div class="xyjy-content-top">
    <div class="xyjy-content-top-top clearfix">
        <div class="xyjy-content-top-top-left pull-left">
            <h3>平台公告</h3>
        </div>
        <div class="xyjy-content-top-top-right pull-left">
        </div>
    </div>
    <div class="xyjy-content-top-bot">
        <div id="itemContainer1">
            <c:forEach items="${gonggaoDetails}" var="article" varStatus="status">
                <%-- <div class="clearfix">
                    <div class="xyjyjt-content-top-bot-content-left " style="margin-top:5px;">
                         <c:forEach var="img" items="${fn:split(article.image,'|') }" varStatus="status">
                            <p class="pull-left"><img alt=""  src="${article.image }" height="180px" width="180px"></p>
                         </c:forEach>
                       </div>

                    <div class="xyjyjt-content-top-bot-content-right " style="margin-top:50px; margin-left:65px;">
                          <p >公告标题：<a href="${ctx}/cms/article/gonggaoDetails?pid=${article.id}" style="color:${article.color}">${fns:abbr(article.title,24)}</a></p>
                          <p >发布时间：<fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></p>
                          <p class="pull-left" >公告内容：</p>
                          <div class="pull-right2"  >
                          <a href="${ctx}/cms/article/gonggaoDetails?pid=${article.id}" style="color:${article.color}">${fns:abbr(article.articleData.content,300)}</a>
                      </div>
                    </div>
                </div> --%>
                <div style="width:1100px;height:180px;background:#fff;position:relative;margin:50px 0;">
                    <div style="width:180px;height:180px;margin-left:20px;border:1px solid #eee;position:absolute;top:0;left:0;">
                        <c:forEach var="img" items="${fn:split(article.image,'|') }" varStatus="status">
                            <img src="${article.image }" style="width:100%;height:100%;display:block;">
                        </c:forEach>
                    </div>
                    <div style="width:855px;height:180px;background:#fff;position:absolute;top:0;right:0;">
                        <div style="width:100%;height:30px; position:relative;top:40px;">
                            <div style="position:absolute;top:0;left:0;text-align:left;width:59%;height:30px;">
                                <p>公告标题：<a href="${ctx}/cms/article/gonggaoDetails?pid=${article.id}"
                                           style="color:${article.color}">${fns:abbr(article.title,50)}</a></p>
                            </div>
                            <div style="position:absolute;top:0;right:0;text-align:left;width:39%;height:30px;">
                                <p>发布时间：<fmt:formatDate value="${article.updateDate}" pattern="yyyy-MM-dd"/></p>
                            </div>
                        </div>
                        <div style="position:absolute;botttom:0;left:0;">
                            <div style="width:100px;position:absolute;top:40px;left:0;">
                                公告摘要：
                            </div>
                                <%-- <a href="${ctx}/cms/article/gonggaoDetails?pid=${article.id}" style="display:block;width:725px;line-height:20px;position:absolute;top:40px;left:80px;color:${article.color}">${fns:abbr(article.articleData.content,300)}</a> --%>
                            <a href="${ctx}/cms/article/gonggaoDetails?pid=${article.id}"
                               style="display:block;width:725px;line-height:20px;position:absolute;top:40px;left:80px;color:${article.color}">${article.description}</a>
                        </div>
                    </div>

                </div>


            </c:forEach>
        </div>
        <div class="holder1"></div>
    </div>
</div>
<!--  -->
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
                perPage: 3,
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