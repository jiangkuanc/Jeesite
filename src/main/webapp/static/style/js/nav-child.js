/**
 * Created by DAGONG on 2016/6/16.
 */
$(function () {
    $(".nav li").mouseover(function () {
        $(this).addClass('current').siblings().removeClass('current');
        $(this).children("ul").show();
        $(this).siblings().children("ul").hide();
    });
    $(".nav li").mouseout(function () {
        $(".nav li").removeClass('current');
        $(this).children("ul").hide();
        $(this).siblings().children("ul").hide();
    });
});