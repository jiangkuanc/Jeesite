<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic}/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic}/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jquery.validate1.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/reset-css.css">
    <!--     <script src="${ctxStatic }/dist/js/jquery.min.js"></script> -->
    <script src="${ctxStatic}/dist/js/jquery-1.7.2.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
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

        .select .select-result a {
            padding-right: 20px;
            background: #f60 url("${ctxStatic }/dist/images/close.gif") right 9px no-repeat
        }

        .select .select-result a:hover {
            background-position: right -15px
        }

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
    </style>
    <meta charset="UTF-8">
    <script type="text/javascript">
        $(function () {
            var creditTypes = new Array();

            if (${p2pCreditReportBuyList.size() != 0}) {

                <c:forEach items="${p2pCreditReportBuyList}" var="p2pCreditReportBuy" varStatus="status">
                creditTypes.push(${p2pCreditReportBuy.creditInfoType});
                </c:forEach>
                for (var i = 0; i < creditTypes.length; i++) {
                    $('.btn-close').each(function (index, item) {
                        if (creditTypes[i] == (index + 2)) {
                            $(this).attr('disabled', false);
                            $('.jumu').eq(index).css({display: 'none'});

                        }
                    })
                }
            }
        })


        /**
         * 添加方法
         */
        function add(number) {
            $.ajax({
                type: "post",
                url: "${ctx}/p2p/creditreport/p2pCreditReportBuy/add",
                dataType: "json",
                data: {'id': '${p2pCreditReport.id}', 'number': number},
                success: function (abc) {
                    /* alert(JSON.stringify(abc));  */
                    if (abc.success) {

                        var $clickPayS = $(".click_pay");
                        var $thisPay = $clickPayS.eq(number - 2);
                        $thisPay.hide();
                        $('#myModal' + number).modal('hide');
                        var len = $('.click_pay').length;
                        //alert(len);
                        $('.btn-close').each(function (index, item) {
                            if (number == (index + 2)) {

                                $(this).attr('disabled', false);

                                $(this).click(function () {
                                    //alert(111);
                                    $('.jumu').eq(index).css({display: 'none'})


                                })
                            }
                        })
                    } else {
                        $('.btn-close').each(function (index, item) {
                            $(this).click(function () {
                                alert('请先支付')
                            })
                        });
                    }
                }
            });
        }

        function tishi() {
            alert("请先登录账号再购买！");
        }


        function addjb(number) {
            $('#selectedType').html("");
            $('#selectedInfo').html("");
            var array = new Array();
            var array2 = new Array();
            var array3 = new Array();
            var label = "";
            <c:forEach items="${p2pCreditReportIndexList}" var="p2pCreditReportIndex" varStatus="status">
            array.push('${p2pCreditReportIndex.creditInfoType}');
            array2.push('${p2pCreditReportIndex.indexName}');
            array3.push('${p2pCreditReportIndex.id}');
            if (${p2pCreditReportIndex.creditInfoType} == number
        )
            {
                label = '${fns:getDictLabel(p2pCreditReportIndex.creditInfoType,'credit_info_type','')}';
            }
            </c:forEach>
            $('#selectedType').append("<option value='" + number + "'>" + label + "</option>");
            for (var i = 0; i < array.length; i++) {
                if (number == array[i]) {
                    $('#selectedInfo').append("<option value='" + array3[i] + "'>" + array2[i] + "</option>");
                }
            }
        }

    </script>
