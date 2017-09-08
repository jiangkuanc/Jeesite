<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jcalculator.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/jcalculator.js"></script>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
    <style type="text/css">
        #itemContainer tr td {
            text-align: center;
            padding-left: 0%;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--内容区域-->
<c:if test="${user.roleList[0].id == '101'}">
    <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
</c:if>
<c:if test="${user.roleList[0].id == '102'}">
    <%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
</c:if>

<c:if test="${user.roleList[0].id == '104'}">
    <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->

</c:if>
<div class="zh-right pull-left zhzl_xxzx wdzh-zjgl-right" style="border-left: 0;padding-top: 0px;">
    <h4>
        <span>账户余额：</span><span>0元</span>
        <button class="btn btn-danger">充值</button>
    </h4>
    <table class="table table-hover zhzl_xxzx_table zh-right-bot-table">
        <thead>
        <tr>
            <td style="width: 10%;">序号</td>
            <td style="width: 20%;">流水号</td>
            <td style="width: 20%;">操作时间</td>
            <td style="width: 20%;">银行账号</td>
            <td style="width: 20%;">充值额度（元）</td>
            <td style="width: 10%;">状态</td>
        </tr>
        </thead>
        <tbody id="itemContainer">
        <c:forEach items="${list}" var="p2pAccountRechargeRecord" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${p2pAccountRechargeRecord.id}</td>
                <td><fmt:formatDate value="${p2pAccountRechargeRecord.rechargeSuccessTime}"
                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${p2pAccountRechargeRecord.p2pAccount.bankAccount}</td>
                <td>${p2pAccountRechargeRecord.rechargeAmount}</td>
                <td>${fns:getDictLabel(p2pAccountRechargeRecord.rechargeState, 'success_failure', '')}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="holder"></div>
    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->

<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic }/dist/js/left.js"></script>
<script src="${ctxStatic }/dist/js/jPages.min.js"></script>
<script src="${ctxStatic }/dist/js/zhzl.js"></script>
<script type="text/javascript" src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script>
<script type="text/javascript">
    /*js实现页面分页*/
    /*分页*/
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
    });

</script>
</body>
</html>