<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrapValidator.css"/>
    <script src="${ctxStatic }/dist/js/jquery.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <style>
        .credit-text {
            width: 800px;
            margin: 0 auto;
        }

        .credit-text .btn {
            outline: none;
        }

        .credit-text h1 {
            width: 100%;;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-size: 25px;
            font-weight: bold;
        }

        .credit-text h2 {
            width: 100%;;
            height: 30px;
            line-height: 30px;
            text-align: left;
            font-size: 23px;
            font-weight: bold;
        }

        .credit-text h3 {
            width: 100%;;
            height: 30px;
            line-height: 30px;
            text-align: left;
            font-size: 16px;
            font-weight: bold;
        }

        .tbody-01 tr td:first-child {
            width: 200px;
            color: #000;
        }

        .tbody-01 tr:last-child {
            height: 80px;
            line-height: 80px;
        }

        .tbody-02 tr td:first-child {
            width: 200px;
            color: #000;
        }

        .title-jumu {
            position: relative;
        }

        .jumu {
            border-radius: 2px;
            text-align: center;
            width: 100%;
            height: 350px;
            position: absolute;
            left: 0;
            top: 40px;
        }

        .jumu h2 {
            width: 100%;
            text-align: center;
        }

        .credit-text {
            width: 800px;
            float: right;
            margin: none;
        }
    </style>


    <!--<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>-->
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li>我的位置：</li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li><strong>风险测评</strong></li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con" style="height:900px;">
    <!-- 引入账号菜单文件 -->
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    <div class="credit-text">
        <h1>${p2pRiskPaper.paperTitle}</h1>
        <h5>${p2pRiskPaper.paperExplain}</h5>
        <form:form action="${ctx}/p2p/risk/p2pRiskRecord/save" method="post" id="riskForm" name="riskForm">
            <input id="paperId" name="paperId" value="${p2pRiskPaper.id}" type="hidden"/>
            <input id="totalScore" name="totalScore" value="" type="hidden"/>
            <c:forEach items="${p2pRiskQuestionList}" var="p2pRiskQuestion" varStatus="status">
                <%-- ${fns:getDictLabel(p2pRiskQuestion.questionType,'question_type','')}:	 --%>
                <c:out value="${p2pRiskQuestion.questionContent}"></c:out><br><br>
                <c:if test="${p2pRiskQuestion.selectWay=='1'}">
                    <c:forEach items="${p2pRiskQuestion.p2pRiskAnswers}" var="value" varStatus="status2">
                        <input type="radio" name="radio${status.index}" value="${value.score}" id=""
                               class="boxs"/><c:out
                            value="${fns:getDictLabel(value.riskOption,'risk_option','')}"></c:out>、<c:out
                            value="${value.optionContent}"></c:out><br><br>
                    </c:forEach>
                </c:if>
                <c:if test="${p2pRiskQuestion.selectWay=='2'}">
                    <c:forEach items="${p2pRiskQuestion.p2pRiskAnswers}" var="value" varStatus="status2">
                        <input type="checkbox" value="${value.score}" id="" class="boxs"/><c:out
                            value="${fns:getDictLabel(value.riskOption,'risk_option','')}"></c:out>、<c:out
                            value="${value.optionContent}"></c:out><br><br>
                    </c:forEach>
                </c:if>
            </c:forEach>
            <input id="sub" type="button" value="提交" onclick="submitData();" class="btn btn-primary"/>
        </form:form>
    </div>
</div>
<div class="clearfix"></div>
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">
    function submitData() {
        var boxs = document.getElementsByClassName("boxs");
        var ii = 0;
        for (var i = 0; i < boxs.length; i++) {
            if (boxs[i].checked) {
                ii += parseInt(boxs[i].value);
            }

        }
        alert("总得分是:" + ii);
        $('#totalScore').val(ii);
        $('#riskForm').submit();
    }

</script>


</body>
</html>
