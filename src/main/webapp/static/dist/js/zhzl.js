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
var $bjwyd = $("#bjwyd")
//全选
$xxzx_qx.click(function () {
    checkedAll($inpch, $(this));
})
/*单选*/
$inpch.click(function () {
    FnNum($(this));
    checked($inpch, $xxzx_qx);
    checked($inpch, $xxzx_qx1);
})
$("#xxzx_qx1").click(function () {
    checkedAll($inpch, $(this));
})
/*删除所选*/
$scsx.click(function () {
    var temp = 0;
    $inpch.each(function (i, elem) {
        if ($(elem).get(0).checked) {
            temp = 1;
        }
    });
    if (temp == 0) {
        alert("请勾选要删除的消息！");
    } else {
        swal({
            title: "确定删除吗？",
            showCancelButton: true,
            type: "info",
        }, function (inputValue) {
            if (inputValue === false) {
                return false;
            }
            del();
        });
    }
});

function del() {
    $inpch.each(function (i, elem) {
        if ($(elem).get(0).checked) {
            var id = $(elem).prev("input").val();
            $.ajax({
                type: "post",
                url: "deleteMsg?id=" + id,//加载数据
                dataType: "text",
                success: function (data) {
                    $(elem).parents("tr").remove();
                    window.location.reload();
                }
            });
        }
    });
};
/**
 * 标记为已读
 */
$bjwyd.click(function () {
    var tem = 0;
    $inpch.each(function (i, elem) {
        if ($(elem).get(0).checked) {
            tem = 1;
            var id = $(elem).prev("input").val();
            $.ajax({
                type: "post",
                url: "markRead?id=" + id,//加载数据
                dataType: "text",
                success: function (data) {
                    window.location.reload();
                }
            });
        }
    });
    if (tem == 0) {
        alert("请勾选要标记的消息！");
    }
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

