<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">评级费支付详情</h4>
        </div>
        <div class="modal-body">
            <table class="table table-striped table-bordered table-condensed">
                <tbody>
                <tr>
                    <td>订单编号</td>
                    <td>${p2pPaymentOfRatingCost.orderNo }</td>
                </tr>
                <tr>
                    <td>支付金额</td>
                    <td><fmt:formatNumber pattern="#,##0.00">${p2pPaymentOfRatingCost.paymentAmount }</fmt:formatNumber>元</td>
                </tr>
                <tr>
                    <td>交易流水号</td>
                    <td>${p2pPaymentOfRatingCost.batchNo }</td>
                </tr>
                <tr>
                    <td>企业名称</td>
                    <td>${financingName }</td>
                </tr>
                <tr>
                    <td>订单状态</td>
                    <td>${fns:getDictLabel(p2pPaymentOfRatingCost.paymentStatus, 'payment_status', '')}</td>
                </tr>
                <tr>
                    <td>收费项目</td>
                    <td>${fns:getDictLabel(p2pPaymentOfRatingCost.chargingItem, 'charging_item', '')}</td>
                </tr>
                <tr>
                    <td>到账时间</td>
                    <td><fmt:formatDate value="${p2pPaymentOfRatingCost.timeOfPayment }"
                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>



