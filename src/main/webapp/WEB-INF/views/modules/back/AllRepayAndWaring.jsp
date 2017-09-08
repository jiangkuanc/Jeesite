<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评级信息综合查询信息表</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css"/>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
    </script>
</head>
<body>
<!-- <form id="searchForm" class="breadcrumb form-search" method="post"action="/jeesite/a/financing/p2pFinancingInformation/findAllAccFinaNameAndGivTime?start=toFistPage">
    <ul class="ul-form">
        <li><label>债项名称</label>
        <input id="user.p2pUserInformation.bankname" class="input-medium"type="text" maxlength="64" name="finacingName"></li>
        <li><label>代理人名称</label> <input id="id" class="input-medium"
            type="text" maxlength="64" value="" name="nameOf"></li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary"
            type="submit" value="查询"></li>
        <li class="clearfix"></li>
    </ul>
</form> -->

<table class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th class="sort-column name">序号</th>
        <th class="sort-column name">债项名称</th>
        <th class="sort-column name">代理人名称</th>
        <th class="sort-column name">联系方式</th>
        <th class="sort-column name">预警事宜</th>
        <th class="sort-column name">放款时间</th>
    </tr>
    </thead>
    <tbody id="itemContainer1">
    <c:forEach items="${warnList}" var="vo" varStatus="status">

        <tr>
            <!-- 序号 -->
            <td>${status.count}</td>
            <!-- 债项名称 -->
            <td>${vo.p2pFinancingInformation.finacingName}</td>
            <!-- 代理人名称 -->
            <td>${vo.p2pFinancingInformation.realName}</td>
            <!-- 联系方式 -->
            <td>${vo.p2pFinancingInformation.phone}</td>
            <!--预警事宜 -->
            <td>应还款倒计时${vo.day}天，${vo.count}期应还款金额<fmt:formatNumber
                    pattern="#,##0.00">${vo.account}</fmt:formatNumber>元
            </td>
            <!-- 发布时间 -->
            <td><fmt:formatDate value="${vo.p2pFinancingInformation.givingOutTime}"
                                pattern="yyyy-MM-dd"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="holder1"></div>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" onclick="history.go(-1)" value="返 回">
</div>
<script src="${ctxStatic }/dist/js/jPages.min.js"></script>
<script>
    /*js实现页面分页*/
    function fenye(content, id) {
        $(content).jPages({
            containerID: id, //显示数据所在的块的ID
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
    }
    fenye("div.holder1", "itemContainer1");
</script>


</body>
</html>