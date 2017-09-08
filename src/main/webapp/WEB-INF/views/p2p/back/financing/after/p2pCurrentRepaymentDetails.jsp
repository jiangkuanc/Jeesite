<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-body">
            <div class="title"><h3>当期还款金额分配</h3></div>
            <table class="table table-striped table-bordered table-condensed">
                <tbody>
                <tr>
                    <th rowspan="2">序号</th>
                    <th rowspan="2">账期</th>
                    <th rowspan="2">债权人</th>
                    <th colspan="2">当期还款时间</th>
                    <th colspan="2">当期本金（元）</th>
                    <th colspan="2">当期利息（元）</th>
                    <th colspan="2">当期逾期罚息（元）</th>
                    <th colspan="2">当期还款合计（元）</th>
                    <th rowspan="2">本期是<br>否还清</th>
                </tr>
                <tr>
                    <th>应还</th>
                    <th>实还</th>
                    <th>应还</th>
                    <th>实还</th>
                    <th>应还</th>
                    <th>实还</th>
                    <th>应还</th>
                    <th>实还</th>
                    <th>应还</th>
                    <th>实还</th>
                </tr>
                <c:forEach varStatus="status1" items="${currentRepaymentDetailslist }" var="p2pReceivePlan">
                    <tr>
                        <td>${status1.count }</td>
                        <td>${p2pReceivePlan.phase }</td>
                        <td>${fns:getUserById(p2pReceivePlan.userId).name }</td>
                        <td><fmt:formatDate value="${p2pReceivePlan.planReceiveDate }" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${p2pReceivePlan.p2pReceiveRecord.realReceiveDate }"
                                            pattern="yyyy-MM-dd"/></td>
                        <td>
                            <fmt:formatNumber
                                    pattern="#,##0.00">${p2pReceivePlan.planReceivePrincipal }</fmt:formatNumber>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty p2pReceivePlan.p2pReceiveRecord.realReceivePrincipal }">
                                    0.00
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber
                                            pattern="#,##0.00">${p2pReceivePlan.p2pReceiveRecord.realReceivePrincipal }</fmt:formatNumber>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatNumber
                                    pattern="#,##0.00">${p2pReceivePlan.planReceiveInterest }</fmt:formatNumber>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty p2pReceivePlan.p2pReceiveRecord.realReceiveInterest }">
                                    0.00
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber
                                            pattern="#,##0.00">${p2pReceivePlan.p2pReceiveRecord.realReceiveInterest }</fmt:formatNumber>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatNumber pattern="#,##0.00">${p2pReceivePlan.planReceiveFine }</fmt:formatNumber>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty p2pReceivePlan.p2pReceiveRecord.realReceiveFine }">
                                    0.00
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber
                                            pattern="#,##0.00">${p2pReceivePlan.p2pReceiveRecord.realReceiveFine }</fmt:formatNumber>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><fmt:formatNumber
                                pattern="#,##0.00">${p2pReceivePlan.planReceivePrincipal+p2pReceivePlan.planReceiveInterest+p2pReceivePlan.planReceiveFine  }</fmt:formatNumber></td>
                        <td><fmt:formatNumber
                                pattern="#,##0.00">${p2pReceivePlan.p2pReceiveRecord.realReceivePrincipal+p2pReceivePlan.p2pReceiveRecord.realReceiveInterest+p2pReceivePlan.p2pReceiveRecord.realReceiveFine }</fmt:formatNumber></td>
                        <td>
                            <c:if test="${p2pReceivePlan.receiveState == 3 }">
                                是
                            </c:if>
                            <c:if test="${p2pReceivePlan.receiveState != 3 }">
                                否
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
	
