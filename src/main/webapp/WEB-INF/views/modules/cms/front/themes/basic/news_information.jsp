<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>信息产品</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/ydyl.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li class="active"><a href="#">新闻资讯</a></li>
    </ol>
</div>
<!--信息产品-->
<div class="contbox">
    <!-- <div class="index-xinyong bgColor"> -->
    <div class="pic_ttbox mgtop_30">
        <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
    </div>
    <div class="xmzb_box mgtop_30 bgColor">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left" style="width:22%;">
                <h3>一带一路新闻资讯</h3>
            </div>
            <div class="els_introduce_top-right pull-left" style="width:78%;"></div>
            <div class="clearfix"></div>
        </div>
        <div class="table-bot">
            <table class="table table_xxcp table-hover">
                <thead>
                <tr>
                    <th class="product">标题</th>
                    <th>发布时间</th>
                </tr>
                </thead>
                <tbody id="itemContainer">
                <tr class="kheight"></tr>
                <c:forEach items="${fnc:getArticleList(site.id, 63, 1000000, '')}" var="article">
                    <c:if test="${article.statusCode eq '5'}">
                        <tr>
                            <td class="product_text"><a href="${article.url}"
                                                        style="color:${article.color}">${fns:abbr(article.title,63)}</a>
                            </td>
                            <td><span><fmt:formatDate value="${article.beginDate}" pattern="yyyy-MM-dd"/></span></td>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
            <div class="holder"></div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
<script>
    $(function () {
        $("div.holder").jPages({
            containerID: "itemContainer", //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 10, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 2, //开始页码为2个
            midRange: 6, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20 //分页时动画持续时间，0表示无动画
        });
    })
</script>

</html>