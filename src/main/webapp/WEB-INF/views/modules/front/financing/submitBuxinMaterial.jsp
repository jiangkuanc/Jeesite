<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>丝路互金网</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/wdzh-rzsq.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
</head>
<style>

    .zh .breadcrumb {
        width: 76.3%;
        margin: 0 auto;
        padding: 8px 0;
    }
</style>
<script type="text/javascript">
    var json1 = '${list1Json}';
    json1 = eval("(" + json1 + ")");
    //资产评估公司回显
    function toChange(id) {
        if (id != '') {
            for (var i in json1) {
                var obj = json1[i];
                if (obj.user.id == id) {
                    $('#assetCompanyPhone').html(obj.phone);
                    $('#assetContactName').html(obj.user.name);
                    $('#assetContactPosition').html(obj.dockingJob);
                    $('#assetContactPhone').html(obj.user.phone);
                    $('#assetCompanyId').val(id);
                }
            }
        } else {
            $('#assetCompanyPhone').html(null);
            $('#assetContactName').html(null);
            $('#assetContactPosition').html(null);
            $('#assetContactPhone').html(null);
            $('#assetCompanyId').val(null);
        }

        if ($('#assetCompanyPhone').html() == '' || $('#assetCompanyPhone').html() == undefined) {
            $('#assetCompanyPhone').html('无');
        }
        if ($('#assetContactName').html() == '' || $('#assetContactName').html() == undefined) {
            $('#assetContactName').html('无');
        }
        if ($('#assetContactPosition').html() == '' || $('#assetContactPosition').html() == undefined) {
            $('#assetContactPosition').html('无');
        }
        if ($('#assetContactPhone').html() == '' || $('#assetContactPhone').html() == undefined) {
            $('#assetContactPhone').html('无');
        }
        if ($('#assetCompanyId').val() == '' || $('#assetCompanyId').html() == undefined) {
            $('#assetCompanyId').val('无');
        }
    }
    var json2 = '${list2Json}';
    json2 = eval("(" + json2 + ")");
    //担保公司回显
    function toChangeTwo(id) {
        if (id != '') {
            for (var i in json2) {
                var obj = json2[i];
                if (obj.user.id == id) {
                    $('#guaranteeCompanyPhone').html(obj.phone);
                    $('#guaranteeContactName').html(obj.user.name);
                    $('#guaranteeContactPosition').html(obj.dockingJob);
                    $('#guaranteeContactPhone').html(obj.user.phone);
                    $('#guaranteeCompanyId').val(id);
                }
            }
        } else {
            $('#guaranteeCompanyPhone').html(null);
            $('#guaranteeContactName').html(null);
            $('#guaranteeContactPosition').html(null);
            $('#guaranteeContactPhone').html(null);
            $('#guaranteeCompanyId').val(null);
        }
        if ($('#guaranteeCompanyPhone').html() == '' || $('#guaranteeCompanyPhone').html() == undefined) {
            $('#guaranteeCompanyPhone').html('无');
        }
        if ($('#guaranteeContactName').html() == '' || $('#guaranteeContactName').html() == undefined) {
            $('#guaranteeContactName').html('无');
        }
        if ($('#guaranteeContactPosition').html() == '' || $('#guaranteeContactPosition').html() == undefined) {
            $('#guaranteeContactPosition').html('无');
        }
        if ($('#guaranteeContactPhone').html() == '' || $('#guaranteeContactPhone').html() == undefined) {
            $('#guaranteeContactPhone').html('无');
        }
        if ($('#guaranteeCompanyId').val() == '' || $('#guaranteeCompanyId').html() == undefined) {
            $('#guaranteeCompanyId').val('无');
        }

    }

    function submit() {
        var assetCompanyId = $('#assetCompanyId').val();
        if (assetCompanyId == null || assetCompanyId == '') {
            alert("请选择评估公司!!!");
            return false;
        }
        //个人标(有担保表)
        if (${p2pFinancingInformation.markType==2}) {
            var guaranteeCompanyId = $('#guaranteeCompanyId').val();
            if (guaranteeCompanyId == null || guaranteeCompanyId == '') {
                alert("请选择担保公司!!!");
                return false;
            }
        }
        $('#form1').submit();
    }

    function cancel() {
        window.location.href = '${ctx}/user/p2pUserInformation/accountPermission?mode=myFinancApp';
    }
    $(function () {
        var rate = ${rating.recommendedRate*100};
        rate = parseFloat(rate);
        rate = rate.toFixed(2);
        $('#rate').html(rate + '%');
    });
</script>
<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>我的位置:</b></li>
        <li><a href="/dagongp2p/a/user/p2pUserInformation/accountPermission">我的账户</a></li>
        <li class="lg-active">增信</li>
    </ol>
