<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        function checkboxOnclick() {
            //判断checkbox是否选中做出折叠动作
            if ($('#checkbox-id').is(':checked')) {
                $("#trshow1").show();
            } else {
                $("#trshow1").hide();
            }
        }

    </script>
    <style>
        table {
            font-size: 14px;
            margin: 0;
        }

        .gyh-span {
            font-weight: 600;
        }


    </style>
</head>

<body>
<table id="contentTable" border="1" style="width:100%;border-color:#ccc;"
       class="table table-striped table-bordered table-condensed">
    <tr bgcolor="#CCCCCC">
        <td colspan="3">运营数据</td>
        <td><input type="checkbox" checked="checked" onclick="checkboxOnclick()" id="checkbox-id">显示首页运营数据</td>
    </tr>
    <tr id="trshow1">
        <td colspan="4">
            <table style="width:100% ;border-color:#ccc;" class="table table-striped table-bordered table-condensed">
                <tr align="center">
                    <td>累计注册会员<br/>${map.uCount}人</td>
                    <td>满标债项数量<br/>${map.aCount}个</td>
                    <td>债项融资总额<br/><fmt:formatNumber pattern="#,##0.00">${map.fCount}</fmt:formatNumber>元</td>
                    <td>待还总额<br/><fmt:formatNumber pattern="#,##0.00">${map.fCount}</fmt:formatNumber>元</td>
                </tr>
                <tr align="center">
                    <td>今日注册用户数<br/>${map.rCount}人</td>
                    <td>今日登陆用户数<br/>${map.tCount}人</td>
                    <td>历史注册用户数<br/>${map.uCount}人</td>
                    <td>当前在线用户数<br/>${map.sCount}人
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="right"><a href="${ctx}/financing/p2pFinancingInformation/findAllAccFinaNameAndID">查看更多&gt;&gt;</a>
        </td>
    </tr>
    <tr>
        <td width="3%" align="center">
            <span class="gyh-span">材料审核任务池</span>
        </td>
        <td colspan="4">
            <table border="1" style="width:100%;margin:0;border-color:#ccc;" border="1"
                   class="table table-striped table-bordered table-condensed">
                <tr bgcolor="#CCCCCC" align="center">
                    <td align="center" width="3%">序号</td>
                    <td>项目名称</td>
                    <td align="center">操作</td>
                </tr>
                <c:forEach items="${frontFinaNameAndIDList}" var="voes" varStatus="status">
                    <tr>
                        <td align="center" width="6%">${status.count}</td>
                        <td>${voes.finacingName}</td>
                        <td align="center"><a
                                href="${ctx}/financing/getEnterpriseBaseInfo?userId=${voes.applicantsId}&fiId=${voes.id}&flag=2">审核</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="right"><a href="${ctx}/financing/p2pFinancingInformation/findAllRaiseAndWarning">查看更多&gt;&gt;</a>
        </td>
    </tr>
    <tr>
        <td width="10%" align="center"><span class="gyh-span">募集期债项预警信息</span></td>
        <td colspan="4">
            <table style="width:100%;margin:0;border-color:#ccc;" border="1"
                   class="table table-striped table-bordered table-condensed">
                <tr bgcolor="#CCCCCC" align="center">
                    <td width="4%">序号</td>
                    <td>债项名称</td>
                    <td>代理人名称</td>
                    <td>联系方式</td>
                    <td>预警事宜</td>
                    <td>发布时间</td>
                </tr>
                <c:forEach items="${raiseFrontList}" var="vo" varStatus="status">
                    <tr>
                        <td align="center" width="3%">${status.count}</td>
                        <td>${vo.finacingName}</td>
                        <td align="center">${vo.realName}</td>
                        <td align="center">${vo.phone}</td>
                        <td align="left">募集期倒计时${vo.warndays}天，距满标投资差额<fmt:formatNumber
                                pattern="#,##0.00">${vo.restRaiseMoney}</fmt:formatNumber>元
                        </td>
                        <td align="center"><fmt:formatDate value="${vo.publishTime}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </table>

        </td>
    </tr>
    <tr style="border:1;border-color:#ccc;">
        <td colspan="4" align="right"><a href="${ctx}/financing/p2pFinancingInformation/findPageFinaNameAndGivTime">查看更多&gt;&gt;</a>
        </td>
    </tr>
    <tr style="border:1;border-color:#ccc;">
        <td width="10%" align="center" valign="middle"><span class="gyh-span">还款期债项预警信息</span></td>
        <td colspan="4" style="border:0;">
            <table table style="width:100%;margin:0;border-color:#ccc;" border="1"
                   class="table table-striped table-bordered table-condensed">
                <tr bgcolor="#CCCCCC" align="center" border="1" style="border-color:#ccc;">
                    <td width="4%">序号</td>
                    <td>债项名称</td>
                    <td>代理人名称</td>
                    <td>联系方式</td>
                    <td>预警事宜</td>
                    <td>放款时间</td>
                </tr>
                <c:forEach items="${warnList}" var="vo" varStatus="status" begin="0" end="9">
                    <tr>
                        <td align="center" width="3%">${status.count}</td>
                        <td>${vo.p2pFinancingInformation.finacingName}</td>
                        <td align="center">${vo.p2pFinancingInformation.realName}</td>
                        <td align="center">${vo.p2pFinancingInformation.phone}</td>
                        <td align="left">应还款倒计时${vo.day}天，${vo.count}期应还款金额<fmt:formatNumber
                                pattern="#,##0.00">${vo.account}</fmt:formatNumber>元
                        </td>
                        <td align="center"><fmt:formatDate value="${vo.p2pFinancingInformation.givingOutTime}"
                                                           pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
            </table>

        </td>
    </tr>
</table>

<script>
    /* $(function(){
     var a=$(".gyh-span").height();
     // alert( $(".gyh-span"));
     /* 	 $(".gyh-span").css({
     height:a,
     color:"red",
     line-height:a
     });
     $(".gyh-span").css("color","red");
     $(".gyh-span").css("height",a);
     $(".gyh-span").css("line-height",a);
     }); */
</script>


</body>
</html>

