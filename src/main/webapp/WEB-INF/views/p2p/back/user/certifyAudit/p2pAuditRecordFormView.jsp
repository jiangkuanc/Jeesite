<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">材料审核历史记录</h4>
        </div>
        <div class="modal-body">
            <table class="table table-striped table-bordered table-condensed">
                <c:choose>
                <c:when test="${empty list}">无材料审核历史记录</c:when>
                <c:otherwise>
                <thead>
                <tr>
                    <td>序号</td>
                    <td>审核时间</td>
                    <td>是否驳回</td>
                    <td>驳回原因</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="abc" items="${list}" varStatus="status">
                    <tr>
                        <td>${ status.index + 1}</td>
                        <td><fmt:formatDate value="${ abc.auditTime}" pattern="yyyy-MM-dd"/></td>
                        <td>${ abc.licenseIsReject}</td>
                        <td>${ abc.licenseRejectReason}</td>
                    </tr>
                </c:forEach>
                </c:otherwise>
                </c:choose>
                </tbody>
            </table>


        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>



