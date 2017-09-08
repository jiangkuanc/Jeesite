<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${fns:getConfig('frontSiteName')}</title>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/manhuaDate.1.0.css">

</head>
<body>
</br></br>
<form:form id="inputForm" name="form1" modelAttribute="infTender" action="${ctx}/info/infTender/save" method="post"
           class="form-horizontal">
    <div class="control-group">
        <label class="control-label">项目名称</label>
        <div class="controls">
            <form:input path="projectName" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">有效期至</label>
        <div class="controls">
            <input id="termOfValidity" name="termOfValidity" type="text" readonly="readonly" maxlength="20"
                   class="input-medium Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>

            <span class="help-inline"><font color="red">*</font></span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">项目所在地</label>
        <div class="controls">
            <form:input path="projectLocation" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">投资方</label>
        <div class="controls">
            <form:input path="investmentSide" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">承建方</label>
        <div class="controls">
            <form:input path="constructionSide" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">行业</label>
        <div class="controls">
            <select name="industry">
                <option value="石化">石化</option>
                <option value="新能源">新能源</option>
                <option value="生产加工">新能源</option>
                <option value="销售">销售</option>
            </select>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">项目进度</label>
        <div class="controls">
            <select name="envyProgress">
                <option value="施工阶段">施工阶段</option>
                <option value="筹备阶段">筹备阶段</option>
            </select>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>


    <div class="control-group">
        <label class="control-label">承建方企业logo</label>
        <div class="controls">
            <form:hidden id="constructionSiteLogo" path="constructionSiteLogo" htmlEscape="false" maxlength="255"
                         class="input-xlarge"/>
            <sys:ckfinder input="constructionSiteLogo" type="images" uploadPath="/info/infTender/constructionSiteLogo"
                          selectMultiple="true" maxWidth="100" maxHeight="100"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">联系人</label>
        <div class="controls">
            <form:input path="contactsPerson" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">职务</label>
        <div class="controls">
            <form:input path="positionPerson" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">联系电话</label>
        <div class="controls">
            <form:input path="telphone" htmlEscape="false" maxlength="50"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">招标内容</label>
        <div class="controls">
            <form:textarea id="biddingContent" path="biddingContent" rows="4" maxlength="200" class="input-xxlarge"/>
            <sys:ckeditor replace="biddingContent" uploadPath="/info/infTender/biddingContent"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">企业招标书扫描件</label>
        <div class="controls">
            <input type="hidden" id="projectZhao" name="projectZhao" path="projectZhao" htmlEscape="false"
                   maxlength="255" class="input-xlarge"/>
            <sys:ckfinder input="projectZhao" type="files" uploadPath="/info/infTender/projectZhao"
                          selectMultiple="true"/>
        </div>
    </div>

    <div class="control-group">
        <div class="controls">
            <input type="radio" name="pan" value="pub">发布
            <input type="radio" name="pan" value="sav">保存<br><br>
        </div>
    </div>


    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-primary" style="width:auto;" name="signup" value="Sign up" id="sav">
                提交
            </button>&nbsp;&nbsp;&nbsp;
            <!-- <button type="button" class="btnbtn-primary" style="width:auto;" name="signup" value="Sign up" id="pub">发布</button>&nbsp;&nbsp;&nbsp;
           <button type="button" class="btnbtn-primary" style="width:auto;" name="signup" value="Sign up" id="sav" >保存</button>&nbsp;&nbsp;&nbsp; -->
            <button type="button" class="btn btn-primary" id="resetBtn" onclick="abc()">取消</button>
        </div>
    </div>
</form:form>


<!-- 引入footer页脚文件 -->
<%-- <script type="text/javascript" src="${ctxStatic }/dist/js/manhuaDate.1.0.js"></script> --%>
<script src="${ctxStatic }/My97DatePicker/calendar.js"></script>
<script src="${ctxStatic }/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    function submitTest() {
        return true;

    }
</script>
</body>
</html>