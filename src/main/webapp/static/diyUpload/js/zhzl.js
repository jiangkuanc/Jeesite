/**
 * Created by DAGONG on 2016/11/16.
 */
var num = 0;

function checkedAll(obj, objAll) {
    if (objAll.get(0).checked) {
        num = obj.length;
        obj.each(function (i, elem) {
            $(elem).get(0).checked = true;
        });
    } else {
        num = 0;
        obj.each(function (i, elem) {
            $(elem).get(0).checked = false;
        });
    }
}
function FnNum(obj) {
    if (obj.get(0).checked) {
        num++;
    } else {
        num--;
    }
}
function checked(obj, objAll) {
    if (num == obj.length) {
        objAll.get(0).checked = true;
    } else {
        objAll.get(0).checked = false;
    }
}
var $xxzx_qx = $("#xxzx_qx");
var $xxzx_qx1 = $("#xxzx_qx1");
var $inpch = $(".inpch");
var $scsx = $("#scsx");
//全选
$xxzx_qx.click(function () {
    checkedAll($inpch, $(this));
});
/*单选*/
$inpch.click(function () {
    FnNum($(this));
    checked($inpch, $xxzx_qx);
    checked($inpch, $xxzx_qx1);
});
$("#xxzx_qx1").click(function () {
    checkedAll($inpch, $(this));
});
/*删除所选*/
$scsx.click(function () {
    $inpch.each(function (i, elem) {
        if ($(elem).get(0).checked) {
            $(elem).parents("tr").remove();
        }
    })
});

/*下拉选显示*/
$(function () {
    $(".dropdown-menu").on("click", "li a", function () {
        var e = window.event || arguments[0];
        var target = e.srcElement || e.target;
        var text = $(target).text();
        var $span = $(target).parents("ul").prev().find(".placeholder");
        $span.text(text);
    });
});

