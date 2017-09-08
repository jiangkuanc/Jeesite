<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>举报初审</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript">

        $(document).ready(function () {
            var type =
            ${type}
            if (type == 1) {
                $("#type1").show();
            }
            if (type == 2) {
                $("#type2").show();
            }


            $("#submitForm").validate({
                rules: {
                    firstExplain: {
                        required: true,
                        maxlength: 200
                    },
                    isNoticeReported: {
                        required: true,
                    }
                },
                messages: {
                    firstExplain: {
                        required: "必填信息",
                        maxlength: "不能超过200个字符"
                    },
                    isNoticeReported: {
                        required: "必填信息"
                    }
                },

                submitHandler: function (form) {

                    swal({
                        title: "确认提交吗？",
                        showCancelButton: true,
                        type: "info",
                    }, function (inputValue) {
                        if (inputValue === false) {
                            return false;
                        }
                        form.submit();
                    });
                }
            });
        });
    </script>
    <style type="text/css">
        label[for=isNoticeReported] {
            position: absolute;
            margin-left: 100px;
        }
    </style>

</head>
<body>
<div class="title"><h3>举报信息初审</h3></div>
<input id="btnCancel" class="btn fanhui" type="button" value="返 回" onclick="history.go(-1)"/>
<table class="table table-striped table-bordered table-condensed mytable">
    <tbody>
    <tr>
        <td>企业编号</td>
        <td>${p2pCreditReport.user.id }</td>
        <td>注册资金</td>
        <td><fmt:formatNumber pattern="#,##0.00">${p2pCreditReport.registeredCapital }</fmt:formatNumber>元</td>
    </tr>
    <tr>
        <td>企业名称</td>
        <td>${p2pCreditReport.enterpriseName }</td>
        <td>组织机构代码</td>
        <td>${p2pCreditReport.organizationCode }</td>
    </tr>
    <tr>
        <td>企业类型</td>
        <td>${fns:getDictLabel(p2pCreditReport.enterpriseType, 'enterprise_type', '')}</td>
        <td>所属行业</td>
        <td>${fns:getIndustryclassiName(p2pCreditReport.industryCode)}</td>
    </tr>
    <tr>
        <td>法人姓名</td>
        <td>${p2pCreditReport.legalName }</td>
        <td>法人联系方式</td>
        <td>${legalInfo.telephoneNumOf }</td>

    </tr>
    <tr>
        <td>举报人姓名</td>
        <td>${p2pReportInformationAudit.user.name }</td>
        <td>举报人联系方式</td>
        <td>${fns:getUserById(p2pReportInformationAudit.user.id).phone}</td>
    </tr>
    <tr>
        <td>举报类别</td>
        <td colspan="3">${fns:getDictLabel(p2pReportInformationAudit.reportCategory, 'report_category', '')}</td>
    </tr>
    <tr>
        <td>举报内容</td>
        <td colspan="3">${p2pReportInformationAudit.reportContent }</td>
    </tr>
    <tr>
        <td>上传附件</td>
        <td colspan="3"><a href="${ctx}/financing/download?address=${p2pReportInformationAudit.uploadFile }">下载</a></td>
    </tr>
    </tbody>
</table>

<div id="type1" style="display:none;">
    <form id="submitForm" action="${ctx }/creditReport/reportFirstAudit/p2pReportFirstAudit">
        <h4>初审结果</h4>
        <input name="id" type="hidden" value="${p2pReportInformationAudit.id }">
        <input name="firstStaff" type="hidden" value="${fns:getUser()}">
        <table id="contentTable" class="table table-striped table-bordered table-condensed mytable">
            <tr>
                <td>初审意见</td>
                <td>
                    <select name="firstOpinion" class="input-medium-select">
                        <c:forEach items="${fns:getDictList('pass_nopass')}" var="item">
                            <option value="${item.value }">${item.label }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>初审说明</td>
                <td><textarea name="firstExplain"></textarea></td>
            </tr>
            <tr>
                <td>是否通知被举报人</td>
                <td>
                    <input name="isNoticeReported" value="1" type="radio">是
                    <input name="isNoticeReported" value="0" type="radio">否
                </td>
            </tr>
        </table>
        <div class="row" id="button">
            <div class="text-center">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="确定"/>
                <input id="btnCancel" class="btn btn-primary" type="button" value="取消" onclick="history.go(-1)"/>
            </div>
        </div>
    </form>
</div>
<div id="type2" style="display:none;">
    <h4>初审结果</h4>
    <table class="table table-striped table-bordered table-condensed mytable">
        <tr>
            <td>初审意见</td>
            <td>${fns:getDictLabel(p2pReportInformationAudit.firstOpinion, 'pass_nopass', '')}</td>
            <td>初审说明</td>
            <td>${p2pReportInformationAudit.firstExplain }</td>
        </tr>
        <tr>
            <td>初审员</td>
            <td>${fns:getUserById(p2pReportInformationAudit.firstStaff).name}</td>
            <td>初审时间</td>
            <td><fmt:formatDate value="${p2pReportInformationAudit.firstTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
            <td>是否通知被举报人</td>
            <td>${fns:getDictLabel(p2pReportInformationAudit.isNoticeReported, 'yes_no', '') }</td>
            <td></td>
            <td></td>
        </tr>
    </table>
</div>
</body>
</html>