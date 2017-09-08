<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css"
      type="text/css" rel="stylesheet"/>
<link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet"/>
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<script>
    //alert(checked=${msg_templet.templetTate}==20?"checked":false);
    /* 	$(function(){
     if(${msg_templet.templetTate}==10){
     //alert(123);
     $('#template1').attr('checked',true);
     }
     if(${msg_templet.templetTate}==20){
     $('#template2').attr('checked',true);
     }
     }); */
</script>
<div class="modal-dialog" style="width:600px;">
    <!-- <div class="modal-content"> -->
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">短信发送通知</h4>
    </div>
    <div class="modal-body">
        <div class="control-group">
            <label class="control-label">发件人：</label>
            <input name="user.name" htmlEscape="false"
                   value="${name}" type="text"
                   class="input-xlarge " style="display:block;"/>
        </div>
        <div class="control-group">
            <label class="control-label">发送时间：</label>
            <c:set var="now" value="${msgSmsRecord.sendDate}"/>
            <input name="sendDate" type="text" htmlEscape="false"
                   value='<fmt:formatDate type="both"  dateStyle="medium" timeStyle="medium" value="${now}" />'
                   class="input-xlarge" style="display:block;"/>
            </input>
        </div>
        <div class="control-group">
            <label class="control-label">标题：&emsp;&emsp;</label>
            <input name="title" type="text" htmlEscape="false" value="${msgLetterRecord.title}" class="input-xlarge "
                   style="display:block;"/>
        </div>

        <%-- <label class="control-label">内容：</label>
        <br>
        <textarea id="content" name="content" maxlength="255" rows="4" class="input-xxlarge">
                ${msgLetterRecord.content}
        </textarea> --%>
        <div class="control-group">
            <%-- <label class="control-label">内容：</label>
            <div class="prediv" style="width:100%;word-wrap: break-word;">${msgLetterRecord.content}</div>	 --%>
            <label class="control-label">内容：</label>
            <br>
            <%-- <textarea id="content" name="content" style="width:100%;word-wrap: break-word;"  class="input-xxlarge">
                    ${msgLetterRecord.content}
            </textarea> --%>
            <div class="prediv" style="width:100%;word-wrap: break-word;">${msgLetterRecord.content}</div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
    <!-- </div> -->
</div>



