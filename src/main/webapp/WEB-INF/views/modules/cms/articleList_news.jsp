<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>新闻发布管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function viewComment(href) {
            top.$.jBox.open('iframe:' + href, '查看评论', $(top.document).width() - 220, $(top.document).height() - 120, {
                buttons: {"关闭": true},
                loaded: function (h) {
                    $(".jbox-content", top.document).css("overflow-y", "hidden");
                    $(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
                    $("body", h.find("iframe").contents()).css("margin", "10px");
                }
            });
            return false;
        }
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/cms/article/?category.id=${article.category.id}">新闻列表</a></li>
    <shiro:hasPermission name="cms:article:edit">
        <li>
            <a href="<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'>
					<c:param name='category.name' value='${article.category.name}'/></c:url>">新闻添加
            </a>
        </li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="article" action="${ctx}/cms/article/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <label>栏目：</label><sys:treeselect id="category" name="category.id" value="${article.category.id}"
                                      labelName="category.name" labelValue="${article.category.name}"
                                      title="栏目" url="/cms/category/treeData" module="article"
                                      notAllowSelectRoot="false" cssClass="input-small"/>
    <label>标题：</label><form:input path="title" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
    <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
    <%-- <label>状态：</label><form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/> --%>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>标题</th>
        <th>发布者</th>
        <th>权重</th>
        <th>浏览次数</th>
        <th>更新时间</th>
        <th>审核状态</th>
        <th>处理结果</th>
        <th>初审人</th>
        <th>复审人</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="article">
        <tr>
            <td>
                <a href="${ctx}/cms/article/form?id=${article.id}">${fns:abbr(article.title,20)}</a>
            </td>
            <td>${fns:abbr(article.speaker,20)}</td>
            <td>${article.weight }</td>
            <td>${article.hits }</td>
            <td><fmt:formatDate value="${article.updateDate}" type="both"/></td>
            <td>
                <c:if test="${article.statusCode eq '1'}">
                    初审
                </c:if>
                <c:if test="${article.statusCode eq '2'}">
                    已初审
                </c:if>
                <c:if test="${article.statusCode eq '3'}">
                    待复审
                </c:if>
                <c:if test="${article.statusCode eq '4'}">
                    已复审
                </c:if>
                <c:if test="${article.statusCode eq '5'}">
                    发布
                </c:if>
                <c:if test="${article.statusCode eq '6'}">
                    待初审 <!-- 初审拒绝后的待初审 -->
                </c:if>
                <c:if test="${article.statusCode eq '7'}">
                    待复审 <!-- 复审拒绝后的待复审 -->
                </c:if>
            </td>
            <td>
                <c:if test="${article.statusCode eq '2'}">
                    通过
                </c:if>
                <c:if test="${article.statusCode eq '4'}">
                    通过
                </c:if>
                <c:if test="${article.statusCode eq '5'}">
                    通过
                </c:if>
                <c:if test="${article.statusCode eq '6'}">
                    拒绝
                </c:if>
                <c:if test="${article.statusCode eq '7'}">
                    拒绝
                </c:if>
            </td>
            <td>${article.auditor }</td>
            <td>${article.reauditor }</td>
            <td>
                <shiro:hasPermission name="cms:article:edit">
                    <c:if test="${article.category.allowComment eq '1'}">
                        <shiro:hasPermission name="cms:comment:view">
                            <a href="${ctx}/cms/comment/?module=article&contentId=${article.id}&delFlag=2"
                               onclick="return viewComment(this.href);">评论</a>
                        </shiro:hasPermission>
                    </c:if>
                    <a href="${ctx}/cms/article/form?id=${article.id}">修改</a>
                    <shiro:hasPermission name="cms:article:audit">
                        <a href="${ctx}/cms/article/delete?id=${article.id}${article.delFlag ne 0?'&isRe=true':''}&categoryId=${article.category.id}"
                           onclick="return confirmx('确认要${article.delFlag ne 0?'发布':'删除'}该文章吗？', this.href)">${article.delFlag ne 0?'发布':'删除'}</a>
                    </shiro:hasPermission>
                    <c:if test="${article.statusCode eq '1'}"><a
                            href="${ctx}/cms/article/audit?id=${article.id}">初审</a></c:if>
                    <c:if test="${article.statusCode eq '6'}"><a
                            href="${ctx}/cms/article/audit?id=${article.id}">初审</a></c:if>
                    <c:if test="${article.statusCode eq '2'}"><a
                            href="${ctx}/cms/article/fushen?id=${article.id}">复审</a> </c:if>
                    <c:if test="${article.statusCode eq '7'}"><a
                            href="${ctx}/cms/article/fushen?id=${article.id}">复审</a> </c:if>
                    <c:if test="${article.statusCode eq '3'}"><a
                            href="${ctx}/cms/article/fushen?id=${article.id}">复审</a> </c:if>
                    <c:if test="${article.statusCode eq '4'}"><a
                            href="${ctx}/cms/article/fabu?id=${article.id}">发布</a> </c:if>
                    <c:if test="${article.statusCode eq '5'}"></c:if>
                </shiro:hasPermission>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>