<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>企业详情</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        /***********************查看有无营业执照后下载**************************************/
        function creditReportDown(report) {
            if (report == null || report == '') {
                alert("没有添加营业执照");

                return false
            } else {
                //1.加载loadImageFromServer('src');
                //2.modal()
                location.href = "${ctx}/financing/download?address=" + report;
            }
        }
    </script>
</head>
<body>

<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>企业详情</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>单位类型</td>
        <td>${fns:getDictLabel(vo.unitType,'unit_type','')}</td>
        <td>证件类型</td>
        <td>${fns:getDictLabel(vo.certificateType,'certificate_type','')}</td>
    </tr>
    <tr>
        <td>企业名称</td>
        <td>${vo.enterpriseName}</td>
        <td>营业执照注册号</td>
        <td>${vo.unifiedSocialCreditCode}</td>
    </tr>
    <tr>
        <td>证照所在地</td>
        <td>${fns:getDictLabel(p2pEnterpriseCertify.certificateLocation, 'provincial_area', '')} </td>
        <td>营业期限</td>
        <td><c:choose>
            <c:when test="${vo.isLongTerm==1 }">长期</c:when>
            <c:otherwise><fmt:formatDate value="${vo.operationPeriod}" pattern="yyyy-MM-dd"/></c:otherwise>
        </c:choose></td>
    </tr>
    <tr>
        <td>注册地址</td>
        <td>${vo.registeredAddress}</td>
        <td>联系电话</td>
        <td>${vo.telephoneNum}</td>
    </tr>
    <tr>
        <td>组织机构代码</td>
        <td>${vo.organizationCode}</td>
        <td>营业范围</td>
        <td>${vo.businessScope}</td>
    </tr>
    <tr>
        <td>注册资金</td>
        <td>${vo.registeredCapital}</td>
        <td>传真</td>
        <td>${vo.faxNum}</td>
    </tr>
    <tr>
        <td>代理人是否为企业法定代表人</td>
        <td>${fns:getDictLabel(vo.isEntLegalRep,'is_ent_legal_rep','')}</td>
        <td>联系电话</td>
        <td>${vo.telephoneNum}</td>
    </tr>
    </tbody>
</table>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>企业非财务材料</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>序号</td>
        <td>材料名称</td>
        <td>是否资料必填</td>
        <td>材料备注</td>
        <td>证件说明</td>
        <td>是否提交</td>
        <td>到期时间</td>
        <td>是否过期</td>
    </tr>
    <tr>
        <td>1</td>
        <td><a href="#" onClick="modelView('${ctx}/image/test?path=${fns:getConfig('filePath')}${vo.businessLicense}')">查看营业执照</a>
        </td>
        <td>是</td>
        <td>提供有效期内的材料</td>
        <td>加盖企业公章的复印件</td>
        <td>是</td>
        <td id="operationPeriod"><fmt:formatDate value="${vo.operationPeriod}" pattern="yyyy-MM-dd"/></td>
        <td id="thinktime">${wheOverdue}</td>
    </tr>
    <tr>
        <td>2</td>
        <td>其他材料</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>