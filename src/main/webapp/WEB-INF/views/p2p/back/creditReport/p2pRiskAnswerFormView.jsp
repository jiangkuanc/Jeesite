<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!-- 模态框（Modal） -->


<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">问题选项</h4>
        </div>
        <div class="modal-body">
            <table id="contentTable" class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <!-- <th>问题ID</th> -->
                    <th>选项</th>
                    <th>选项内容</th>
                    <th>分值</th>
                    <th>操作</th>

                </tr>
                </thead>
                <tbody id="tbody">
                <%-- <c:if test="${p2pRiskPaper.paperState=='1'||p2pRiskPaper.paperState==null}"> --%>
                <c:forEach items="${p2pRiskAnswerList}" varStatus="status" var="p2pRiskAnswer">

                    <tr>
                        <!--问题ID-->
                            <%-- <td>${p2pRiskAnswer.riskQuestionId}</td>  --%>
                        <!--选项(risk_option)-->
                        <td>${fns:getDictLabel(p2pRiskAnswer.riskOption,'risk_option','')}</td>
                        <!--选项内容-->
                        <td>${p2pRiskAnswer.optionContent}</td>
                        <!--分值-->
                        <td>${p2pRiskAnswer.score}</td>
                        <!--操作-->

                        <td>

                            <a onclick="optionDel('${p2pRiskAnswer.id}','${p2pRiskAnswer.riskQuestionId}')"
                               style="cursor:pointer;">删除</a>

                        </td>

                    </tr>

                </c:forEach>


                <form:form id="inputForm2" modelAttribute="p2pRiskPaper"
                           action="${ctx}/p2p/risk/p2pRiskPaper/saveAnswer" method="post">

                    <tr>

                        <!--问题ID-->
                        <form:hidden path="riskQuestionId" value="${p2pRiskPaper.riskQuestionId}"/>
                        <!--选项(risk_option)-->
                        <td>
                            <form:select path="riskOption" class="input-mini-select" style="width:56px;">
                                <form:options items="${fns:getDictList('risk_option')}" itemLabel="label"
                                              itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </td>
                        <!--选项内容-->
                        <td><form:input path="optionContent" htmlEscape="false" maxlength="200"
                                        class="input-large required"/></td>
                        <!--分值-->
                        <td><form:input path="score" htmlEscape="false" maxlength="15" style="width:56px;"
                                        class="input-mini required"/></td>
                        <!--操作-->

                        <td>

                            <a onclick="optionAdd()" style="cursor:pointer;">
                                添加</a>
                        </td>

                    </tr>

                </form:form>

                </tbody>

            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
    </div>
</div>

<script type="text/javascript">
    function optionAdd() {

        $.ajax({
            url: '${ctx}/p2p/risk/p2pRiskPaper/saveAnswer',
            type: 'post',
            data: {
                riskQuestionId: $("#riskQuestionId").val(),
                riskOption: $("#riskOption").val(),
                optionContent: $("#optionContent").val(),
                score: $("#score").val()
            },
            success: function (data) {

                $.ajax({
                    url: '${ctx}/p2p/risk/p2pRiskPaper/form1?riskQuestionId=' + data,
                    dataType: 'html',
                    type: 'post',
                    success: function (data) {
                        $("#myModal_view").html(data);
                    }
                });


            }
        });


    }


    function optionDel(id, riskQuestionId) {

        $.ajax({
            url: '${ctx}/p2p/risk/p2pRiskAnswer/delete?id=' + id + '&riskQuestionId=' + riskQuestionId,
            type: 'post',
            success: function (data) {
                $.ajax({
                    url: '${ctx}/p2p/risk/p2pRiskPaper/form1?riskQuestionId=' + data,
                    dataType: 'html',
                    type: 'post',
                    success: function (data) {
                        $("#myModal_view").html(data);
                    }
                });


            }
        });


    }


</script>



