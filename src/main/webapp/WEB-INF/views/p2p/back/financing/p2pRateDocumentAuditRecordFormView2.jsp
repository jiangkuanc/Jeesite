<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">材料审核历史记录</h4>
        </div>
        <div class="modal-body">
            <c:choose>
                <c:when test="${empty p2pAuditRecordList}">无材料审核历史记录</c:when>
                <c:otherwise>
                    <table class="table table-striped table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>处理时间</th>
                            <th>是否通过</th>
                            <th>驳回原因</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p2pAuditRecord" items="${p2pAuditRecordList}" varStatus="status">
                            <tr>
                                <td class="modal1">${status.count}</td>
                                <td class="modal1"><fmt:formatDate value="${p2pAuditRecord.auditTime }"
                                                                   pattern="yyyy-MM-dd"/></td>
                                <td class="modal1">
                                        ${fns:getDictLabel(p2pAuditRecord.licenseIsReject, 'yes_no', '')}
                                </td>
                                <td>${p2pAuditRecord.licenseRejectReason}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>