</head>
<body style="font-family:'微软雅黑';">
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>
<c:if test="${user != null}">
    <div class="credit-text">
        <h1>信用报告</h1>
        <div class="bs-example">
            <h2>一、信用等级及释义</h2>
            <table class="table table-bordered">
                <tbody class="tbody-01">
                <tr>
                    <td>等级</td>
                    <td>${p2pCreditReport.ratingLevel}</td>
                </tr>

                <tr>
                    <td>评级年月</td>
                    <td>
                        <fmt:formatDate value="${p2pCreditReport.ratingTime}" pattern="yyyy-MM-dd"/>
                    </td>
                </tr>
                <tr>
                    <td>释义</td>
                    <td>${p2pCreditReport.ratingDefinition}</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="bs-example">
            <h2>二、政府监管信息</h2>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th colspan="4">企业基本资质信息</th>
                </tr>
                </thead>
                <tbody class="tbody-02">
                <tr>
                    <td colspan="1">注册号/统一社会信用代码</td>
                    <td colspan="3">
                        <c:choose>
                            <c:when test="${p2pCreditReport.usccIsCommit=='1'}">
                                <span>已提供</span><input type="checkbox" checked="checked" disabled="disabled">
                                <span>未提供</span><input type="checkbox" disabled="disabled">
                            </c:when>
                            <c:when test="${p2pCreditReport.usccIsCommit=='0'}">
                                <span>已提供</span><input type="checkbox" disabled="disabled">
                                <span>未提供</span><input type="checkbox" checked="checked" disabled="disabled">
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">工商注册号</td>
                    <td colspan="3">
                        <c:choose>
                            <c:when test="${p2pCreditReport.grnIsCommit=='1'}">
                                <span>已提供</span><input type="checkbox" checked="checked" disabled="disabled">
                                <span>未提供</span><input type="checkbox" disabled="disabled">
                            </c:when>
                            <c:when test="${p2pCreditReport.grnIsCommit=='0'}">
                                <span>已提供</span><input type="checkbox" disabled="disabled">
                                <span>未提供</span><input type="checkbox" checked="checked" disabled="disabled">
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">组织机构代码</td>
                    <td colspan="3">
                        <c:choose>
                            <c:when test="${p2pCreditReport.ocIsCommit=='1'}">
                                <span>已提供</span><input type="checkbox" checked="checked" disabled="disabled">
                                <span>未提供</span><input type="checkbox" disabled="disabled">
                            </c:when>
                            <c:when test="${p2pCreditReport.ocIsCommit=='0'}">
                                <span>已提供</span><input type="checkbox" disabled="disabled">
                                <span>未提供</span><input type="checkbox" checked="checked" disabled="disabled">
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">税务登记代码</td>
                    <td colspan="3">
                        <c:choose>
                            <c:when test="${p2pCreditReport.trnIsCommit=='1'}">
                                <span>已提供</span><input type="checkbox" checked="checked" disabled="disabled">
                                <span>未提供</span><input type="checkbox" disabled="disabled">
                            </c:when>
                            <c:when test="${p2pCreditReport.trnIsCommit=='0'}">
                                <span>已提供</span><input type="checkbox" disabled="disabled">
                                <span>未提供</span><input type="checkbox" checked="checked" disabled="disabled">
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">法人是否有变更</td>
                    <td colspan="3">
                        <c:choose>
                            <c:when test="${p2pCreditReport.legalIsChange=='1'}">
                                <span>已提供</span><input type="checkbox" checked="checked" disabled="disabled">
                                <span>未提供</span><input type="checkbox" disabled="disabled">
                            </c:when>
                            <c:when test="${p2pCreditReport.legalIsChange=='0'}">
                                <span>已提供</span><input type="checkbox" disabled="disabled">
                                <span>未提供</span><input type="checkbox" checked="checked" disabled="disabled">
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">注册资本是否有变更</td>
                    <td colspan="3">
                        <c:choose>
                            <c:when test="${p2pCreditReport.registeredCapitalIsChange=='1'}">
                                <span>已提供</span><input type="checkbox" checked="checked" disabled="disabled">
                                <span>未提供</span><input type="checkbox" disabled="disabled">
                            </c:when>
                            <c:when test="${p2pCreditReport.registeredCapitalIsChange=='0'}">
                                <span>已提供</span><input type="checkbox" disabled="disabled">
                                <span>未提供</span><input type="checkbox" checked="checked" disabled="disabled">
                            </c:when>
                        </c:choose>
                    </td>
                </tr>

                </tbody>
            </table>

        </div>

        <div class="bs-example title-jumu">
            <h2>三、金融信贷信息</h2>
            <c:if test="${user.roleList[0].id == '104'}">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm"
                        style="margin-top:40px;margin-left:88%;" onclick="addjb(3)">举报此债项
                </button>
            </c:if>
            <table class="table table-bordered" style="text-align: center;">
                <tbody>
                <tr>
                    <td rowspan="3"></td>
                    <td colspan="6">状态</td>
                </tr>
                <tr>
                    <td colspan="2">良好</td>
                    <td colspan="2">正常</td>
                    <td colspan="2">风险</td>
                </tr>
                <tr>
                    <td>条数</td>
                    <td>比例</td>
                    <td>条数</td>
                    <td>比例</td>
                    <td>条数</td>
                    <td>比例</td>

                </tr>
                <tr>
                    <c:forEach items="${p2pCreditReportIndexList}" var="p2pCreditReportIndex" varStatus="status"
                               begin="5" end="7">
                <tr>
                    <td>${p2pCreditReportIndex.indexName}</td>


                    <td>${p2pCreditReportDataList[status.index].good}</td>
                    <td>
                        <fmt:formatNumber
                                value="${p2pCreditReportDataList[status.index].good/(p2pCreditReportDataList[status.index].good+p2pCreditReportDataList[status.index].normal+p2pCreditReportDataList[status.index].risk)}"
                                type="percent">
                        </fmt:formatNumber>
                    </td>

                    <td>${p2pCreditReportDataList[status.index].normal}</td>
                    <td>
                        <fmt:formatNumber
                                value="${p2pCreditReportDataList[status.index].normal/(p2pCreditReportDataList[status.index].good+p2pCreditReportDataList[status.index].normal+p2pCreditReportDataList[status.index].risk)}"
                                type="percent">
                        </fmt:formatNumber>
                    </td>

                    <td>${p2pCreditReportDataList[status.index].risk}</td>
                    <td>
                        <fmt:formatNumber
                                value="${p2pCreditReportDataList[status.index].risk/(p2pCreditReportDataList[status.index].good+p2pCreditReportDataList[status.index].normal+p2pCreditReportDataList[status.index].risk)}"
                                type="percent">
                        </fmt:formatNumber>
                    </td>

                </tr>
                </c:forEach>
                </tr>
                </tbody>
            </table>
        </div>


    </div>

