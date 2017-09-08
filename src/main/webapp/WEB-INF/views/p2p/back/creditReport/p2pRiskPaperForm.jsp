<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>问卷添加</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    $.ajax({
                        url: '${ctx}/p2p/risk/p2pRiskPaper/save',
                        type: 'post',
                        data: $('#inputForm').serialize(),
                        success: function (data) {
                            var ids = data.split(",");
                            location.href = "${ctx}/p2p/risk/p2pRiskPaper/form?id=" + ids[0] + "&paperId=" + ids[2];
                        }
                    });
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
    <script type="text/javascript">
        /* alert('${p2pRiskPaper.paperState}'); */
        function model_add() {
            $("#inputForm").submit();

        }

        function model_edit(id) {

            $.ajax({
                url: '${ctx}/p2p/risk/p2pRiskPaper/form1?riskQuestionId=' + id,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
                }
            });


        }

        function model_edit(id) {

            $.ajax({
                url: '${ctx}/p2p/risk/p2pRiskPaper/form1?riskQuestionId=' + id,
                dataType: 'html',
                type: 'post',
                success: function (data) {
                    $("#myModal_view").html(data);
                }
            });


        }

        function shenhe() {
            $.ajax({
                url: '${ctx}/p2p/risk/p2pRiskPaper/saveTj',
                type: 'post',
                data: $('#inputForm').serialize(),
                success: function (data) {
                    location.href = "${ctx}/p2p/risk/p2pRiskPaper/p2pRiskPaperList?QTMessage=1";
                }
            });

        }

        function fabu() {
            //guanli
            $.ajax({
                url: '${ctx}/p2p/risk/p2pRiskPaper/closePaper',
                type: 'post',
                success: function () {
                    $.ajax({
                        url: '${ctx}/p2p/risk/p2pRiskPaper/saveTj',
                        type: 'post',
                        data: $('#inputForm').serialize(),
                        success: function (data) {
                            location.href = "${ctx}/p2p/risk/p2pRiskPaper/p2pRiskPaperList?QTMessage=2";
                        }
                    });
                }
            });
        }

        function tijiao() {
            $('#questionContent').removeClass("required");
            $.ajax({
                url: '${ctx}/p2p/risk/p2pRiskPaper/saveTj',
                type: 'post',
                data: $('#inputForm').serialize(),
                success: function (data) {
                    location.href = "${ctx}/p2p/risk/p2pRiskPaper/p2pRiskPaperList?QTMessage=3";
                }
            });

        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a id="list" href="${ctx}/p2p/risk/p2pRiskPaper/p2pRiskPaperList">投资风险问卷管理</a></li>

</ul>
<form:form id="inputForm" modelAttribute="p2pRiskPaper" action="${ctx}/p2p/risk/p2pRiskPaper/saveTj" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <form:hidden path="paperState"/>
    <sys:message content="${message}"/>
    <div class="page-header">
        <h4>
            风险测评问卷
        </h4>
    </div>
    <table id="table1" class="table table-striped table-bordered table-condensed">
        <tr>
            <td style="text-align: right;">问卷标题<font color="#FF0000">*</font></td>
            <td>
                <c:choose>
                    <c:when test="${p2pRiskPaper.paperState=='2' || p2pRiskPaper.paperState=='3'||p2pRiskPaper.paperState=='4'}">
                        ${p2pRiskPaper.paperTitle}
                    </c:when>
                    <c:otherwise>
                        <form:input path="paperTitle" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
                    </c:otherwise>
                </c:choose>
            </td>
            <td style="text-align: right;">版本号<font color="#FF0000">*</font></td>
            <td>
                <c:choose>
                    <c:when test="${p2pRiskPaper.paperState=='2'||p2pRiskPaper.paperState=='3'||p2pRiskPaper.paperState=='4'}">
                        ${p2pRiskPaper.paperVersion}
                    </c:when>
                    <c:otherwise>
                        <form:input path="paperVersion" htmlEscape="false" maxlength="50"
                                    class="input-xlarge required"/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">说明<font color="#FF0000">*</font></td>
            <td>
                <c:choose>
                    <c:when test="${p2pRiskPaper.paperState=='2'||p2pRiskPaper.paperState=='3'||p2pRiskPaper.paperState =='4'}">
                        ${p2pRiskPaper.paperExplain}
                    </c:when>
                    <c:otherwise>
                        <form:input path="paperExplain" htmlEscape="false" maxlength="64"
                                    class="input-xlarge required"/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">编制人</td>
            <td>
                <c:choose>
                    <c:when test="${p2pRiskPaper.paperState=='2'||p2pRiskPaper.paperState=='3'}">
                        ${p2pRiskPaper.user.name}
                    </c:when>
                    <c:otherwise>
                        <form:input path="user.id" value="${p2pRiskPaper.user.name}" htmlEscape="false" maxlength="15"
                                    readOnly="true" class="input-xlarge required"/>
                    </c:otherwise>
                </c:choose>
            </td>

            <td style="text-align: right;">编制时间</td>
            <td>
                <c:choose>
                    <c:when test="${p2pRiskPaper.paperState=='2'||p2pRiskPaper.paperState=='3'}">

                        <fmt:formatDate value="${p2pRiskPaper.drawTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </c:when>
                    <c:otherwise>
                        <fmt:formatDate value="${p2pRiskPaper.drawTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>

            <th>题目分类</th>
            <th>题目内容<font color="#FF0000">*</font></th>
            <th>选择方式</th>
            <th>顺序</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${p2pRiskQuestionList}" varStatus="status" var="p2pRiskQuestion">
            <tr>
                    <%-- <!--问卷id-->
                    <td>${p2pRiskQuestion.paperId}</td> --%>
                <!--题目分类-->
                <td>${fns:getDictLabel(p2pRiskQuestion.questionType,'question_type','')}</td>
                <!--题目内容-->
                <td>${p2pRiskQuestion.questionContent}</td>
                <!--选择方式-->
                <td>${fns:getDictLabel(p2pRiskQuestion.selectWay,'select_way','')}</td>
                <!--顺序-->
                <td>${p2pRiskQuestion.sort}</td>
                <!--操作-->

                <td>
                    <c:choose>
                        <c:when test="${p2pRiskPaper.paperState=='1'||p2pRiskPaper.paperState==null}">
                            <a onclick="model_edit('${p2pRiskQuestion.id}');" style="cursor:pointer;"
                               data-toggle="modal" data-target="#myModal_view"">新增</a>
                            <a href="${ctx}/p2p/risk/p2pRiskQuestion/delete?id=${p2pRiskQuestion.id}&paperId=${p2pRiskQuestion.paperId}"
                               onclick="return confirmx('确认要删除？', this.href)">删除</a>
                        </c:when>
                        <c:otherwise>
                            <a onclick="model_edit('${p2pRiskQuestion.id}');" style="cursor:pointer;"
                               data-toggle="modal" data-target="#myModal_view"">查看</a>
                        </c:otherwise>
                    </c:choose>

                </td>

            </tr>
        </c:forEach>


        <c:if test="${p2pRiskPaper.paperState=='1'||p2pRiskPaper.paperState==null}">
            <tr>
                    <%-- <td>
                 <form:input path="paperId" value="${p2pRiskQuestionList.size()==0?'':(p2pRiskQuestionList.get(0).paperId)}" htmlEscape="false" maxlength="15" class="input-xlarge required"/>
                    </td> --%>
                <!--题目分类-->
                <td><form:select path="questionType" class="input-medium-select">
                    <form:options items="${fns:getDictList('question_type')}" itemLabel="label" itemValue="value"
                                  htmlEscape="false"/>
                </form:select></td>
                <!--题目内容-->
                <td><form:input path="questionContent" htmlEscape="false" maxlength="200"
                                class="input-xlarge required"/></td>
                <!--选择方式-->
                <td><form:select path="selectWay" class="input-medium-select">

                    <form:options items="${fns:getDictList('select_way')}" itemLabel="label" itemValue="value"
                                  htmlEscape="false"/>
                </form:select></td>
                <!--顺序-->
                <td><form:input path="sort" value="${p2pRiskQuestionList.size()+1}" htmlEscape="false" maxlength="15"
                                class="input-mini " readonly="readonly"/></td>
                <!--操作-->
                <td>
                    <a onclick="model_add();" style="cursor:pointer;">
                        添加 </a>

                </td>
            </tr>
        </c:if>

        <c:if test="${p2pRiskPaper.paperState=='2'}">
            <table class="table table-striped table-bordered table-condensed" id="table3">
                <caption><b>审核意见</b></caption>
                <tr>
                    <td style="text-align: right;">审核人</td>
                    <td>
                        <form:input path="auditId" value="${p2pRiskPaper.user.name}" htmlEscape="false" maxlength="15"
                                    readOnly="true" class="input-xlarge"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">审核时间</td>
                    <td>
                        <form:input path="auditTime" value="${p2pRiskPaper.auditTime2}" htmlEscape="false"
                                    maxlength="15" readOnly="true" class="input-xlarge"/>
                    </td>
                </tr>
            </table>
        </c:if>


        <c:if test="${p2pRiskPaper.paperState=='3'}">
            <table class="table table-striped table-bordered table-condensed" id="table3">
                <caption><b>发布意见</b></caption>
                <tr>
                    <td style="text-align: right;">发布人</td>
                    <td>
                        <form:input path="publishId" value="${p2pRiskPaper.user.name}" htmlEscape="false" maxlength="15"
                                    readOnly="true" class="input-xlarge"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">发布时间</td>
                    <td>
                        <form:input path="publishTime" value="${p2pRiskPaper.publishTime2}" htmlEscape="false"
                                    readOnly="true" class="input-xlarge"/>
                    </td>
                </tr>
            </table>

        </c:if>
        </tbody>
    </table>


    <c:if test="${p2pRiskPaper.paperState=='1'}">
        <input class="btn btn-primary" type="button" value="提交" onclick="tijiao();"/>
    </c:if>
    <c:if test="${p2pRiskPaper.paperState=='2'}">
        <tr>
            <td>审核意见</td>
            <td>
                <select name="auditOpinion" class="input-medium-select">
                    <c:forEach items="${fns:getDictList('pass_nopass')}" var="item">
                        <option value="${item.value }">${item.label }</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <input type="button" class="btn btn-primary" onclick="shenhe()" value="审核"/>

    </c:if>
    <c:if test="${p2pRiskPaper.paperState=='3'}">

        <input class="btn btn-primary" type="button" value="发布" onclick="fabu()"/>
    </c:if>

</form:form>
<c:if test="${p2pRiskPaper.paperState=='2'||p2pRiskPaper.paperState=='3'}">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</c:if>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_view" tabindex="-1" role="dialog"
     style="overflow:-scroll;overflow-y:auto;display:none;height:520px;"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
</div>

</body>
</html>