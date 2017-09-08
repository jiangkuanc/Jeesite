<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">信用等级征求意见书回执单</h4>
        </div>
        <div class="modal-body">
            <table class="table table-striped table-bordered table-condensed">
                <tbody>
                <tr>
                    <td>意见类型</td>
                    <td>${fns:getDictLabel(p2pRatingResultView.viewType, 'view_type', '')}</td>
                </tr>
                <tr>
                    <td>具体意见</td>
                    <td>${p2pRatingResultView.viewExplain }</td>
                </tr>
                <c:if test="${p2pRatingResultView.viewType == 1 || p2pRatingResultView.viewType == 2}">
                    <tr>
                        <td>上传附件</td>
                        <td>
                            <a href="${ctx}/financing/reviewDownloads?rateResultViewId=${p2pRatingResultView.id}">
                                下载
                            </a>
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>



