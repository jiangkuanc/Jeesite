<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>cmsca管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
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

        function confirm(e) {
            if (e && e.preventDefault)
                e.preventDefault();
            var cmsChinaAreaCityName = $("#cmsChinaAreaCityName").val();
            var cmsChinaAreaCityBasic = $("#cmsChinaAreaCityBasic").val();
            var cmsChinaAreaCityPosition = $("#cmsChinaAreaCityPosition").val();
            var cmsChinaAreaCityPopulation = $("#cmsChinaAreaCityPopulation").val();
            var cmsChinaAreaCityNation = $("#cmsChinaAreaCityNation").val();
            var content = $("#content").val();
            /* if(cmsChinaAreaCityName=="" || cmsChinaAreaCityName==null){
             alert("省市名称不能为空");
             return false;
             } */
            if (cmsChinaAreaCityBasic == "" || cmsChinaAreaCityBasic == null) {
                alert("基本信息不能为空");
                return false;
            }
            if (cmsChinaAreaCityName == "" || cmsChinaAreaCityName == null) {
                alert("地理位置不能为空");
                return false;
            }
            if (cmsChinaAreaCityName == "" || cmsChinaAreaCityName == null) {
                alert("人口不能为空");
                return false;
            }
            if (cmsChinaAreaCityName == "" || cmsChinaAreaCityName == null) {
                alert("民族不能为空");
                return false;
            }

            return false;
        }
    </script>
</head>
<body>
<form:form id="inputForm" modelAttribute="cmsChinaAreaCity" action="${ctx}/cmsca/cmsChinaAreaCity/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <div class="control-group">
        <label class="control-label">区域名称</label>
        <div class="controls">
            <select name="cmsChinaAreaId">
                <c:forEach items="${cmsChinaAreaList}" var="vo">
                    <option value="${vo.id}"
                            <c:if test="${cmsChinaArea.areaname==vo.areaname}">selected="selected"</c:if>>${vo.areaname}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">城市名称</label>
        <div class="controls">
            <form:input path="cmsChinaAreaCityName" htmlEscape="false" maxlength="255" class="input-xlarge "
                        id="cmsChinaAreaCityName"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">基本介绍</label>
        <div class="controls">
            <textarea name="cmsChinaAreaCityBasic" style="width: 1384px;height:300px;"
                      id="cmsChinaAreaCityBasic">${cmsChinaAreaCity.cmsChinaAreaCityBasic}</textarea>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">地理位置</label>
        <div class="controls">
            <textarea name="cmsChinaAreaCityPosition" style="width: 1384px;height:300px;"
                      id="cmsChinaAreaCityPosition">${cmsChinaAreaCity.cmsChinaAreaCityPosition}</textarea>
        </div>
    </div>

    </div>
    <div class="control-group">
        <label class="control-label">人口</label>
        <div class="controls">
            <textarea id="cmsChinaAreaCityPopulation" name="cmsChinaAreaCityPopulation"
                      style="width: 1384px;height:300px;">${cmsChinaAreaCity.cmsChinaAreaCityPopulation}</textarea>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">民族</label>
        <div class="controls">
            <textarea id="cmsChinaAreaCityNation" name="cmsChinaAreaCityNation"
                      style="width: 1384px;height:300px;">${cmsChinaAreaCity.cmsChinaAreaCityNation}</textarea>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">图片(png或jpg格式):</label>
        <div class="controls">
            <form:textarea id="content" path="content" rows="4" maxlength="200" class="input-xxlarge"
                           readonly="readonly"/>
            <sys:ckeditor replace="content" uploadPath="/cms/area"/>
        </div>
    </div>

    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>