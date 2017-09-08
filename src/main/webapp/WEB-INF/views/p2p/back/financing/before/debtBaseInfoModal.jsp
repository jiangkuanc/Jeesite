<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <c:choose>
                <c:when test="${fid == 'DG7' }">
                    <h4 class="modal-title" id="myModalLabel">评级项目基本信息</h4>
                </c:when>
                <c:otherwise>
                    <h4 class="modal-title" id="myModalLabel">借贷产品基本信息</h4>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="modal-body">
            <table class="table table-striped table-bordered table-condensed mytable">
                <tbody>
                <tr>
                    <td>企业名称</td>
                    <td>${enBaseInfo.enterpriseName}</td>
                    <td>注册地址</td>
                    <td>${enBaseInfo.registeredAddress}</td>
                </tr>
                <tr>
                    <td>企业规模</td>
                    <td>${fns:getDictLabel(enBaseInfo.enterpriseScale, 'enterprise_scale', '')}</td>
                    <td>企业性质</td>
                    <td>${fns:getDictLabel(enBaseInfo.enterpriseNature, 'enterprise_nature', '')}</td>
                </tr>
                <tr>
                    <td>所属行业</td>
                    <td>${enBaseInfo.industryCode}</td>
                    <td>实缴资本</td>
                    <td><fmt:formatNumber pattern="#,##0.00">${enBaseInfo.realCapital}</fmt:formatNumber>元</td>
                </tr>
                <tr>
                    <td>所在地</td>
                    <td>${enBaseInfo.provincialArea}${enBaseInfo.municipalArea}</td>
                    <td>经营区域</td>
                    <td>${enBaseInfo.businessArea}</td>
                </tr>
                <tr>
                    <td>营业执照登记机关</td>
                    <td>${enBaseInfo.registrationAuthority}</td>
                    <td>营业执照登记状态</td>
                    <td>${fns:getDictLabel(enBaseInfo.registrationState, 'registration_state', '')}</td>
                </tr>
                <tr>
                    <td>营业执照准核日期</td>
                    <td><fmt:formatDate value="${enBaseInfo.quasiNuclearDate}" pattern="yyyy-MM-dd"/></td>
                    <td>是否存在境外交易</td>
                    <td>${fns:getDictLabel(enBaseInfo.isOffshoreTransaction, 'yes_no', '')}</td>
                </tr>
                <tr>
                    <td>企业经营范围</td>
                    <td>${enBaseInfo.businessScope}</td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>



