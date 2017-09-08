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
    <link rel="stylesheet" href="${ctxStatic}/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/tabs.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic}/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/dist/js/left.js"></script>
    <script src="${ctxStatic}/dist/js/jPages.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/manhuaDate.1.0.js"></script>
    <script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript">
        $(function () {
            $("input.mh_date").manhuaDate({
                Event: "click",//可选
                Left: 0,//弹出时间停靠的左边位置
                Top: -16,//弹出时间停靠的顶部边位置
                fuhao: "-",//日期连接符默认为-
                isTime: false,//是否开启时间值默认为false
                beginY: 1980,//年份的开始默认为1949
                endY: 2025//年份的结束默认为2049
            });

        });
    </script>

</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!-- 引入账号菜单文件 -->
<%@include file="/WEB-INF/views/modules/front/account/accountMenu.jsp" %>
<!--右侧内容区域-->
<div class="zh-right pull-left">
    <div class="tabs " id="tabs" style="width:100%">
        <ul>
            <li id="changeZero" class="two"><span class="border">募集中的借款项目</span></li>
            <li id="changeOne" class="two border"><span>还款中的借款项目</span></li>
            <li id="changeTwo" class="two border current currents"><span class="border-top">已完成的借款项目</span></li>
            <li id="changeThree" class="two border"><span>流标借款项目</span></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="shu" style="margin-top:30px">


            <!--已完成的债项-->
            <c:choose>
                <c:when test="${list[0] != null}">
                    <div style="display: inherit;" class="one">
                        <div class="rz-time ztcx">
                            <span class="chaxun">按时间查询：</span>
                            <form action="${ctx}/user/p2pUserInformation/accountPermission"
                                  style="margin:0px;display:inline;" onsubmit="return checkinput()">
                                <input type="hidden" name="mode" value="myDebt"/>
                                <input type="hidden" name="state" value="2"/>
                                <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date"
                                       readonly>
                                <b>至</b>
                                <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date"
                                       readonly>
                                <input type="submit" value="查 询"/>
                            </form>
                        </div>
                        <table class="table table-hover rongz-table">
                            <thead style="height:50px">
                            <tr class="active list-th">
                                <th width="16%">借款项目名称</th>
                                <th width="10%">信用等级</th>
                                <th width="7%">金额</th>
                                <th width="17%">借款利率(年化)</th>
                                <th width="8%">借款期限</th>
                                <th width="18%">评级报告</th>
                                <th width="13%">计息时间</th>
                                <th width="6%">状态</th>
                            </tr>
                            </thead>
                            <tbody id="itemContainer">
                            <c:forEach items="${list}" var="p2p">
                                <tr class="tr33">
                                    <td><a href="javascript:void(0);"
                                           title="${p2p.finacingName}">${fns:abbr(p2p.finacingName,40)}</a></td>
                                    <td>${p2p.p2pFinancingRatingInfo.ratingLevel}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p2p.applicationAmount > p2p.p2pFinancingRatingInfo.recommendedAmount}">
                                                <fmt:formatNumber
                                                        value="${(p2p.p2pFinancingRatingInfo.recommendedAmount>p2p.applicationAmount?p2p.applicationAmount:p2p.p2pFinancingRatingInfo.recommendedAmount)/10000}"
                                                        pattern="###,###"/>万
                                                <%-- 				                            	<fmt:formatNumber  value="${p2p.p2pFinancingRatingInfo.recommendedAmount/10000}" pattern="###,###" />万 --%>
                                            </c:when>
                                            <c:otherwise>

                                                <fmt:formatNumber value="${p2p.applicationAmount/10000}"
                                                                  pattern="###,###"/>万
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td><fmt:formatNumber
                                            pattern="#0.00">${p2p.p2pFinancingRatingInfo.recommendedRate*100}</fmt:formatNumber>%
                                    </td>
                                    <td>${p2p.financingMaturity}个月</td>
                                    <td>
                                        <a onClick="${ctx}/financing/p2pFinancingRatingInfo/downLoadCreditReport?fid=${p2p.id}"
                                           title="点击下载">${fns:abbr(p2p.finacingName,40)}</a></td>
                                    <td class="time33"><fmt:formatDate value="${p2p.givingOutTime}"
                                                                       pattern="yyyy/MM/dd"/></td>
                                    <td>
                                        <button class="btn hkz">已完成</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="holder"></div>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:if test="${flag != null}">
                        <div style="display: inherit;" class="one">
                            <div class="rz-time ztcx">
                                <span class="chaxun">按时间查询：</span>
                                <form action="${ctx}/user/p2pUserInformation/accountPermission"
                                      style="margin:0px;display:inline;" onsubmit="return checkinput()">
                                    <input type="hidden" name="mode" value="myDebt"/>
                                    <input type="hidden" name="state" value="2"/>
                                    <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime"
                                           class="mh_date" readonly>
                                    <b>至</b>
                                    <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date"
                                           readonly>
                                    <input type="submit" value="查 询"/>
                                </form>
                            </div>
                            <table class="table table-hover rongz-table">
                                <thead style="height:50px">
                                <tr class="active list-th">
                                    <th width="16%">借款项目名称</th>
                                    <th width="10%">信用等级</th>
                                    <th width="7%">金额</th>
                                    <th width="17%">借款利率(年化)</th>
                                    <th width="8%">借款期限</th>
                                    <th width="18%">评级报告</th>
                                    <th width="13%">计息时间</th>
                                    <th width="6%">状态</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${flag == null}">
                        <div style="display: inherit;" class="one ckmj-div">
                            <p class="hkzx">暂无已完成借款项目</p>
                        </div>
                    </c:if>
                </c:otherwise>
            </c:choose>
            <!--已完成的债项结束-->
            <script type="text/javascript">

                //按时间查询前验证
                function checkinput() {
                    var beginTime = new Date($("#beginTime").val());
                    var endTime = new Date($("#endTime").val());
                    if (beginTime > endTime) {
                        alert("起始时间不得大于截止时间！")
                        return false;
                    }
                    return true;

                }

                function creditReportDown(src) {
                    if (src == "" || src == null || src == undefined) {
                        alert("没有添加评级报告");
                        return;
                    }
                    var strs = new Array();
                    var newStr = "";
                    strs = src.split("/");
                    for (var i = 2; i < strs.length; i++) {
                        if (i == strs.length - 1) {
                            newStr = newStr + strs[i];
                        }
                        else {
                            newStr = newStr + strs[i] + "/";
                        }
                    }
                    window.open('${pageContext.request.contextPath}/' + newStr);
                }
            </script>
        </div>
    </div>
</div>
<!--右侧内容区域结束-->
<div class="clearfix"></div>
</div>
<!--内容区域结束-->

<!-- 引入footer页脚文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        $("#changeZero").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=0"
        });
        $("#changeOne").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=1"
        });
        $("#changeTwo").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=2"
        });
        $("#changeThree").click(function () {
            window.location.href = "${ctx}/user/p2pUserInformation/accountPermission?mode=myDebt&state=3"
        });
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

        fenye("div.holder", "itemContainer");
    });
</script>
</body>
</html>
