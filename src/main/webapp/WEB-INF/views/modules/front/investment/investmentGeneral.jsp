<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/manhuaDate.1.0.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <style type="text/css">
        .weizhi {
            float: right;
        }

        .btn:hover {
            color: #fff;
            cursor: default;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<!--账户总览页面-->
<div class="zh">
    <ol class="breadcrumb update">
        <li><b>我的位置：</b></li>
        <li><a href="${frontPath}">首页</a></li>
        <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
        <li class="lg-active">投资总览</li>
    </ol>
</div>
<!--内容区域-->
<div class="zh-con">
    <c:if test="${user.roleList[0].id=='101'}">
        <%@include file="/WEB-INF/views/modules/front/investment/accountLeftMenu.jsp" %>
    </c:if>
    <c:if test="${user.roleList[0].id=='104'}">
        <jsp:include page="/WEB-INF/views/modules/person/menu.jsp"></jsp:include>
    </c:if>
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="tzright_top">
            <p class="zl-p">
                已投资总额：<span><fmt:formatNumber value="${investmentSum}" pattern="#,###,##0.00"/>元</span>
            </p>
            <p class="zl-p">
                累计收益： <span><fmt:formatNumber value="${incomeSum}" pattern="0.00"/>元</span>
            </p>
            <div class="zhai-group" style="margin-bottom: 30px;">
                <p class="zhai muj">募集中的债项：<span>${middle} 个</span></p>
                <p class="zhai">还款中的债项：<span>${back} 个</span></p>
                <p class="zhai">已完成的债项：<span>${finish} 个</span></p>
                <p class="zhai">已流标债项：<span>${defaut} 个</span></p>
            </div>
        </div>

        <div class="zh-right-bottom">
            <div class="tz">
                <h3>投资项目</h3>
            </div>
            <div class="rz-time">
                <span class="chaxun">按时间查询：</span>
                <form action="${ctx}/user/personInvestment/loadInfo" style="margin:0px;display:inline;"
                      onsubmit="return checkinput()">
                    <input type="hidden" name="mode" value="investmentGeneral"/>
                    <input type="text" placeholder="请选择日期" name="beginTime" id="beginTime" class="mh_date" readonly>
                    <b>至</b>
                    <input type="text" placeholder="请选择日期" name="endTime" id="endTime" class="mh_date" readonly>
                    <input type="submit" value="查 询"/>
                </form>
            </div>

            <table class="table table-hover tzzl-table table-striped table-condensed"
                   style="table-layout: fixed;word-break:keep-all;white-space:nowrap;">
                <thead>
                <tr class="active list-th">
                    <th width="16.5%">债项名称</th>
                    <th width="10.9%">信用级别</th>
                    <th width="13.8%">募集截止日期</th>
                    <th width="9.80%">收益率(年化)</th>
                    <th width="17.3%">投资额度(元)</th>
                    <th width="12.4%">投资时间</th>
                    <th width="10.5%">债项状况</th>
                    <th width="13.63%">划款时间</th>
                </tr>
                </thead>
                <tbody class="tzzl-tbody" id="itemContainer">
                <c:if test="${list == null}">
                    <tr>
                        <td colspan="8" rowspan="2">
                            <div class="cai-text">暂无投资信息，立即 <a
                                    href="${ctx}/user/p2pUserInformation/investmentPermission">投资。</a></div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${list != null}">
                    <c:forEach items="${list}" var="p2p">
                        <tr>
                            <td title="${p2p.p2pFinancingInformation.finacingName }">${fns:abbr(p2p.p2pFinancingInformation.finacingName,10 )}</td>
                            <td>${p2p.p2pFinancingRatingInfo.ratingLevel }</td>
                            <td><fmt:formatDate value="${p2p.p2pBeforeMatchDebtState.stateTime}"/></td>
                            <td><fmt:formatNumber
                                    pattern="#0.00">${p2p.p2pFinancingInformation.recommendedRate*100}</fmt:formatNumber>%
                            </td>
                            <td><fmt:formatNumber pattern="#0.00">${p2p.investmentSumAmount}</fmt:formatNumber></td>
                            <!-- 保留小数点后两位 -->
                            <td><fmt:formatDate value="${p2p.lastInvestmentTime}"/></td>
                            <td>
                                <c:if test="${p2p.p2pFinancingInformation.currentStage >= 500 && p2p.p2pFinancingInformation.currentStage <= 700}">
                                    <button class="btn mjz">${fns:getDictLabel(p2p.p2pFinancingInformation.currentStage,"progress_stage","") }</button>
                                </c:if>
                                <c:if test="${p2p.p2pFinancingInformation.currentStage == 900}">
                                    <button class="btn yhk">${fns:getDictLabel(p2p.p2pFinancingInformation.currentStage,"progress_stage","") }</button>
                                </c:if>
                                <c:if test="${p2p.p2pFinancingInformation.currentStage == 800}">
                                    <button class="btn hkz">${fns:getDictLabel(p2p.p2pFinancingInformation.currentStage,"progress_stage","") }</button>
                                </c:if>
                                <c:if test="${p2p.p2pFinancingInformation.currentStage == 901}">
                                    <button class="btn hkz">${fns:getDictLabel(p2p.p2pFinancingInformation.currentStage,"progress_stage","") }</button>
                                </c:if>
                            </td>

                            <td>
                                <c:if test="${p2p.p2pFinancingInformation.givingOutTime != null && p2p.p2pFinancingInformation.givingOutState == 1}">
                                    <fmt:formatDate value="${p2p.p2pFinancingInformation.givingOutTime}"/>
                                </c:if>
                                <c:if test="${p2p.p2pFinancingInformation.givingOutTime != null && p2p.p2pFinancingInformation.givingOutState == 0 && p2p.p2pFinancingInformation.currentStage == 700}">
                                    <fmt:formatDate value="${p2p.p2pFinancingInformation.givingOutTime}"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button class="btn lr"
                                            onclick="viewModal('${p2p.financingInformationId}','${p2p.p2pFinancingInformation.finacingName}','${p2p.investmentSumAmount}')">
                                        修改
                                    </button>
                                </c:if>
                                <c:if test="${p2p.p2pFinancingInformation.givingOutTime == null && p2p.p2pFinancingInformation.currentStage == 700}">
                                    <button class="btn lr"
                                            onclick="viewModal('${p2p.financingInformationId}','${p2p.p2pFinancingInformation.finacingName}','${p2p.investmentSumAmount}')">
                                        录入
                                    </button>
                                </c:if>
                                <c:if test="${(p2p.p2pFinancingInformation.givingOutTime == null || p2p.p2pFinancingInformation.givingOutState == 0) && p2p.p2pFinancingInformation.currentStage != 700}">
                                    -
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <!-- 录入划款时间模态框 -->
                <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">债项名称：<span id="financingName"></span>
                                </h4>
                            </div>
                            <form id="defaultForm" action="${ctx}/user/Institution/entryTime" method="post"
                                  enctype="multipart/form-data">
                                <div class="modal-body">
                                    <input type="hidden" id="id" name="id" value=""/>
                                    <br/>
                                    <div>投资总额：<span id="investmentSumAmount"></span>元</div>
                                    <div style="margin-top: 12px">转账时间：
                                        <input id="givingOutTime" name="givingOutTime" type="text" readonly="readonly"
                                               maxlength="20" class="input-medium Wdate" value=""
                                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                                               style="cursor:pointer;"/></div>
                                    <div style="margin-top: 12px"><span style="float: left;">转账凭证：</span><input
                                            type="file" id="file" name="file" required="required" style="float: left;"
                                            accept="image/*"/><br/></div>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" style="width:15%;height:35px;"
                                            data-dismiss="modal">关闭
                                    </button>
                                    <input type="button" class="btn btn-primary" value="确   定"
                                           onclick="submitListen()"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                </tbody>
            </table>
            <div class="holder"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->

<!-- 引入footer文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
<script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
<script src="${ctxStatic }/dist/js/jquery-1.7.2.min.js"></script>
<script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic }/dist/js/left.js"></script>
<script src="${ctxStatic }/dist/js/jPages.min.js"></script>
<script src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    function viewModal(id, name, amount) {
        $('#financingName').html(name);
        $('#id').val(id);
        $('#investmentSumAmount').html(amount);
        $('#myModal').modal();
    }
</script>
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

        fenye("div.holder", "itemContainer");
    });

    function submitListen() {
        var date = $('#givingOutTime').val();
        var file = $('#file').val();
        if (date != '' && file != '') {
            $('#defaultForm').submit();
        } else {
            alert('时间和凭证不能为空');
        }
    }
</script>


</body>
</html>