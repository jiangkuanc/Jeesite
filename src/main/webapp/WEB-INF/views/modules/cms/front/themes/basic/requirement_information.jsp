<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>需求信息</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/ydyl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li class="active"><a href="#">需求信息</a></li>
    </ol>
</div>
<div class="contbox">
    <div class="pic_ttbox">
        <img src="${ctxStatic}/dist/images/ydyl_tt.jpg" alt="">
    </div>
    <ul>
        <li class="supply_info mgtop_30">
            <div class="els_introduce_top elsintroduce">
                <div class="els_introduce_top-left pull-left">
                    <h3>推荐需求信息</h3>
                </div>
                <div class="els_introduce_top-right pull-left"></div>
                <div class="clearfix"></div>
            </div>
            <div class="table-bot">
                <table class="table table_zdqy table-hover">
                    <thead>
                    <tr>
                        <th>产品</th>
                        <th>需求企业</th>
                        <th>单价</th>
                        <th>需求数量</th>
                        <th>发货期限（天）</th>
                    </tr>
                    </thead>
                    <tbody id="itemContainer1">
                    <tr class="kheight"></tr>
                    <!--显示固定的条数 -->
                    <c:forEach items="${page.list }" var="requirementInformationlist">
                        <input type="hidden" value="${requirementInformationlist.id}"/>
                        <tr>
                            <td title="${requirementInformationlist.productName }">
                                <a href="${ctx}/cms/cmsDemandInformation/selectCurrentDemandInformation?pid=${requirementInformationlist.id}"
                                   class="c_active">
                                        ${fns:abbr(requirementInformationlist.productName,40)}
                                </a>
                            </td>
                            <td title="${requirementInformationlist.demandEnterprise }">
                                    ${fns:abbr(requirementInformationlist.demandEnterprise,40 )}
                            </td>
                            <td>${requirementInformationlist.productPrice }元/套</td>
                            <td>${requirementInformationlist.demandQuantity }套</td>
                            <td>${requirementInformationlist.periodForDelivery }</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="holder1"></div>
            </div>
        </li>
        <li class="supply_info mgtop_30">
            <div class="els_introduce_top elsintroduce">
                <div class="els_introduce_top-left pull-left">
                    <h3>最新需求信息</h3>
                </div>
                <div class="els_introduce_top-right pull-left"></div>
                <div class="clearfix"></div>
            </div>
            <div class="table-bot">
                <table class="table table_zdqy table-hover">
                    <thead>
                    <tr>
                        <th>产品</th>
                        <th>需求企业</th>
                        <th>单价</th>
                        <th>需求数量</th>
                        <th>发货期限（天）</th>
                    </tr>
                    </thead>
                    <tbody id="itemContainer2">
                    <tr class="kheight"></tr>
                    <c:forEach items="${page.list }" var="requirementInformationlist" begin="0" end="4">
                        <input type="hidden" value="${requirementInformationlist.id}"/>
                        <tr>
                            <td title="${requirementInformationlist.productName }">
                                <a href="${ctx}/cms/cmsDemandInformation/selectCurrentDemandInformation?pid=${requirementInformationlist.id}"
                                   class="c_active">
                                        ${fns:abbr(requirementInformationlist.productName,40 )}
                                </a>
                            </td>
                            <td title="${requirementInformationlist.demandEnterprise }">
                                    ${fns:abbr(requirementInformationlist.demandEnterprise,40 )}
                            </td>
                            <td>${requirementInformationlist.productPrice }元/套</td>
                            <td>${requirementInformationlist.demandQuantity }套</td>
                            <td>${requirementInformationlist.periodForDelivery }</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="holder1"></div>
            </div>
        </li>
    </ul>
    <div class="hot_product">
        <div class="els_introduce_top">
            <div class="els_introduce_top-left pull-left">
                <h3>热门产品</h3>
            </div>
            <div class="els_introduce_top-right pull-left">
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="hot_product_box">
            <span class="prev bg pull-left"></span>
            <div class="productIfon_box pull-left">
                <ul class="productIfon_box_list">
                    <li class="productIfon_lis pull-left">
                        <ul>
                            <c:forEach items="${page.list }" var="requirementInformationlist" varStatus="status"
                                       begin="0" end="7">
                                <li class="pull-left">
                                        <%-- <a href="javascript:"><img src="${ctxStatic}/dist/images/cp_pic.jpg" alt=""></a> --%>
                                    <div class="productIfon">
                                        <input type="hidden" value="${requirementInformationlist.id}"/>
                                        <p>
                                            <a href="${ctx}/cms/cmsDemandInformation/selectCurrentDemandInformation?pid=${requirementInformationlist.id}"
                                               class="c_active" title="${requirementInformationlist.productName }">
                                                    ${fns:abbr(requirementInformationlist.productName,20 )}
                                            </a>
                                        </p>
                                        <p>单价：${requirementInformationlist.productPrice }元/套</p>
                                        <p style="padding-left: -20px;">
                                            需求数量：${requirementInformationlist.periodForDelivery }套</p>
                                    </div>
                                </li>
                                <c:if test="${status.count%6==0 }">
                                    <br/>
                                </c:if>
                            </c:forEach>
                            <div class="clearfix"></div>
                        </ul>
                    </li>
                </ul>
            </div>
            <span class="next bg pull-right"></span>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic}/dist/js/ydyl.js"></script>
<script src="${ctxStatic }/dist/js/jPages.min.js"></script>
<script type="text/javascript">
    /*js实现页面分页*/
    function fenye(content, id) {
        $(content).jPages({
            containerID: id, //显示数据所在的块的ID
            first: '首页',
            last: '尾页',
            previous: '上页',
            next: '下页',
            perPage: 6, //每页显示数据为多少行
            startPage: 1, //起始页
            startRange: 2, //开始页码为2个
            midRange: 6, //最多显示几个页码页码,其余用..代替e
            ndRange: 10, //结束页码为2个
            keyBrowse: true,
            delay: 20 //分页时动画持续时间，0表示无动画
        });
    }
    fenye("div.holder1", "itemContainer1");
    fenye("div.holder2", "itemContainer2");
    fenye("div.holder3", "itemContainer3");
</script>
</body>
</html>