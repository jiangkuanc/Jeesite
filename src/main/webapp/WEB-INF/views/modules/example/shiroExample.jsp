<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>shiro权限管理示例</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
    </script>
</head>
<body>
shiro:guest, 我是游客.<br>
shiro:user, 我不是游客.<br>
guest 标签与user 标签逻辑相反。<br>
The authenticated tag 仅仅只当当前用户在当前会话中成功地通过了身份验证authenticated 标签才会显示包含的内容。它比'user'标签更为严格。它在逻辑上与'notAuthenticated'标签相反。<br>

<shiro:guest>
    shiro:guest, 我是游客.<br>
</shiro:guest>
<shiro:user>
    shiro:user, 我不是游客.<br>
</shiro:user>

<shiro:authenticated>
    authenticated<br>
</shiro:authenticated>
<shiro:notAuthenticated>
    notAuthenticated<br>
</shiro:notAuthenticated>

显示User ID:<shiro:principal/><br>
显示User name:<shiro:principal property="name"/><br>

1.仅当当前Subject 被分配了具体的角色,name提角色表中的ename字段：<br>
<shiro:hasRole name="dept">
    我被分配“dept系统管理员”角色<br>
</shiro:hasRole>
<shiro:lacksRole name="administrator">
    我没被分配“dept系统管理员”角色<br>
</shiro:lacksRole>
lacksRole 标签与hasRole 标签逻辑相反。<br>

<shiro:hasAnyRoles name="dept, d">
    我被分配“dept系统管理员”或“d普通用户”角色<br>
</shiro:hasAnyRoles>

<shiro:hasPermission name="sys:log:view">
    我被分配“sys:log:view日志查看权限”<br>
</shiro:hasPermission>

<shiro:lacksPermission name="sys:log:view">
    我没被分配“sys:log:view日志查看权限”<br>
</shiro:lacksPermission>

<shiro:hasAnyPermissions name="sys:log:view,sys:menu:edit">
    我被分配“sys:log:view日志查看权限”或“sys:menu:edit菜单修改权限”<br>
</shiro:hasAnyPermissions>
<br>
JAVA Controller 类中shiro权限控制示例：<br>
在方法前添加：@RequiresPermissions("sys:area:view")<br>
<br>
具体请参考：http://blog.csdn.net/peterwanghao/article/details/8735014
</body>
</html>