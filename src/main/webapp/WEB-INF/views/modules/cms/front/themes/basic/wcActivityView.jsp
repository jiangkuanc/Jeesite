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
            line-height: 30px;
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
        <li><a href="${ctx}/cms/article/xyjyhuodong">信用教育活动</a></li>
        <li>信用教育活动—已完成</li>
        <li id="pro" class="lg-active"></li>
    </ol>
</div>
<div class="index-banner">
    <ul class="" style="padding-left:0;">
        <li><img src="${ctxStatic}/style/images/xyjy-banner1_02.png" width="1440px" height="358px" alt=""></li>
    </ul>
</div>
<div class="row">
    <div class="xyjyjt-content">
        <c:forEach items="${wcActivityDetails}" var="wcActivityDetails" varStatus="status">
            <ul class="jyjtList clearfix">
                <li class="pull-left" style="font-size:25px" id="title">${wcActivityDetails.title}</li>
                <li class="pull-left" style="margin-left:40px">活动讲师：${wcActivityDetails.speaker}</li>
                <li class="pull-left" style="margin-left:50px">活动时间：<fmt:formatDate
                        value="${wcActivityDetails.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;至
                    <fmt:formatDate value="${wcActivityDetails.weightDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </li>
            </ul>
            <div class="prediv" style="width:100%;word-wrap: break-word;">
                <span>关键字&emsp;：</span>${wcActivityDetails.keywords}</div>
            <div class="prediv" style="width:100%;word-wrap: break-word;">
                <span>活动摘要：</span>${wcActivityDetails.description}</div>
            <div class="prediv"
                 style="width:100%;word-wrap: break-word;padding:0 50px">${wcActivityDetails.articleData.content}</div>
            <div class="prediv" style="width:100%;word-wrap: break-word;">
                <span>活动寄语：</span>${wcActivityDetails.eventMessage}</div>
        </c:forEach>

    </div>


</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>