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
    <style>
        .index-xinyong .indxe-xinyong-top .index-xinyong-top-left {
            width: 24%;
        }

        .index-xinyong .indxe-xinyong-top .index-xinyong-top-right {
            width: 76%;
        }

        .index-xinyong .indxe-xinyong-bot .index-xinyong-bot-right {
            width: 100%;
        }

        .table > tbody > tr > td {
            width: 26%;
            border-top: 0;
            padding-left: 20px;
        }

        .table > tbody > tr > td:nth-of-type(3) {
            width: 16%;
            text-align: center;
        }

        .table > tbody > tr > td:nth-of-type(2) {
            padding-left: 20px;
        }

        .index-xinyong .indxe-xinyong-bot .index-xinyong-bot-right h3 {
            line-height: 40px;
        }

        .index-xinyong .indxe-xinyong-bot .index-xinyong-bot-right .index-xinyong-bot-right-bg {
            margin-top: 0
        }

        .index-xinyong .indxe-xinyong-bot .index-xinyong-bot-right .index-xinyong-bot-right-bg {
            margin-left: 25px
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页</a></li>
        <li><a href="${ctx}/cms/article/xinyongjiaoyu">信用教育</a></li>
        <li class="lg-active">信用教育活动</li>
    </ol>
</div>
<div class="index-banner">
    <ul class="">
        <li><img src="${ctxStatic}/dist/images/xyjy-banner1_02.jpg" width="1440px" height="358px" alt=""></li>
    </ul>
</div>
<div class="index-xinyong">
    <div class="indxe-xinyong-top clearfix">
        <div class="index-xinyong-top-left pull-left">
            <h3>信用教育活动—进行中</h3>
        </div>
        <div class="index-xinyong-top-right pull-left">
            <!--  <a href="#">了解更多&nbsp;&nbsp;>></a> -->
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="indxe-xinyong-bot clearfix">
        <div class="index-xinyong-bot-right pull-left" style="width:26%">
            <h3>活动名称</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
        <div class="index-xinyong-bot-right pull-left" style="width:26%;margin-left:2%">
            <h3>活动主题</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
        <div class="index-xinyong-bot-right pull-left" style="width:16%;margin-left:2%;">
            <h3>活动讲师</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
        <div class="index-xinyong-bot-right pull-left" style="width:26%;margin-left:2%;">
            <h3>活动时间</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
    </div>
    <div class="indxe-xinyong-bot">
        <div class="index-xinyong-bot-right">
            <table class="table">
                <tbody id="hdjxz">
                <c:forEach items="${findJingXingList}" var="article" varStatus="i">
                    <tr>
                        <td><a href="${ctx}/cms/article/signUpActivities?pid=${article.id}">大公国际举办第${i.count }期活动</a>
                        </td>
                        <td><a href="${ctx}/cms/article/jxActivityDetails?pid=${article.id}"
                               style="color:${article.color}"
                               title="${article.title }">${fns:abbr(article.title,25)}</a></td>
                        <td>${fns:abbr(article.speaker,20)}</td>
                        <td style="text-align: center;"><fmt:formatDate value="${article.createDate}"
                                                                        pattern="yyyy-MM-dd"/>&nbsp;至&nbsp;<fmt:formatDate
                                value="${article.weightDate}" pattern="yyyy-MM-dd"/></td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="holder1"></div>
</div>
<div class="index-xinyong">
    <div class="indxe-xinyong-top clearfix">
        <div class="index-xinyong-top-left pull-left">
            <h3>信用教育活动—已完成</h3>
        </div>
        <div class="index-xinyong-top-right pull-left">
            <!--  <a href="#">了解更多&nbsp;&nbsp;>></a> -->
        </div>
    </div>
    <div class="indxe-xinyong-bot clearfix">
        <div class="index-xinyong-bot-right pull-left" style="width:26%">
            <h3>活动名称</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
        <div class="index-xinyong-bot-right pull-left" style="width:26%;margin-left:2%">
            <h3>活动主题</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
        <div class="index-xinyong-bot-right pull-left" style="width:16%;margin-left:2%;">
            <h3>活动讲师</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
        <div class="index-xinyong-bot-right pull-right" style="width:26%;">
            <h3>活动时间</h3>
            <div class="index-xinyong-bot-right-bg"></div>
        </div>
    </div>
    <div class="indxe-xinyong-bot">
        <div class="index-xinyong-bot-right">
            <table class="table">
                <tbody id="hdjywc">
                <c:forEach items="${findWanChengList}" var="article" varStatus="i">

                    <tr>
                            <%-- <td><a href="${ctx}/cms/article/completedActivities?pid=${article.id}">大公国际举办第${i.count }期活动</a></td> --%>
                        <td><a href="${ctx}/cms/article/wcActivityDetails?pid=${article.id}">大公国际举办第${i.count }期活动</a>
                        </td>
                        <td><a href="${ctx}/cms/article/wcActivityDetails?pid=${article.id}"
                               style="color:${article.color}"
                               title="${article.title }">${fns:abbr(article.title,25)}</a></td>
                        <td>${fns:abbr(article.speaker,20)}</td>
                        <td style="text-align: center;"><fmt:formatDate value="${article.createDate}"
                                                                        pattern="yyyy-MM-dd"/>&nbsp;至&nbsp;<fmt:formatDate
                                value="${article.weightDate}" pattern="yyyy-MM-dd"/></td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="holder2"></div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/style/js/bootstrap.min.js"></script>
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
                perPage: 5,
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
        fenye("div.holder1", "hdjxz");
        fenye("div.holder2", "hdjywc");

    });
</script>
</body>
</html>