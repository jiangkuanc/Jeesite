<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>国外信息管理</title>
    <meta name="decorator" content="default"/>
    <!-- <script type="text/javascript">
        $(document).ready(function() {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script> -->
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/cms/cmsForeignCountry/list">国外信息列表</a></li>
    <li class="active"><a
            href="${ctx}/cms/cmsForeignCountry/form?id=${cmsForeignCountry.id}">国外信息${not empty cmsForeignCountry.id?'修改':'添加'}</a>
    </li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="cmsForeignCountry" action="${ctx}/cms/cmsForeignCountry/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">国外区域名称</label>
        <div class="controls">
            <select name="cmsForgignAreaId">
                <c:forEach items="${cmsForeignAreaList}" var="vo">
                    <option value="${vo.id}"
                            <c:if test="${cmsForeignCountry.cmsForgignAreaId==vo.id}">selected="selected"</c:if>>${vo.areaname}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">国家名称：</label>
        <div class="controls">
            <form:input path="cmsCountryName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>


    <div class="control-group">
        <label class="control-label">国家基本情况：</label>
        <div class="controls">
            <textarea name="cmsCountryBasic"
                      style="width: 1384px;height:300px;">${cmsForeignCountry.cmsCountryBasic }</textarea>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">国家地理位置：</label>
        <div class="controls">
            <textarea name="cmsCountryPosition"
                      style="width: 1384px;height:300px;">${cmsForeignCountry.cmsCountryPosition}</textarea>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">国家人口：</label>
        <div class="controls">
            <textarea name="cmsCountryPopulation"
                      style="width: 1384px;height:300px;">${cmsForeignCountry.cmsCountryPopulation}</textarea>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">民族：</label>
        <div class="controls">
            <textarea name="cmsCountryNation"
                      style="width: 1384px;height:300px;">${cmsForeignCountry.cmsCountryNation}</textarea>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">国旗(png或jpg格式):</label>
        <div class="controls">
            <form:textarea id="content" path="content" rows="4" maxlength="200" class="input-xxlarge"/>
            <sys:ckeditor replace="content" uploadPath="/cms/foreignArea"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>