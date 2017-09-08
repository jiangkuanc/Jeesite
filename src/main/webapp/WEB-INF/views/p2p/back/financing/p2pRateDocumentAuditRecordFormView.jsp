<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">评级材料审核历史记录</h4>
        </div>
        <div class="modal-body">
            <c:choose>
                <c:when test="${empty list}">无评级材料审核历史记录</c:when>
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
                        <c:forEach var="abc" items="${list}" varStatus="status">
                            <tr>
                                <td class="modal1">${ status.count}</td>
                                <td class="modal1"><fmt:formatDate value="${ abc.handleTime}"
                                                                   pattern="yyyy-MM-dd"/></td>
                                <td class="modal1">
                                        ${fns:getDictLabel(abc.isReject, 'yes_no', '')}
                                </td>
                                <td>${abc.rejectReason}
                                </td>
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



