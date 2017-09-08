<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.cs	s">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
<div class="zh-right pull-left">
    <div class="zhright_top">
        <!--左侧-->
        <div class="zh-top_left pull-left">
            <div class="pull-left">
                <c:if test="${p2pUserPic.userpic != null}">
                    <p>
                        <img src="${p2pUserPic.userpic}" alt="" style="width:100px;height:100px;">
                    </p>
                </c:if>
                <p class="zh-user">
                    <a href="${ctx}/user/Institution/ctrlMenu?mode=setUserpic">设置头像</a>
                </p>
            </div>
            <div class="pull-left top-text">
                <p class="ninhao">您好，<span>${user.loginName }</span></p>
                <p>企业名称：<span>${p2pUserInformation.bankname }</span></p>
                <p>手机：<span>${user.phone }</span><b class="num"><a
                        href="${ctx}/user/Institution/ctrlMenu?mode=updatePhone"><img
                        src="${ctxStatic }/dist/images/num.png" alt=""></a></b></p>
            </div>
        </div>
        <!--右侧-->
        <div class="zh-top_right pull-left">
            <p class="ljje">
                累计投资金额：<span><fmt:formatNumber pattern="#,##0.00">${sumAmount}</fmt:formatNumber> 元</span>
            </p>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--投资推荐处-->
    <div class="zh-right-bottom">
        <div class="tz">
            <h3>投资推荐</h3>
        </div>
        <table class="table table-hover table-striped table-condensed" style="word-break:keep-all;white-space:nowrap;">
            <thead>
            <tr class="active list-th">
                <th width="12.5%">债项名称</th>
                <th width="13.13%">融资企业</th>
                <th width="9.8%">信用级别</th>
                <th width="7.88%">收益率(年化)</th>
                <th width="8.75%">债项状态</th>
                <th width="11.38%">剩余额度（元）</th>
                <th width="9.5%">融资进度</th>
                <th width="16%">剩余时间</th>
                <th width="10.63%">操作</th>
            </tr>
            </thead>
            <tbody id="itemContainer">
            <c:forEach items="${list}" var="p2pFinancingInformation" varStatus="status">
                <input type="hidden" value="${p2pFinancingInformation.id }"/>
                <tr>
                    <td style="padding:10px;" title="${p2pFinancingInformation.finacingName }"><a style="color:blue;"
                                                                                                  href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pFinancingInformation.id}">${fns:abbr(p2pFinancingInformation.finacingName,18 )}</a>
                    </td>
                    <td title="${p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName }">${fns:abbr(p2pFinancingInformation.p2pEnterpriseCertify.enterpriseName,18 )}</td>
                    <td>${p2pFinancingInformation.p2pFinancingRatingInfo.ratingLevel }</td>
                    <td><fmt:formatNumber
                            pattern="#0.00">${p2pFinancingInformation.p2pFinancingRatingInfo.recommendedRate*100 }</fmt:formatNumber>%
                    </td>
                    <c:if test="${p2pFinancingInformation.currentStage == 500}">
                        <td>热投中</td>
                    </c:if>
                    <c:if test="${p2pFinancingInformation.currentStage != 500}">
                        <td>${fns:getDictLabel(p2pFinancingInformation.currentStage,"progress_stage","") }</td>
                    </c:if>
                    <td>${p2pFinancingInformation.restRaiseMoney }</td>
                    <td id="jindutiao${p2pFinancingInformation.id}">
                    </td>
                    <td id="sta${p2pFinancingInformation.id}" name="sta" class="sta"></td>
                    <c:if test="${p2pFinancingInformation.currentStage == 500 && p2pFinancingInformation.inRaiseState == 0}">
                        <td><a class="buts"
                               href="${ctx}/financing/p2pFinancingInformation/financingInfoPage?id=${p2pFinancingInformation.id}">立即投资</a>
                        </td>
                    </c:if>
                    <c:if test="${p2pFinancingInformation.currentStage != 500 || p2pFinancingInformation.inRaiseState == 1}">
                        <td><a class="buts" href="#" onclick="alert(" 该项目不在融资期！")">立即投资</a></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="holder"></div>
    </div>
    <!--分页-->
</div>
<!--右侧内容区域结束-->
<div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    //进度条
    $(function () {
        var list = eval("(" + '${json}' + ")");
        if (list != null && list.length > 0) {
            for (var i in list) {
                var idd = list[i].id;
                var hasRaiseAmount = list[i].hasRaiseAmount;
                if (hasRaiseAmount == null || hasRaiseAmount == undefined) {
                    hasRaiseAmount = 0;
                }
                var financingAmount = 1;
                if (list[i].financingAmount >= list[i].applicationAmount) {
                    financingAmount = list[i].applicationAmount;
                } else {
                    financingAmount = list[i].financingAmount;
                }
                if (financingAmount == null || financingAmount == undefined) {
                    financingAmount = 1;
                }
                var percent = hasRaiseAmount / financingAmount;
                percent = (percent * 100).toFixed(2);
                var jindu = percent + "%";
                var width = parseFloat(jindu);
                var str = "<div class='progress plan'><div id='" + idd + "' style='width:" + jindu + ";color: black;' class='progress-bar' role='progressbar' aria-valuenow='" + width + "' aria-valuemin='0' aria-valuemax='100'>" + jindu + "</div></div>";
                $("#jindutiao" + idd).html(str);
            }
            var InterValObj = window.setInterval(function () {
                _fresh()
            }, 1000); //间隔函数，1秒执行
            function _fresh() {
                for (var k = 0; k < list.length; k++) {
                    var stas = "sta" + list[k].id;
                    var remainTime;
                    var obj = list[k].raiseTimeLimit;//截止日期
                    if (obj == null || obj == undefined) {
                        obj = 0;
                    }
                    var lastPublishTime = list[k].lastPublishTime;//最新发布时间
                    if (lastPublishTime == null || obj == undefined) {
                        lastPublishTime = 0;
                    }
                    var hasRaiseTime = list[k].hasRaiseTime;//已募集时间
                    if (hasRaiseTime == null || hasRaiseTime == undefined) {
                        hasRaiseTime = 0;
                    }
                    var currentStage = list[k].currentStage;//债项状态
                    var inRaiseState = list[k].inRaiseState;//募集中状态
                    if (inRaiseState == null || inRaiseState == undefined) {
                        inRaiseState = 0;
                    }
                    var nowtime;//当前时间
                    var endtime;//结束时间
                    var leftsecond;//剩余时间秒数
                    endtime = obj * 24 * 3600;
                    nowtime = new Date();
                    var leftsecond = parseInt(endtime - (nowtime.getTime() - lastPublishTime + hasRaiseTime * 1000) / 1000); //剩余时间
                    if (currentStage == 500 && inRaiseState == 0) {
                        if (leftsecond > 0) {
                            var _d = parseInt(leftsecond / 3600 / 24); //计算天
                            var _h = parseInt((leftsecond / 3600) % 24); //计算时
                            var _m = parseInt((leftsecond / 60) % 60); //计算分
                            var _s = parseInt(leftsecond % 60); //计算秒
                            remainTime = _d + "天" + _h + "小时" + _m + "分" + _s + "秒";
                        } else {
                            remainTime = "募集已结束";
                        }
                    } else if (currentStage == 500 && inRaiseState == 1) {
                        remainTime = "募集已暂停";
                    } else {
                        remainTime = "募集已结束";
                    }
                    $("#" + stas).text("" + remainTime);
                }
            }
        }
    })


    //js页面分页

    $(function () {
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

        fenye("div.holder", "itemContainer")
    });

</script>
</body>
</html>