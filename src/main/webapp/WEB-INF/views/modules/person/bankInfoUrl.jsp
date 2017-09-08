<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <title>${fns:getConfig('frontSiteName')}</title>
    <link rel="stylesheet" href="${ctxStatic }/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh-zjgl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/wdzh.css">
    <link rel="stylesheet" href="${ctxStatic }/dist-gyh/css/zhzl.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/index.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/login.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/left.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/touzizq.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/zhanghu.css">
    <link rel="stylesheet" href="${ctxStatic }/dist/css/jPages.css">
    <script src="${ctxStatic }/dist/js/jquery-1.11.1.min.js"></script>
    <script src="${ctxStatic }/dist/js/bootstrap.min.js"></script>
    <script src="${ctxStatic }/dist/js/left.js"></script>
    <script src="${ctxStatic }/dist/js/jPages.min.js"></script>
    <script type="${ctxStatic}/dist/js/calculator.js"></script>
    <style>
        .zh-right-div-wdyhk h4 label {
            display: line-block;
            width: 50%;
            text-align: right;
            font-weight: 500;
            font-family: "微软雅黑";
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@include file="/WEB-INF/views/modules/cms/front/include/header.jsp" %>

<!--账户总览页面-->
<c:if test="${user.roleList[0].id == '104'}">
    <div class="zh">
        <ol class="breadcrumb">
            <li><b>我的位置：</b></li>
            <li><a href="${frontPath}">首页</a></li>
            <li><a href="${ctx}/user/accountGeneration/showAllInformation">我的账户</a></li>
            <li class="lg-active">管理银行卡</li>
        </ol>
    </div>
</c:if>
<!--内容区域-->
<div class="zh-con">
    <!--左侧内容区域-->
    <jsp:include page="menu.jsp"></jsp:include>
    <!--左侧内容区域结束-->
    <!--右侧内容区域-->
    <div class="zh-right pull-left">
        <div class="zh-right-div zh-right-div-wdyhk" style="width: 65%;">
            <h3>我的银行卡</h3>
            <h4>
                <label>我的银行卡号：</label>
                <c:out value="${p2pAccount.bankAccount}" default="无"></c:out>
            </h4>
            <h4>
                <label>状态：</label>
                <c:if test="${p2pAccount==null||p2pAccount==''}"><span>未绑定</span>
                    <%-- <a href="${ctx}/user/bankCard/binding"></a>  --%>
                    <button id="bindingBank" class="btn btn-default" disabled="disabled"
                            style="margin-left:8%;width:23%;padding:1% 4%">立即绑定
                    </button>
                    <!--<button id="bindingBank" class="btn btn-primary" style="background: #f2434a;margin-left:8%;width:23%;padding:1% 4%">立即绑定</button>-->
                </c:if>
                <c:if test="${p2pAccount!=null&&p2pAccount!=''}"><span>已绑定</span></c:if>
            </h4>
            <h4>
                <label>开户行银行：</label>
                <span class="date"><c:out value="${p2pAccount.bankName}" default="无"></c:out></span>
            </h4>
            <h4>
                <label>开户行所在地：</label>
                <span class="date"><c:out value="${p2pAccount.branchBankName }" default="无"></c:out></span>
            </h4>
            <h4>
                <label>账户类型：</label>
                <span class="date"><c:out value="${p2pAccount.openAccountName }" default="无"></c:out></span>
            </h4>
            <h4>
                <label>银行预留手机号：</label>
                <span class="date"><c:out value="${p2pAccount.openAccountName }" default="无"></c:out></span>
            </h4>
            <h4>
                <label>银行卡类型：</label>
                <span class="date"><c:out value="${p2pAccount.openAccountName }" default="无"></c:out></span>
            </h4>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<!--账户总览内容区域结束-->
</div>
<script type="text/javascript">
    $(function () {
        //服务器端请求参数类
        var requestParam = {
            remoteUrl: "${ctx}/user/bankManage/validCertifyStep",	//服务端地址
            method: "get",	//请求方式
            isSync: true,	//是否异步,防止重复提交
            isCache: false,	//是否启用缓存
            cacheExpired: 0,	//缓存时间设置
            params: {date: new Date()}		//请求参数
        }

        //创建客户端获取服务端请求的工具类
        var CertifyStepUtils = {
            /**
             * -4.网络异常
             * -3.实名认证失败
             * -2.实名认证审核
             * -1.未进行实名认证
             * 0.未进行绑卡
             * 1.未进行风险测评
             * 2.未成为会员
             * 3.实名认证完成
             */
            //获取
            getCertifyStepVal: function () {
                $("#bindingBank").click(function () {
                    if (requestParam.method == "get") {
                        //如果请求方式是get方式,则使用get请求
                        $.get(requestParam.remoteUrl, requestParam.params, function (data) {
                            var retVal = eval(data);//将字符串转换为json对象
                            return whickCertifyStep(retVal);
                        })
                    } else {
                        return "";
                    }
                })//为立即绑定按钮添加click事件
            }
        }
        //客户端调用
        var retVal = CertifyStepUtils.getCertifyStepVal();
        if (retVal == null || retVal == "" || retVal == undefined) {
        }
    })
    //校验用户实名认证的阶段,判断是否能进行绑卡
    function whickCertifyStep(retVal) {
        switch (retVal) {
            case "-4":
                alert("网络异常!");
                break;
            case "-3":
                if (true == confirm("实名认证失败,是否再次进行实名认证？")) {
                    window.location.href = "${ctx}/user/bankCard/binding";
                } else {
                    return;
                }
                ;
                break;
            case "-2":
                alert("实名认证审核中,请等待！");
                break;
            case "-1":
                if (true == confirm("未进行实名认证,是否进行先实名认证？")) {
                    window.location.href = "${ctx}/user/bankCard/binding";
                } else {
                    return;
                }
                ;
                break;
            case "0":
                if (true == confirm("是否进行绑定银行卡？")) {
                    window.location.href = "${ctx}/user/bankCard/binding";
                } else {
                    return;
                }
                ;
                break;
                /* case "1":alert("未进行风险测评!");break;
                 case "2":alert("未成为会员!");break;
                 case "3":alert("实名认证完成!");break; */
        }
    }


</script>
<%@include file="/WEB-INF/views/modules/cms/front/include/footer.jsp" %>
</body>
</html>