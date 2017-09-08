/*Time:2016-8-2 17:29:36 Author：ZMW*/
$(function () {
    /*滑动门*/
    $(".tabs ul li").click(function () {
        $(this).addClass('current currents').siblings().removeClass('current currents');
        $(this).find("span").addClass("border-top").parent().siblings().find("span").removeClass('border-top');
        var index = $(".tabs ul li").index(this);
        $('.tabs div .one').eq(index).show().addClass('current2').siblings().hide().removeClass('current2');
    });

    /*问号*/
    $('.onlyone .span12').click(function () {
        $(this).next().toggle();
    })
});