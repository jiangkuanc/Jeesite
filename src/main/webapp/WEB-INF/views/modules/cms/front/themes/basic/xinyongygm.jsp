<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jquery.validate1.css">
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script src="${ctxStatic }/dist/js/jquery.validate.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dictionary/dictionary.js"></script>
    <style type="text/css">
        .select dl {
            margin-bottom: 0;
        }

        .select {
            padding: 0px 0px;
            border-radius: 4px;
            font-size: 12px
        }

        .select li {
            list-style: none;
            padding: 10px 0 5px 100px
        }

        .select .select-list {
            border-bottom: #eee 1px dashed
        }

        .select dl {
            zoom: 1;
            position: relative;
            line-height: 24px;
        }

        .select dl:after {
            content: " ";
            display: block;
            clear: both;
            height: 0;
            overflow: hidden
        }

        .select dt {
            width: 100px;
            margin-bottom: 5px;
            position: absolute;
            top: 7px;
            left: -100px;
            text-align: right;
            color: #666;
            height: 24px;
            line-height: 24px;
            font-size: 14px;
        }

        .select dd {
            float: left;
            display: inline;
            margin: 0 0 5px 5px;
        }

        .select a {
            display: inline-block;
            white-space: nowrap;
            height: 24px;
            padding: 0 10px;
            text-decoration: none;
            color: #039;
            border-radius: 2px;
        }

        .select a:hover {
            color: #f60;
            background-color: #f3edc2
        }

        .select .selected a {
            color: #fff;
            background-color: #f60
        }

        .select-result dt {
            font-weight: bold;
            font-size: 14px;
        }

        .select-no {
            color: #999
        }

        .select .select-result a:hover {
            background-position: right -15px
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<div class="touzizq-content">
    <!--左侧内容区域-->
    <div class="zh">
        <ol class="breadcrumb update">
            <li><b>当前位置：</b></li>
            <li><a href="${pageContext.request.contextPath}${fns:getFrontPath()}">首页 </a></li>

            <li class="lg-active"><strong>已购信用记录</strong></li>
        </ol>
    </div>
    <!--左侧内容区域结束-->
    <div class="touzizq-content">
        <%--  <img src="${ctxStatic}/dist/images/touzizq-banner_03.png" alt=""> --%>
        <div class="touzizq-content-right-center">
            <h4>选择条件</h4>
            <ul class="select">
                <li class="select-list">
                    <dl id="select1">
                        <dt>信用主体：</dt>
                        <dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
                        <c:forEach items="${fns:getDictList('enterprise_type')}" var="item">
                            <dd><a>${item.label}</a></dd>
                            <span data-key="enterpriseType" style="display:none">${item.value}</span>
                        </c:forEach>
                        <div class="clearfix"></div>
                    </dl>
                </li>
                <li class="select-list">
                    <dl id="select2">
                        <dt>所属行业：</dt>
                        <dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
                        <c:forEach items="${industryList}" var="industry">
                            <dd><a>${industry.classinameCn}</a></dd>
                            <span data-key="industryCode" style="display:none">${industry.industrynum}</span>
                        </c:forEach>
                        <div class="clearfix"></div>
                    </dl>
                </li>
                <li class="select-result">
                    <dl>
                        <dt>已选条件：</dt>
                        <dd class="select-no" style="padding-left:20px;padding-top: 10px">暂时没有选择过滤条件</dd>
                    </dl>
                </li>
            </ul>
        </div>

        <table class="table table-hover table-striped table-condensed"
               style="font-size: 14px;table-layout: fixed;border-collapse: separate;border-spacing: 0px 2px;">
            <thead>
            <tr class="active list-th">
                <td name="p2pCreditReport.enterpriseName" width="12.5%">企业名称</td>
                <td name="p2pCreditReport.enterpriseType" width="13.13%">企业类型</td>
                <td name="p2pIndustryclassi.classinameCn" width="9.8%">所属行业</td>
                <td name="p2pCreditReport.enterpriseIntroduce" width="7.88%">企业介绍</td>
                <!--   <td width="10.63%">查看</td> -->
            </tr>
            </thead>
            <tbody id="itemContainer">

            </tbody>
        </table>
        <div class="holder"></div>
    </div>

    <!--分页-->
</div>
<div class="clearfix"></div>
<!-- 合作伙伴 -->
<!-- 引入thePartner文件 -->
<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script type="text/javascript">

    /**
     *加载数据列表
     */

    $(function () {

        itemContainer();
    });
    function itemContainer(data) {
        $.ajax({
            type: "post",
            url: "${ctx}/cms/article/buyList",//加载数据
            data: data,
            async: false,
            dataType: "JSON",
            success: function (data) {
                /* 	console.log(JSON.stringify(data)) ; */
                var itemContainer = '';
                var tds = $(".table-hover thead td");
                var tdsName = [];//用于接住thead下所有的td的name的属性
                tds.each(function (i) {
                    tdsName.push($(tds[i]).attr("name"));
                });
                for (var i = 0; i < data.length; i++) {
                    var idd = data[i]['creditReportId'];
                    var tr = "<tr>";
                    for (var j = 0; j < tdsName.length; j++) {
                        var name = tdsName[j];
                        if (name != undefined) {
                            if (name.indexOf(".") < 0) {
                                nameValue = (data[i][name] == undefined || data[i][name] == null || data[i][name].length == 0) ? "--"
                                    : data[i][name];
                            } else {
                                var bb = name.substring(0, name.indexOf("."));//复合对象
                                var kk = name.substring(name.indexOf(".") + 1);//复合对象中的属性
                                var valueTemp = null;
                                try {
                                    valueTemp = data[i][bb][kk];//取到值
                                } catch (e) {

                                }
                                nameValue = valueTemp == undefined || valueTemp == null || valueTemp == '' ? "--" : valueTemp;
                            }
                        }
                        if (j == 0) {
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;' title='" + nameValue + "'><a style='color:blue' href='${ctx}/cms/article/xinyongbg?id=" + idd + "'>" + nameValue + "</a></td>";
                        } else if (j == 1) {
                            var nameValueStr = selectdic(nameValue, 'enterprise_type', '');
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;' title='" + nameValueStr + "'>" + nameValueStr + "</td>";
                        } else if (j < 4) {
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;' title='" + nameValue + "'>" + nameValue + "</td>";
                        } else {

                        }
                    }
                    itemContainer += tr + "</tr>";
                }

                $("#itemContainer").html(itemContainer);
                $("div.holder").html("");
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

            }
        })
    }
    /**
     *控制左侧菜单栏
     */
    function leixing(param) {
        itemContainer(param);
        if (param == "markType=1") {
            $('.zhzl li:eq(0)').attr('class', 'tz-active');
            $('.zhzl li:eq(1)').attr('class', 'zhtext');
            $('.zhzl li:eq(2)').attr('class', 'zhtext');
        } else if (param == "markType=2") {
            $('.zhzl li:eq(1)').attr('class', 'tz-active');
            $('.zhzl li:eq(0)').attr('class', 'zhtext');
            $('.zhzl li:eq(2)').attr('class', 'zhtext');
        } else if (param == "markType=3") {
            $('.zhzl li:eq(2)').attr('class', 'tz-active');
            $('.zhzl li:eq(0)').attr('class', 'zhtext');
            $('.zhzl li:eq(1)').attr('class', 'zhtext');
        }
    }

    /* function func(){
     alert("该项目不在融资期，不能投资");
     } */

    /**
     *筛选条件控制
     */
    $(".select-list a").click(function () {
        var e = window.event || arguments[0];
        var target = e.srcElement || e.target;
        //找到当前点击元素的父元素dd，并追加选中效果的class
        $(target).parent().parent().find("dd").removeClass("selected");
        $(target).parent().addClass("selected");
        //
        var selected = new Array();
        $(".select-list dd").each(function (i) {
            if ($($(".select-list dd")[i]).hasClass("selected") && !$($(".select-list dd")[i]).hasClass("select-all")) {
                var selectedClon = $($(".select-list dd")[i]).clone()
                var spanClocn = $($(".select-list dd")[i]).next().clone()
                selected.push(selectedClon);
                selected.push(spanClocn);
            }
        })

        if (selected.length != 0) {
            $(".select-result dd").remove();
            $(".select-result span").remove();
            for (var i = 0; i < selected.length; i++) {
                $(".select-result dl").append(selected[i])
            }

        } else {
            var title = "<dd class='select-no' style='padding-left:20px;padding-top: 10px'>暂时没有选择过滤条件</dd>";
            $(".select-result dd").remove();
            $(".select-result span").remove();
            $(".select-result dl").append($(title));
        }

        //遍历结果集中的元素
        var data = "";
        for (var i = 0; i < selected.length; i++) {
            if (selected[i][0].tagName == "SPAN") {
                var key = selected[i].attr("data-key");
                var value = selected[i].text();
                data += key + "=" + value + "&";
            }
        }
        data = data.substring(0, data.length - 1);
        itemContainer(data);
    })

    //查询字典项
    function selectdic(value, type, defaultValue) {
        var zhi = '';
        var a = $.ajax({
            url: '${ctx}/financing/p2pFinancingInformation/selectDict',
            async: false,
            type: 'post',
            dataType: 'json',
            data: {value: value, type: type, defaultValue: defaultValue},
            success: function (d) {
                zhi = d.responseText;
            },
            error: function (e) {
                zhi = e.responseText;
                return zhi;
            }
        });
        return zhi;
    }
</script>
</body>
</html>