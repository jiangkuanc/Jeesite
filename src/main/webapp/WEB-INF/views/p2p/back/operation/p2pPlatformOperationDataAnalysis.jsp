<%@page import="com.alibaba.fastjson.JSON" %>
<%@page import="com.thinkgem.jeesite.common.mapper.JsonMapper" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>运营数据分析</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic}/bootstrap/2.3.1/css/homepage.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<form:form id="searchForm" modelAttribute="p2pPlatformOperationDataStatistics"
           action="${ctx}/operation/p2pPlatformOperationDataStatistics/dataAnalysis" method="post" class="form-search">
    <div style="margin-top:8px;">
        <label>日期：&nbsp;</label>
        <input id="beginTime" name="beginTime" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
               value="<fmt:formatDate value="${p2pPlatformOperationDataStatistics.beginTime}" pattern="yyyy-MM-dd"/>"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
        <label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input id="endTime" name="endTime" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
               value="<fmt:formatDate value="${endTime}" pattern="yyyy-MM-dd"/>"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
            <%-- <form:select path="classifiedQuery" class="input-medium-select">
                        <form:option value="day">按日统计</form:option>
                        <form:option value="month">按月统计</form:option>
                        <form:option value="quarter">按季统计</form:option>
                        <form:option value="year">按年统计</form:option>
            </form:select> --%>
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
        <input class="btn btn-primary" type="reset" onclick="resetForm()" value="重置"/>&nbsp;&nbsp;
    </div>
</form:form>

<div style="margin:0px 20px;">
    <div class="row">
        <div class="col-md-6">
            <div id="no1" style="height: 300px;width:100%;margin-top:20px;"></div>
        </div>
        <div class="col-md-6">
            <div id="no2" style="height: 300px;width:100%;margin-top:20px;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div id="no3" style="height: 300px;width:100%;margin-top:20px;"></div>
        </div>
        <div class="col-md-6">
            <div id="no4" style="height: 300px; width:100%;margin-top:20px;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div id="no5" style="height: 300px;width:100%;margin-top:20px;"></div>
        </div>
        <div class="col-md-6">
            <div id="no6" style="height: 300px;width:100%;margin-top:20px;"></div>
        </div>
    </div>

