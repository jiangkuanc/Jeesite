<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta name="author" content="http://thinkgem.iteye.com"/>
<meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10"/>
<div class="zh-left pull-left">
    <p class="zh-p"><a href="${ctx}/user/accountGeneration/showAllInformation" style="color:#bf1a20;">账户总览</a></p>
    <ul class="zhzl">
        <li data-i="0" class=" zhzllevel1  xiajian zhzl-li">
            <p class="zhtext "><a href="javascript:;">我的投资</a></p>
            <ul class="zhzllevel2 leftMenu">
                <li class="menuCls"><a href="${ctx}/user/personInvestment/loadInfo?mode=investmentGeneral">投资总览</a></li>
                <li class="menuCls"><a href="${ctx}/user/personInvestment/ctrlMenuPerson?mode=investmentIncome">投资收益</a>
                </li>
                <%-- <li><a href="${ctx}/user/personInvestment/ctrlMenu?mode=investmentRecord">投资记录</a></li> --%>
            </ul>
        </li>

        <li data-i="1" class=" zhzllevel1 xiajian zhzl-li">
            <p class="zhtext "><a href="javascript:;">资金记录</a></p>
            <ul class="zhzllevel2 zhgl leftMenu">
                <!--  <li><a href="bangdingsjh.html?mode=spendRecord">费用记录</a></li> -->
                <li class="menuCls"><a
                        href="${ctx}/p2p/user/p2pAccountRechargeRecord/loadRechargeRecord?mode=spendRecord">充值记录</a>
                </li>
                <li class="menuCls"><a
                        href="${ctx}/p2p/user/p2pAccountWithdrawRecord/loadWithdrawRecord?mode=chargeRecord">提现记录</a>
                </li>
            </ul>
        </li>
        <li data-i="2" class=" zhzllevel1 xiajian zhzl-li">
            <p class="zhtext "><a href="javascript:;">账户管理</a></p>
            <ul class="zhzllevel2 zhgl leftMenu">
                <li class="menuCls"><a href="${ctx}/msg/msgSmsRecord/showSmsPage?mode=bindPhone">绑定手机号</a></li>
                <li class="er menuCls"><a href="${ctx}/user/accountGeneration/loadCertifyPage?mode=auth">身份认证</a></li>
                <li class="menuCls"><a href="${ctx}/user/bankManage/bankInfo?mode=bankCard">银行卡管理</a></li>
                <li class="menuCls"><a href="${ctx}/user/Institution/ctrlMenuPerson?mode=riskRecord">风险测评</a></li>
                <li class="menuCls"><a href="${ctx}/user/bankCard/beMember?mode=member">会员管理</a></li>
                <li class="menuCls"><a href="${ctx}/msg/msgLetterRecord/getMsgList?mode=message">消息中心</a></li>
                <%-- <li class="menuCls"><a href="${ctx}/user/Institution/ctrlMenuPerson?mode=reportRecord">举报管理</a></li>  --%>
                <li class="menuCls"><a href="${ctx}/user/personInvestment/ctrlMenuPerson?mode=pwdManager">密码管理</a></li>

            </ul>
        </li>
        <li data-i="3" class=" zhzllevel1 xiajian zhzl-li leftMenu">
            <p class="zhtext "><a href="javascript:;">交易助手</a></p>
            <ul class="zhzllevel2 zhgl">
                <li class="menuCls"><a href="${ctx}/user/calculator/calPage?mode=calculator">计算器</a></li>
            </ul>
        </li>

    </ul>
</div>
<script type="text/javascript">
    var mode = '${param.mode}';
    //测试是否获取浏览器参数mode值 alert(mode)
    switch (mode) {
        case 'investmentGeneral':
            $(".menuCls:eq(0)").attr('class', 'tz-active');
            break;	//投资总览alert($(".menuCls:eq(0)"));
        case 'investmentIncome' :
            $(".menuCls:eq(1)").attr('class', 'tz-active');
            break;													//投资收益
        case 'spendRecord':
            $(".menuCls:eq(2)").attr('class', 'tz-active');
            break;			//充值记录
        case 'chargeRecord':
            $(".menuCls:eq(3)").attr('class', 'tz-active');
            break;		//提现记录
        case 'bindPhone':
            $(".menuCls:eq(4)").attr('class', 'tz-active');
            break;			//绑定手机号
        case 'auth':
            $(".menuCls:eq(5)").attr('class', 'tz-active');
            break;				//身份认证
        case 'bankCard' :
            $(".menuCls:eq(6)").attr('class', 'tz-active');
            break;			//银行卡管理
        case 'riskRecord':
            $(".menuCls:eq(7)").attr('class', 'tz-active');
            break;		//风险测评
        case 'member' :
            $(".menuCls:eq(8)").attr('class', 'tz-active');
            break;				//会员管理
        case 'message':
            $(".menuCls:eq(9)").attr('class', 'tz-active');
            break;			//消息中心
        case 'reportRecord':
            $(".menuCls:eq(10)").attr('class', 'tz-active');
            break;				//举报管理
        case 'pwdManager':
            $(".menuCls:eq(11)").attr('class', 'tz-active');
            break;			//密码管理
        case 'calculator':
            $(".menuCls:eq(12)").attr('class', 'tz-active');
            break;			//计算器
        default:
            '';
    }

    /*  function changeCls(index){
     $(".menuCls:eq(+index).attr('class','tz-active');
     }  */

    /* //'.leftMenu li:eq(5)
     //var mode = '${param.mode}';
     $(".leftMenu li a").click(function(){
     $(this).parent().attr('class','tz-active');
     var cStyleNode = $(this).parent();
     console.log($(this).parent());
     clsDataArray.push($(this).parent());
     //$(this).parent().siblings().find("li").removeAttr('class','tz-active');
     })
     }); */
    $(function () {
        $(".zh-left").css("height", "900px");
    });


    //鼠标点击之后页签颜色显示
    //$(".menuCls").each(function(i,dom){
    /* $(".menuCls").click(function(){
     //得到点击该menuCls元素,同时获取该data-index属性
     var menuCls = $(this).attr("data-index");

     $(".menuCls").each(function(i,ele){
     if(menuCls===i){
     //为当前这个li的DOM元素设置鼠标点击后的样式
     $(this).css("background","red")
     }
     })
     }) */
    // })

</script>
	