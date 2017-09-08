/*** 材料单个驳回****/
function bindOnInput(num) {
    for (var i = 1; i <= num; i++) {
        $("#rejectReason" + i).bind('input oninput', function () {
            var textarea = "";
            for (var j = 1; j <= num; j++) {
                if (typeof($("#rejectReason" + j).val()) != "undefined") {
                    textarea += $("#rejectReason" + j).val();
                }
            }
            $("textarea[name='auditResult']").val(textarea);
            $("textarea[name='auditReason']").val(textarea);
        });
    }
}
/*身份认证页面专属*/
function radioChange() {
    $("input[type='radio']").change(function () {
        var obj = $(this).parent().next().children("textarea:first-child");

        if (this.value == 1) {
            obj.val("");
            obj.attr("disabled", "disabled");
            obj.oninput();
        }
        if (this.value == 0) {
            obj.removeAttr("disabled");
            obj.attr("required", "required");
        }
    });
}
/*材料审核页面专属*/
function radioChange1() {
    $("input[type='radio']").change(function () {
        var obj = $(this).parent().next().children("textarea:first-child");

        if (this.value == 1) {
            obj.val("");
            obj.attr("disabled", "disabled");
        }
        if (this.value == 0) {
            obj.removeAttr("disabled");
            obj.attr("required", "required");
        }
    });
}
/*** 模态框预览图片****/
function modelView(data) {
    var img = "<img width='600px'  src='" + data + "'/>";
    $('#myModal .modal-body').empty().append(img);
    $('#myModal').modal();
}
/*** 模态框预览多个图片，用“,”分隔****/
function modelViews(data) {
    var datas = data.split(",");
    $('#myModal .modal-body').empty();
    for (var i = 0; i < datas.length; i++) {
        var img = "<img width='600px'  src='" + datas[i] + "'/>";
        $('#myModal .modal-body').append(img);
    }
    $('#myModal').modal();
}

/*** 日期格式化****/
Date.prototype.format = function (format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
};

/**
 * 将数值四舍五入(保留2位小数)后格式化成金额形式
 *
 * @param num 数值(Number或者String)
 * @return 金额格式的字符串,如'1,234,567.45'
 * @type String
 */
function formatCurrency(num) {
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.50000000001);
    cents = num % 100;
    num = Math.floor(num / 100).toString();
    if (cents < 10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' +
            num.substring(num.length - (4 * i + 3));
    return (((sign) ? '' : '-') + num + '.' + cents);
}

/*** JS获取字典值并显示***/
function getJsDictValue(dict, data) {
    for (j in dict) {
        if (dict[j].value == data) {
            return dict[j].label;
        }
    }
}
function getJsDictValue(i, dict, data) {
    for (j in dict) {
        if (dict[j].value == data) {
            $("#" + i).html(dict[j].label);
        }
    }
}

//利率查询小数处理
function changeRate(name) {
    var rate = $("input[name='" + name + "']").val();
    if (rate.indexOf(".") >= 0) {
        rate = rate * 100;
    }
    if (rate != null && rate != "") {
        rate = Math.round(parseFloat(rate) * 100) / 100;
    }
    $("input[name='" + name + "']").val(rate);
}

/*** form查询表单重置 ****/
function resetForm(btnId) {
    $("form input").each(function (index, element) {
        if ($(this).attr("type") == "text") {
            $(this).attr("value", "");
        }
    });
    $("form span.select2-chosen").each(function (index, element) {
        $(this).html("");
    });
    $("form select option").each(function (index, element) {
        $(this).attr("selected", false);
    });
    if (btnId) {
        btnId.click();
    } else {
        $("#searchForm").submit();
    }
}

/**利率查询**/
function checksubmit() {
    var reg = /^-?(100|(([1-9]\d|\d)(\.\d{1,2})?))$/;
    var rate = $("input[name='p2pFinancingRatingInfo.recommendedRate']").val();
    if (rate != null && rate != "") {
        if (reg.test($("input[name='p2pFinancingRatingInfo.recommendedRate']").val())) {
            return true;
        } else {
            swal("利率只能输入0-100的数字，可带有两位小数", "", "error");
            return false;
        }
    }
}
/**后退或通过浏览器按钮返回时刷新**/
function refresh() {
    var e = document.getElementById("refreshed");
    if (e.value == "no") {
        e.value = "yes";
    } else {
        e.value = "no";
        location.reload();
    }
}
/**后退或通过浏览器按钮返回时再后退一级**/
function goback() {
    var e = document.getElementById("refreshed");
    if (e.value == "no") {
        e.value = "yes";
    } else {
        e.value = "no";
        window.history.go(-1);
    }
}