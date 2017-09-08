/**
 * Created by DAGONG on 2016/6/16.
 */
$(function () {
    var num = $(".newsdiv ul li").length;
    var width = num * 240;
    $(".newsdiv ul").css("width", width)
    var timer;
    var left = 0;
    timer = setInterval(function () {
        left--;
        $(".newsdiv ul").css("left", left)
    }, 80);

    $(".newsdiv ul").mouseover(function () {
        clearInterval(timer);
        timer = null;
    })
    $(".newsdiv ul").mouseout(function () {
        timer = setInterval(function () {
            left--;
            $(".newsdiv ul").css("left", left)
        }, 80);
    })
})