</c:if>
<c:if test="${user == null}">
    <div style="text-align:center;"><h2>请登录账号查看！！！</h2></div>
</c:if>


<!--举报弹窗部分开始-->
}
<div class="modal fade bs-example-modal-sm shenshu" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="width: 600px;">
            <form id="shensu" method="POST" action="${ctx}/creditreport/p2pReportInformationAudit/save">
                <h3 style="font-weight:500;font-size:24px;margin-top:20px;margin-bottom:10px;width: 100%;text-align: center;font-weight: bold;">
                    举报内容</h3>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">企业名称:</label>
                    <tr>
                        <td height="45" colspan="3" width="60%" name="">${p2pCreditReport.enterpriseName}</td>
                    </tr>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">所属行业:</label>
                    <tr>
                        <td height="45" colspan="3" width="60%"
                            name="">${fns:getIndustryclassiName(p2pCreditReport.industryCode)}</td>

                    </tr>
                </div>

                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">信用记录类型:</label>
                    <select name="creditInfoType" class="form-control form-control-static" id="selectedType"
                            style="width: 200px; display: inline-block;">

                    </select>
                    <select name="indexId" class="form-control form-control-static" id="selectedInfo"
                            style="width: 200px; display: inline-block;">

                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">举报类别:</label>
                    <select id="report_category" name="reportCategory" class="form-control form-control-static"
                            style="width: 200px; display: inline-block;">
                        <option value="1">欠款</option>
                        <option value="2">信息造假</option>
                        <option value="3">隐匿信息</option>
                        <option value="4">信用历史记录</option>
                        <option value="5">其他</option>
                    </select>
                </div>
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <label class=" control-label"
                           style="width: 100px;display: inline-block;text-align: right;">原因描述:</label>
                    <textarea name="reportContent" class="form-control" rows="6"
                              style="width: 405px;resize: none;border-radius:10px;display: inline-block;"></textarea>
                </div>
                <!--  <div class="form-group" style="width: 100%;padding-left: 40px;">
                     <label class=" control-label"
                            style="width: 100px;display: inline-block;text-align: right;">上传附件:</label>
                     <input type="text" class="form-control" placeholder="上传附件"
                            style="width: 200px; display: inline-block;">
                     <button type="button" class="btn btn-danger">浏览</button>
                     <button type="button" class="btn btn-danger">上传</button>
                     class="btn btn-default quxiao
                 </div> -->
                <div class="form-group" style="width: 100%;padding-left: 40px;">
                    <p style="width: 100%;padding-left: 200px;">
                        <input type="hidden" name="creditReportId" value="${p2pCreditReport.id}"/>
                        <button type="submit" class="btn btn-primary">提交</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                    </p>
                </div>
            </form>
        </div>

    </div>

</div>


</body>
</html>