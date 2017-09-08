<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一带一路企业详情</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/ydyl.css">
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="xyjyjt-content-mbx">
    <ol class="breadcrumb">
        <li><b>当前位置：</b></li>
        <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>
        <li><a href="${ctx}/cms/p2pProductInfo/yidaiyilu">一带一路</a></li>
        <li><a href="${ctx }/cms/article/strategicResearch?start=toFistPage">丝路战略研究</a></li>
        <!--         <li class="active"><a href="#" id="pro"></a></li> -->
    </ol>
</div>
<div class="contbox">
    <div class="qyxqbox mgtop_30">
        <div class="qyjj_boxhd">
            <h3>一带一路丝路战略研究</h3>
        </div>
        <c:forEach items="${currentstrategicResearch}" var="strategicResearch">
            <div class="gsxq_box">
                <div class="gsxq_box_rt pull-left">

                    <h5><a href="#" class="c_active" style="margin-left:400px;"
                           id="productName">${strategicResearch.productName }</a></h5>
                    <p>
                    <h3><a href="#" class="c_active">${strategicResearch.productContent}</h3></a></p>
                    <p><c:forEach var="img" items="${fn:split(strategicResearch.productDisplay,'|') }"
                                  varStatus="status">
                    <li class="pull-left"><img alt="" src="http://10.10.10.136:8008${img}"></li>

                    <c:if test="${status.count%2==0 }">
                        <br/>
                    </c:if>
                    </c:forEach>
                    </p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="qyjj_box">
                <div class="qyjj_boxhd">
                    <h5>联系方式:</h5>
                </div>
                <ul>
                    <li><span>电话:${strategicResearch.phone }</span></li>
                    <li><span>传真:${strategicResearch.fax }</span></li>
                    <li><span>邮箱:${strategicResearch.mailbox }</span></li>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<!-- 引入footer文件 -->
<script type="text/javascript" src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        var te = $("#productName").html();
        $("#pro").html(te);
    })
</script>
</body>
</html>