</div>
<!--融资申请主体开始-->
<div class="container rzsq-box" style='min-height:600px;'>
    <div class="row">
        <div class="col-md-3 rzsq-lf">
            <h4>信用等级 : ${rating.ratingLevel}</h4>
            <ul class="rzsq-lf-list">
                <!-- <li><em>可借款额度：</em> <span>1,000,000.00 元</span></li> -->
                <li><em>借款总额：</em> <span><fmt:formatNumber pattern="#,###,###.00"
                                                           value="${rating.p2pFinancingInformation.applicationAmount}"/> 元</span>
                </li>
                <!-- <li><em>还款总额：</em> <span>1,062,500.00 元</span></li> -->
                <li><em>年利率：</em> <span id="rate"></span></li>
                <li><em>需抵押额度：</em> <span><fmt:formatNumber pattern="#,###,###.00" value="${rating.repCount}"/> 元</span>
                </li>
            </ul>
        </div>
        <div class="col-md-9 rzsq-rt">
            <div class="rzsq-rt-rz">
                <h4>选择资产评估公司：</h4>
                <div class="dropdown-box">
                    <div id="dropdown" class="dropdown">
                        <label><i style="color: #bf1a20;font-weight: 700">*</i>资产评估公司 :</label>
                        <div class="btn-group">
                            <a class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu"
                               data-toggle="dropdown" style="width: 100%">
                                <!--选中option之后，要在这里显示选中值，类似原始select里面的文本框-->
                                <span class="placeholder">--请选择评估公司--</span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                <c:forEach items="${list1}" var="item">
                                    <li role="presentation" value="${item.user.id}"><a role="menuitem" tabindex="1"
                                                                                       href="javascript:toChange('${item.user.id}');">${item.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <ul class="clearfix rzlxr-list">
                    <li class="pull-left"><em>联系人：</em> <span id="assetContactName">---</span></li>
                    <li class="pull-left"><em>联系人职务：</em> <span id="assetContactPosition">---</span></li>
                    <li class="pull-left"><em>联系电话：</em> <span id="assetCompanyPhone">---</span></li>
                    <li class="pull-left"><em>手机号：</em> <span id="assetContactPhone">---</span></li>
                </ul>
            </div>
            <c:if test="${p2pFinancingInformation.markType==2}">
                <div class="rzsq-rt-rz nbd">
                    <h4>选择担保公司：</h4>
                    <div class="dropdown-box">
                        <div id="dropdown-pg" class="dropdown">
                            <label><i style="color: #bf1a20;font-weight: 700">*</i>担保公司 :</label>
                            <div class="btn-group">
                                <a class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu-pg"
                                   data-toggle="dropdown" style="width: 100%">
                                    <!--选中option之后，要在这里显示选中值，类似原始select里面的文本框-->
                                    <span class="placeholder">--请选择担保公司--</span>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-pg">
                                    <c:forEach items="${list2}" var="item">
                                        <li role="presentation" value="${item.user.id}"><a role="menuitem" tabindex="1"
                                                                                           href="javascript:toChangeTwo('${item.user.id}');">${item.name}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <ul class="clearfix rzlxr-list">
                        <li class="pull-left"><em>联系人：</em> <span id="guaranteeContactName">---</span></li>
                        <li class="pull-left"><em>联系人职务：</em> <span id="guaranteeContactPosition">---</span></li>
                        <li class="pull-left"><em>联系电话：</em> <span id="guaranteeCompanyPhone">---</span></li>
                        <li class="pull-left"><em>手机号：</em> <span id="guaranteeContactPhone">---</span></li>
                    </ul>
                </div>
            </c:if>


            <div class="btn-box" style="margin-left: 10%">
                <form id="form1" action="${ctx}/financing/submitMaterial/chooseCompany" method="post">
                    <c:if test="${p2pFinancingInformation.markType==2}">
                        <input type="hidden" name="guaranteeCompanyId" id="guaranteeCompanyId" value=""/>
                    </c:if>
                    <input type="hidden" name="assetCompanyId" id="assetCompanyId" value="">
                    <input type="hidden" name="token" value="${token}"/>
                    <input type="hidden" id="financingInformationId" name="financingInformationId"
                           value="${p2pFinancingInformation.id}"/>
                </form>
                <button class="btn btn-danger nmg" type="button" onclick="submit()">下一步</button>
                <button class="btn btn-danger" type="button" onclick="cancel()">返回</button>
            </div>

        </div>
    </div>
</div>


<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script>
    $(".dropdown-menu").on("click", "li a", function () {
        var e = window.event || arguments[0];
        var target = e.srcElement || e.target;
        var text = $(target).text();
        var $span = $(target).parents("ul").prev().find(".placeholder");
        $span.text(text);
    });
</script>
</body>
</html>