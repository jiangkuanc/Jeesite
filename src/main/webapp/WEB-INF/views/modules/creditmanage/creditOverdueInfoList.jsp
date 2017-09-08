<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta name="decorator" content="default"/>
<style>
    input[type="text"].error {
        border: solid 1px red;
    }
</style>
<script type="text/javascript">

    function deleteOver(id) {
        $.ajax({
            url: '${ctx}/creditmanage/creditOverdueInfo/delete?id=' + id,
            type: 'post',
            success: function (data) {
                location.reload();
            }
        });
    }

</script>
<form:form id="inputForm2" modelAttribute="creditOverdueInfo" action="${ctx}/creditmanage/creditOverdueInfo/save"
           method="post" class="form-horizontal">
    <h4>逾期记录</h4>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>处置机构</th>
            <th style="width:70px;">笔数(笔)</th>
            <th>币种</th>
            <th>逾期金额(元)</th>
            <th style="width:110px;">逾期年月</th>
            <th style="width:70px;">逾期持续月数(月)</th>
            <th style="width:110px;">最近一次还款日期</th>
            <th style="width:110px;">处置完成日期</th>
            <c:if test="${CreditOverdueInfo.remarks=='edit'}">
                <th>操作</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" varStatus="status" var="creditOverdueInfo">
            <tr>
                <td>${fns:getDictLabel(creditOverdueInfo.disposalAgency,'disposal_agency','')}</td>
                <td>${creditOverdueInfo.pens}</td>
                <td>${fns:getDictLabel(creditOverdueInfo.currency,'currency','')}</td>
                <td><fmt:formatNumber pattern="#,##0.00">${creditOverdueInfo.overdueAmount}</fmt:formatNumber></td>
                <td><fmt:formatDate value="${creditOverdueInfo.overdueDate}" pattern="yyyy.MM"></fmt:formatDate>
                </td>
                <td>${creditOverdueInfo.overdueMonths}
                </td>
                <td><fmt:formatDate value="${creditOverdueInfo.lastRepaymentDate}"
                                    pattern="yyyy.MM.dd"></fmt:formatDate>
                </td>
                <td><fmt:formatDate value="${creditOverdueInfo.disposalCompletionDate}"
                                    pattern="yyyy.MM.dd"></fmt:formatDate>
                </td>
                <c:if test="${CreditOverdueInfo.remarks=='edit'}">
                    <td>
                        <input class="btn" type="button" value="删除" onclick="deleteOver('${creditOverdueInfo.id}')"/>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        <c:if test="${CreditOverdueInfo.remarks=='edit'}">
            <form:input path="user.id" type="hidden"/>
            <tr>
                <td>
                    <form:select path="disposalAgency" style="width:280px">
                        <form:option value="" label="---请选择---"/>
                        <form:options items="${fns:getDictList('disposal_agency')}" itemLabel="label" itemValue="value"
                                      htmlEscape="false"/>
                    </form:select>
                </td>
                <td><form:input type="text" path="pens" htmlEscape="false" maxlength="5" class="digits"
                                style="width:70px;"/></td>
                <td>
                    <form:select path="currency" style="width:120px;">
                        <form:option value="" label="---请选择---"/>
                        <form:options items="${fns:getDictList('currency')}" itemLabel="label" itemValue="value"
                                      htmlEscape="false"/>
                    </form:select>
                </td>
                <td><form:input path="overdueAmount" htmlEscape="false" maxlength="20" class="number"
                                style="width:150px;"/>
                </td>
                <td>
                    <input id="overdueDate" name="overdueDate" type="text" readonly="readonly" maxlength="20"
                           class="input-mini Wdate"
                           value="<fmt:formatDate value="${creditOverdueInfo.overdueDate}" pattern="yyyy.MM"/>"
                           onclick="WdatePicker({dateFmt:'yyyy.MM',isShowClear:false});"/>
                </td>
                <td><form:input path="overdueMonths" htmlEscape="false" maxlength="5" style="width:70px;"
                                class="digits"/>
                </td>
                <td>
                    <input id="lastRepaymentDate" name="lastRepaymentDate" type="text" readonly="readonly"
                           maxlength="20" class="input-mini Wdate"
                           value="<fmt:formatDate value="${creditOverdueInfo.lastRepaymentDate}" pattern="yyyy.MM.dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy.MM.dd',isShowClear:false});"/>
                </td>
                <td>
                    <input id="disposalCompletionDate" name="disposalCompletionDate" type="text" readonly="readonly"
                           maxlength="20" class="input-mini Wdate"
                           value="<fmt:formatDate value="${creditOverdueInfo.disposalCompletionDate}" pattern="yyyy.MM.dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy.MM.dd',isShowClear:false});"/>
                </td>
                <td>
                    <!-- 							<input class="btn btn-primary" type="button" onclick="saveOver()"  value="添加"/> -->
                    <input class="btn btn-primary" type="submit" value="添加"/>
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <div class="pagination">${page}</div>
</form:form>
<script>
    $(document).ready(function () {
        $("#inputForm2").validate({
            submitHandler: function (form) {
                form.submit();
            },
            errorPlacement: function (error, element) { //错误信息位置设置方法
                error.appendTo(element); //这里的element是录入数据的对象
            }
        });
    });
</script>
