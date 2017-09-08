<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<form:form id="inputForm" modelAttribute="infTender" action="${ctx}/info/infTender/save" method="post"
           class="form-horizontal">
    <div class="control-group">
        <label class="control-label">项目名称</label>
        <div class="controls">
            <form:input path="projectName" htmlEscape="false" maxlength="50"/>

        </div>
    </div>

    <div class="control-group">
        <label class="control-label">有效期至</label>
        <div class="controls">
            <fmt:formatDate value="${infTender.termOfValidity}" pattern="yyyy-MM-dd"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">项目所在地</label>
        <div class="controls">
            <form:input path="projectLocation" htmlEscape="false" maxlength="50"/>

        </div>
    </div>

    <div class="control-group">
        <label class="control-label">投资方</label>
        <div class="controls">
            <form:input path="investmentSide" htmlEscape="false" maxlength="50"/>

        </div>
    </div>

    <div class="control-group">
        <label class="control-label">承建方</label>
        <div class="controls">
            <form:input path="constructionSide" htmlEscape="false" maxlength="50"/>

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

        </div>
    </div>

    <div class="control-group">
        <label class="control-label">项目进度</label>
        <div class="controls">
            <select name="envyProgress">
                <option value="施工阶段">施工阶段</option>
                <option value="筹备阶段">筹备阶段</option>
            </select>

        </div>
    </div>


    <div class="control-group">
        <label class="control-label">承建方企业logo</label>
        <div class="controls">
            <form:hidden id="constructionSiteLogo" path="constructionSiteLogo" htmlEscape="false" maxlength="255"
                         class="input-xlarge"/>
            <sys:ckfinder input="constructionSiteLogo" type="images" uploadPath="/info/infTender/constructionSiteLogo"
                          selectMultiple="false" maxWidth="100" maxHeight="100"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">联系人</label>
        <div class="controls">
            <form:input path="contactsPerson" htmlEscape="false" maxlength="50"/>

        </div>
    </div>

    <div class="control-group">
        <label class="control-label">职务</label>
        <div class="controls">
            <form:input path="positionPerson" htmlEscape="false" maxlength="50"/>

        </div>
    </div>

    <div class="control-group">
        <label class="control-label">联系电话</label>
        <div class="controls">
            <form:input path="telphone" htmlEscape="false" maxlength="50"/>

        </div>
    </div>

    <div class="control-group">
        <label class="control-label">招标内容</label>
        <div class="controls">
            <textarea style="width: 1384px;height:300px;">${infTender.biddingContent}</textarea>
                <%-- 	 <form:textarea id="biddingContent"   path="biddingContent" rows="4" maxlength="200" class="input-xxlarge"/>
                 <sys:ckeditor replace="biddingContent"  uploadPath="/info/infTender/biddingContent"/>  --%>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">企业招标书扫描件</label>
        <div class="controls">
            <form:input type="hidden" id="projectZhao" name="projectZhao" path="projectZhao" htmlEscape="false"
                        maxlength="255" class="input-xlarge"/>
            <sys:ckfinder input="projectZhao" type="files" uploadPath="/info/infTender/projectZhao"
                          selectMultiple="true"/>
        </div>
    </div>

    <div class="control-group">
        <div class="controls">
            <a href="${ctx}/info/infTender/examineTenderInfo?res=pass&id=${infTender.id}">
                <button type="button" class="btn btn-primary" style="width:auto;" name="signup" value="Sign up">通过
                </button>
            </a>
            <a href="${ctx}/info/infTender/examineTenderInfo?res=nopass&id=${infTender.id}">
                <button type="button" class="btn btn-primary" style="width:auto;" onclick="abc()">不通过</button>
            </a>
            <a>
                <button type="button" class="btn btn-primary" id="resetBtn" onclick="history.go(-1)">返回</button>
            </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</form:form>
</body>

</html>