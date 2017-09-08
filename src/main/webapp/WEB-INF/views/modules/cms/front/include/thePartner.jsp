<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta name="author" content="http://thinkgem.iteye.com"/>
<meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10"/>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 hzhb" style="position: inherit;">
            <h3>
                <i style="color:#be191f;">———————</i>合作伙伴<i style="color:#be191f;">———————</i>
            </h3>
            <div class="hzhb-div" id="partner">
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_28.jpg" alt="">
                </a>
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_30.jpg" alt="">
                </a>
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_32.jpg" alt="">
                </a>
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_34.jpg" alt="">
                </a><br>
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_40.jpg" alt="">
                </a>
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_41.jpg" alt="">
                </a>
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_42.jpg" alt="">
                </a>
                <a href="###">
                    <img src="${ctxStatic}/dist/images/slhj_index_hzhb_43.png" alt="">
                </a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${ctx}/p2p/config/p2pFriendshipLink/findPublish",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var str = '';
                for (var i = 0; i < data.length; i++) {
                    var linkAddress = data[i]['linkAddress'];
                    var linkIcon = data[i]['linkIcon'];
                    str += "<a target='_blank' href='" + linkAddress + "'>" +
                        "<img src='" + linkIcon + "' alt=''>" +
                        "</a>";
                }

                if (data.length > 0) {
                    $("#partner").html(str);
                }
            }
        })
    })
</script>