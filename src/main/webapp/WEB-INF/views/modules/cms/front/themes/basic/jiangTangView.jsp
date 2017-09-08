<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/style/css/xyjy.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var te = $("#title").html();
            $("#pro").html(te);
        })
        $(document).ready(function () {
            if ("${category.allowComment}" == "1" && "${article.articleData.allowComment}" == "1") {
                $("#comment").show();
                page(1);
            }
        });
        function page(n, s) {
            $.get("${ctx}/comment", {
                theme: '${site.theme}',
                'category.id': '${category.id}',
                contentId: '${article.id}',
                title: '${article.title}',
                pageNo: n,
                pageSize: s,
                date: new Date().getTime()
            }, function (data) {
                $("#comment").html(data);
            });
        }
    </script>
    <style>
        .breadcrumb li:first-child:after {
            /* padding:0px; */
            color: #ccc;
            content: ""
        }

        .prediv pre {
            white-space: pre-wrap; /* CSS-3 */
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            background-color: #fff;
            border: 0;
            border-radius: 0;
        }

        .xyjyjt-content-mbx .breadcrumb li:not(:last-of-type) {
            color: #909090;
        }

        .xyjyjt-content {
            width: 1100px;
            margin: 0 auto;
        }

        .xyjyjt-content-mbx .breadcrumb li:first-of-type, .xyjyjt-content-mbx .breadcrumb li:last-of-type {
            color: #373737;
            font-weight: bold;
        }

        .jyjtList {
            margin: 30px 0;
        }

        .jyjtList li {
            line-height: 30px;
            margin-right: 50px;
        }

        .prediv {
            line-height: 22px;
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
        <li><a href="${ctx}/cms/article/xinyongjiaoyu">信用教育</a></li>
        <li><a href="${ctx}/cms/article/xyjyjiangtang">信用教育讲堂</a></li>
        <li id="pro" class="lg-active"></li>
    </ol>
</div>
<div class="index-banner">
    <ul class="" style="padding-left:0;">
        <li><img src="${ctxStatic}/style/images/xyjy_02.jpg" width="1440px" height="358px" alt=""></li>
    </ul>
</div>
<div class="row">
    <div class="xyjyjt-content">
        <c:forEach items="${JiangTangDetails}" var="jiangTangDetails" varStatus="status">
            <ul class="jyjtList clearfix">
                <li style="font-size:25px" class="pull-left" id="title">${fns:abbr(jiangTangDetails.title,42)}</li>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li class="pull-left">讲堂作者：${jiangTangDetails.speaker}</li>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li class="pull-left">发表于：<fmt:formatDate value="${jiangTangDetails.createDate}"
                                                          pattern="yyyy-MM-dd HH:mm:ss"/></li>
            </ul>
            <div class="prediv" style="width:100%;word-wrap: break-word;"><span>关键字：</span>${jiangTangDetails.keywords}
            </div>
            <div class="prediv" style="width:100%;word-wrap: break-word;">
                <span>摘&emsp;要：</span>${jiangTangDetails.description}</div>
            <div class="prediv" style="width:100%;word-wrap: break-word;">
                <span>内&emsp;容：</span>${jiangTangDetails.articleData.content}</div>
        </c:forEach>

    </div>


</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>