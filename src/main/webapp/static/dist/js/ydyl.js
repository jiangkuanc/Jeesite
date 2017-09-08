/**
 * Created by DAGONG on 2016/8/4.
 */
//模拟下拉选框
(function () {
    $(".dropmiandiv").on("click", function () {
        $(".dropmiandiv").removeClass("boderCol");
        $(".chooseItems").removeClass("show boderCol");
        $(this).addClass("boderCol");
        $(this).next().toggleClass("show boderCol");
        return false;
    });
    $(".chooseItem").on("click", function () {
        var dropdivHtml = $(this).parent().prev().find(".dropdiv").html();
        var chooseItemHtml = $(this).html();
        //console.log(dropdivHtml,chooseItemHtml)
        if (dropdivHtml !== chooseItemHtml) {
            $(this).parent().prev().find(".dropdiv").html(chooseItemHtml)
        }
        $(".chooseItems").removeClass("show boderCol");
        return false;
    });
    $(document).on("click", function () {
        $(".chooseItems").removeClass("show boderCol");
        $(".dropmiandiv").removeClass("boderCol");
    })
})();
//国外政府选项卡
(function () {
    $(".region_country_lis").each(function (i, item) {
        if (i == 2) {
            $(".region_country_lis").eq(i).show();
        }
    })
    $("#region_list li").on("click", function () {
        $(this).addClass("ydyl-active").siblings().removeClass("ydyl-active");
        $(".region_country_lis").hide();
        $(".region_country_lis").eq($(this).index()).show();
    })
})();
//供给信息幻灯片
(function () {
    var $list = $(".productIfon_box_list");
    $(".next").on("click", function () {
        $list.css({"margin-left": "0"});
        $list.animate({marginLeft: "-100%"}, 3000, "linear", function () {
            $list.css({"margin-left": "0"});
        })
    })
    $(".prev").on("click", function () {
        $list.css({"margin-left": "-100%"});
        $list.animate({marginLeft: "0"}, 3000, "linear", function () {
            $list.css({"margin-left": "-100%"});
        })
    })
})();
