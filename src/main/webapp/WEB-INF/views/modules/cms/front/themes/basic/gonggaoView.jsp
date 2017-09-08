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
        .zh {
            border-bottom: 1px solid #EAEAEC;
        }

        .breadcrumb {
            margin: 0.5% 0 0.5% 12%;
        }

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

    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="row">
    <div class="zh">
        <ol class="breadcrumb update">
            <li><b>当前位置：</b></li>
            <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
            <li><a href="${ctx}/cms/article/gonggao">平台公告</a></li>
            <li id="pro" class="lg-active"></li>
        </ol>
    </div>
    <div class="xyjyjt-content" style="min-height:500px">
        <c:forEach items="${gonggaoDetails}" var="gonggaoDetails" varStatus="status">
            <div class="xyjyjt-content-top">

                <h2 style="color:#555555;font-size:20px;text-align:center;padding-bottom:5px;padding-top:30px;margin:25px 0;"> ${gonggaoDetails.category.name }</h2>
                <div style="border-bottom:1px solid red; text-align:center;padding:5px;margin:25px 0;">
                    发布者：${gonggaoDetails.speaker} &nbsp;来源：${gonggaoDetails.articleData.copyfrom} &nbsp;
                    点击数：${gonggaoDetails.hits} &nbsp;发布时间：<fmt:formatDate value="${gonggaoDetails.updateDate}"
                                                                          pattern="yyyy-MM-dd HH:mm:ss"/></div>
                <c:if test="${not empty gonggaoDetails.description}">
                    <div>摘要：${gonggaoDetails.description}</div>
                </c:if>
                <span class="clearfix"></span>
            </div>
            <h4 style="color:#000;font-size:16px;text-align:center;padding-bottom:5px;padding-top:0px;margin:25px 0;"
                id="title">${gonggaoDetails.title}</h4>
            <div class="prediv" style="width:100%;word-wrap: break-word;">${gonggaoDetails.articleData.content}</div>
        </c:forEach>
    </div>


</div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

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
            theme: '${site.theme}', 'category.id': '${category.id}',
            contentId: '${article.id}', title: '${article.title}', pageNo: n, pageSize: s, date: new Date().getTime()
        }, function (data) {
            $("#comment").html(data);
        });
    }
</script>
</body>
</html>