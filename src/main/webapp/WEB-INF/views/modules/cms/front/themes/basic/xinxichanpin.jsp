<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>信息产品</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/ydyl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li class="active"><a href="#">国别研究报告</a></li>
    </ol>
</div>
<div class="pic_ttbox mgtop_30">
    <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
</div>
<!--信息产品-->
<div class="index-xinyong bgColor">
    <div class="indxe-xinyong-top">
        <div class="index-xinyong-top-left pull-left">
            <nobr><h3>国别研究报告</h3></nobr>
        </div>
        <div class="index-xinyong-top-right pull-left">
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="table-bot">
        <table class="table table_xxcp table-hover">
            <thead>
            <tr>
                <th class="product">报告类型</th>
                <th>国别</th>
            </tr>
            </thead>
            <tbody id="itemContainer">
            <tr class="kheight"></tr>
            <c:forEach items="${fnc:getArticleList(site.id, 61, 1000, '')}" var="article">
                <c:if test="${article.statusCode eq '5'}">
                    <tr>
                        <td class="product_text"><a href="${ctx }/cms/cmsReport/selectCurrentReport?pid=${article.id}"
                                                    style="color:${article.color}">${fns:abbr(article.title,61)}</a>
                        </td>
                        <td><span><a style="color:${article.color}">${fns:abbr(article.country,61)}</a></span></td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="holder"></div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script>
    $(function () {
        $("div.holder").jPages({
            containerID: "itemContainer", //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 20, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 2, //开始页码为2个
            midRange: 10, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20 //分页时动画持续时间，0表示无动画
        });
    })
</script>
</body>
</html>