</div>
<%--	<div id="no11" >--%>
<%--	<div id="no1" style="height: 300px; min-width:700px; width:50%; float:left;margin-top:20px;"></div>--%>
<%--	<div id="no2" style="height: 300px; min-width:700px; width:50%; float:left;margin-top:20px;"></div>--%>
<%--	</div>--%>
<%--	<div id="no22">--%>
<%--	<div id="no3" style="height: 300px; min-width:700px; width:50%; float:left;margin-top:20px;"></div>--%>
<%--	<div id="no4" style="height: 300px; min-width:700px; width:50%; float:left;margin-top:20px;"></div>--%>
<%--	</div>--%>
<%--	<div id="no33">--%>
<%--	<div id="no5" style="height: 300px; min-width:700px; width:50%; float:left;margin-top:20px;"></div>--%>
<%--	<div id="no6" style="height: 300px; min-width:700px; width:50%; float:left;margin-top:20px;"></div>--%>
<%--	</div>--%>
<script>
    var arrayRate = new Array();
    arrayRate.push("0%");
    arrayRate.push("20%");
    arrayRate.push("40%");
    arrayRate.push("60%");
    arrayRate.push("80%");
    arrayRate.push("100%");
    var array = new Array();
    var array1 = new Array();
    var array2 = new Array();
    var array3 = new Array();
    var array4 = new Array();
    var array5 = new Array();
    var array6 = new Array();
    var array7 = new Array();
    var array8 = new Array();
    var array9 = new Array();
    var array10 = new Array();
    var array11 = new Array();
    var array12 = new Array();
    var array13 = new Array();
    var array14 = new Array();
    <c:forEach items="${echarts}" var="a" varStatus="status">
    //时间
    if (${status.index}=='14'
    )
    {
        <c:forEach items="${a}" var="b">
        array.push('${b}');
        </c:forEach>
    }
    //交易总额
    if (${status.index}=='0'
    )
    {
        <c:forEach items="${a}" var="c">
        array1.push('${c}');
        </c:forEach>
    }
    //待偿金额
    if (${status.index}=='1'
    )
    {
        <c:forEach items="${a}" var="d">
        array2.push('${d}');
        </c:forEach>
    }
    //逾期金额
    if (${status.index}=='2'
    )
    {
        <c:forEach items="${a}" var="e">
        array3.push('${e}');
        </c:forEach>
    }
    //交易总笔数
    if (${status.index}=='3'
    )
    {
        <c:forEach items="${a}" var="f">
        array4.push('${f}');
        </c:forEach>
    }
    //逾期项目数
    if (${status.index}=='4'
    )
    {
        <c:forEach items="${a}" var="g">
        array5.push('${g}');
        </c:forEach>
    }
    //融资人总数
    if (${status.index}=='5'
    )
    {
        <c:forEach items="${a}" var="h">
        array6.push('${h}');
        </c:forEach>
    }
    //投资人总数
    if (${status.index}=='6'
    )
    {
        <c:forEach items="${a}" var="i">
        array7.push('${i}');
        </c:forEach>
    }
    //项目逾期率
    if (${status.index}=='7'
    )
    {
        <c:forEach items="${a}" var="j">
        array8.push('${j}');
        </c:forEach>
    }
    //金额逾期率
    if (${status.index}=='8'
    )
    {
        <c:forEach items="${a}" var="k">
        array9.push('${k}');
        </c:forEach>
        console.log(array8);
    }
    //最大单户融资余额占比
    if (${status.index}=='9'
    )
    {
        <c:forEach items="${a}" var="l">
        array10.push('${l}')
        </c:forEach>
        console.log(array9);

    }
    //最大十户融资余额占比
    if (${status.index}=='10'
    )
    {
        <c:forEach items="${a}" var="m">
        array11.push('${m}');
        </c:forEach>

    }
    //人均累计融资余额
    if (${status.index}=='11'
    )
    {
        <c:forEach items="${a}" var="n">
        array12.push('${n}');
        </c:forEach>
    }
    //人均累计投资金额
    if (${status.index}=='12'
    )
    {
        <c:forEach items="${a}" var="o">
        array13.push('${o}');
        </c:forEach>
    }
    //笔均融资金额
    if (${status.index}=='13'
    )
    {
        <c:forEach items="${a}" var="p">
        array14.push('${p}');
        </c:forEach>
    }
    </c:forEach>
    var myChart1 = echarts.init(document.getElementById("no1"));
    /* if(!yes){
     myChart1.showLoading({
     text : '暂无数据',
     effect : 'bubble',
     effectOption: {
     effect: {
     n: 0
     }
     }
     });
     } */
    var option1 = {
        title: {
            text: '交易总额、待偿金额、逾期金额趋势图'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            x: '220px',
            y: '30px',
            data: [
                '交易总额', '待偿金额', '逾期金额'
            ]
        },

        // grid: {y: 70, y2:30, x2:20},
        xAxis: [
            {
                type: 'category',
                data: array
                //先按每日的显示吧
            },
            {
                type: 'category',
                axisLine: {show: false},
                axisTick: {show: false},
                axisLabel: {show: false},
                splitArea: {show: false},
                splitLine: {show: false},
                data: array
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLabel: {formatter: '{value}元'}
            }
        ],
        series: [
            {
                name: '交易总额',
                type: 'bar',
                //itemStyle: {normal: {color:'rgba(193,35,43,1)', label:{show:true}}},
                data: array1
            },
            {
                name: '待偿金额',
                type: 'bar',
                //itemStyle: {normal: {color:'rgba(181,195,52,1)', label:{show:true,textStyle:{color:'#27727B'}}}},
                data: array2
            },
            {
                name: '逾期金额',
                type: 'bar',
                // itemStyle: {normal: {color:'rgba(252,206,16,1)', label:{show:true,textStyle:{color:'#E87C25'}}}},
                data: array3
            }
        ]
    };


    myChart1.setOption(option1);

    var myChart2 = echarts.init(document.getElementById("no2"));
    var option2 = {
        title: {
            text: '交易总笔数、逾期项目数趋势图'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            x: '220px',
            y: '30px',
            data: ['交易总笔数', '逾期项目数']
        },

        xAxis: [
            {
                type: 'category',
                data: array
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLabel: {formatter: '{value}个'}
            }
        ],
        series: [
            {
                name: '交易总笔数',
                type: 'bar',
                data: array4
            },
            {
                name: '逾期项目数',
                type: 'bar',
                data: array5
            }
        ]
    };
    myChart2.setOption(option2);

    var myChart3 = echarts.init(document.getElementById("no3"));
    var option3 = {
        title: {
            text: '融资人总数、投资人总数趋势图'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            x: '220px',
            y: '30px',
            data: ['融资人总数', '投资人总数']
        },

        xAxis: [
            {
                type: 'category',
                data: array
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLabel: {formatter: '{value}人'}
            }
        ],
        series: [
            {
                name: '融资人总数',
                type: 'bar',
                data: array6,

            },
            {
                name: '投资人总数',
                type: 'bar',
                data: array7,

            }
        ]
    };
    myChart3.setOption(option3);

    var myChart4 = echarts.init(document.getElementById("no4"));
    var option4 = {
        title: {
            text: '项目逾期率、金额逾期率'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                var dataset = "";
                var datasetname = "";
                var hhd = "";
                $.each(params, function (i, n) {
                    datasetname = "<span>" + params[i].name + "</span><br/>"
                    dataset += ("<span >" + params[i].seriesName + ":" + formatCurrency(params[i].data * 100) + "%" + "</span><br/>");
                    hhd = datasetname + dataset;
                });
                return hhd;
            }
        },
        legend: {
            x: '220px',
            y: '30px',
            data: ['项目逾期率', '金额逾期率']
        },

        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: array
            }
        ],
        yAxis: [
            {
                type: 'value',
                min: 0,
                max: 1,
                minInterval: 0.1,
                axisLabel: {
                    formatter: function (value) {
                        return formatCurrency(value * 100) + "%";
                    }
                }
            }
        ],
        series: [
            {
                name: '项目逾期率',
                type: 'line',
                data: array8
            },
            {
                name: '金额逾期率',
                type: 'line',
                data: array9
            }
        ]
    };
    myChart4.setOption(option4);


    var myChart5 = echarts.init(document.getElementById("no5"));
    var option5 = {
        title: {
            text: '最大单户融资余额占比、最大十户融资余额占比'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                var dataset = "";
                var datasetname = "";
                var hhd = "";
                $.each(params, function (i, n) {
                    datasetname = "<span>" + params[i].name + "</span><br/>"
                    dataset += ("<span >" + params[i].seriesName + ":" + formatCurrency(params[i].data * 100) + "%" + "</span><br/>");
                    hhd = datasetname + dataset;
                });
                return hhd;
            }
        },
        legend: {
            x: '220px',
            y: '30px',
            data: ['最大单户融资余额占比', '最大十户融资余额占比']
        },

        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: array
            }
        ],
        yAxis: [
            {
                type: 'value',
                min: 0,
                max: 1,
                minInterval: 0.1,
                axisLabel: {
                    formatter: function (value) {
                        return formatCurrency(value * 100) + "%";
                    }
                }
            }
        ],
        series: [
            {
                name: '最大单户融资余额占比',
                type: 'line',
                data: array10,

            },
            {
                name: '最大十户融资余额占比',
                type: 'line',
                data: array11,

            }
        ]
    };
    myChart5.setOption(option5);

    var myChart6 = echarts.init(document.getElementById("no6"));
    var option6 = {
        title: {
            text: '人均累计融资金额、人均累计投资金额、笔均融资金额趋势图'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            x: '220px',
            y: '30px',
            data: ['人均累计融资金额', '人均累计投资金额', '笔均融资金额']
        },

        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: array
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLabel: {formatter: '{value}元'}
            }
        ],
        series: [
            {
                name: '人均累计融资金额',
                type: 'line',
                smooth: true,
                itemStyle: {normal: {areaStyle: {type: 'default'}}},
                data: array12
            },
            {
                name: '人均累计投资金额',
                type: 'line',
                smooth: true,
                itemStyle: {normal: {areaStyle: {type: 'default'}}},
                data: array13
            },
            {
                name: '笔均融资金额',
                type: 'line',
                smooth: true,
                itemStyle: {normal: {areaStyle: {type: 'default'}}},
                data: array14
            }
        ]
    };
    myChart6.setOption(option6);
</script>

</body>

</html>