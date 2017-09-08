<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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

<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
<table class="table table-hover table-striped table-condensed"
       style="font-size: 14px;table-layout: fixed;border-collapse: separate;border-spacing: 0px 2px;">
    <thead>
    <tr class="active list-th">
        <td name="">序号</td>
        <td name="enterpriseName" width="">企业名称</td>
        <td name="enterpriseType" width="">举报材料</td>
        <td name="industryCode" width="">举报状态</td>
        <td name="enterpriseIntroduce" width="">处理时间</td>
        <!--    <td name="enterpriseIntroduce" width="">附件</td>   -->
        <td width="10.63%">查看</td>
    </tr>
    </thead>
    <tbody id="itemContainer">

    </tbody>
</table>
<div class="clearfix"></div>
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
            url: "${ctx}/cms/p2p/creditreport/p2pCreditReportBuy/purchase",//加载数据
            data: data,
            async: false,
            dataType: "JSON",
            success: function (data) {

                var itemContainer = '';
                var tds = $(".table-hover thead td");
                var tdsName = [];//用于接住thead下所有的td的name的属性
                tds.each(function (i) {
                    tdsName.push($(tds[i]).attr("name"));
                });
                for (var i = 0; i < data.length; i++) {
                    var idd = data[i]['id'];
                    var tr = "<tr>";
                    for (var j = 0; j < tdsName.length; j++) {
                        var name = tdsName[j];
                        var nameValue = (data[i][name] == undefined || data[i][name] == null || data[i][name].length == 0) ? "--"
                            : data[i][name];

                        if (j == 0) {
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;' title='" + nameValue + "'><a href='${ctx}/cms/article/xinyongbg'>" + nameValue + "</a></td>";
                        } else if (j < 5) {
                            tr += "<td name='" + name + "' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;' title='" + nameValue + "'>" + nameValue + "</td>";
                        } else {
                            /* tr +="<td name='"+name+"' style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;'><a>查看</a></td>"; */
                        }
                    }
                    itemContainer += tr + "</tr>";
                }

                $("#itemContainer").html(itemContainer);
                $("div.holder").html("");
            }
        })
    }


    $(function () {
        $("#changeZero").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=0"
        });
        $("#changeOne").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=creditRecord&state=1"
        });

    });

</script>


</body>
</html>
