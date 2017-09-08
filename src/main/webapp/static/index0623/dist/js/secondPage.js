/**
 * Created by DAGONG on 2017/5/2.
 */
$(function () {
    $('.bannerUl li').on('click', function () {
        $('.bannerUl li').removeClass('active');
        $(this).addClass('active');
    });
    $(document).scroll(function () {
        var odElementHeight = $('.odiv').height();
        var oPositionTop = $('.odiv').offset().top;
        var oscrollHeight = $(document).scrollTop();
        if (oscrollHeight > oPositionTop) {
            $('.odiv ul').css({
                "position": "fixed",
                "top": 0,
                "background": "rgba(255,255,255,0.8)",
                "width": '100%',
                'z-index': '99'
            });
        }
        else {
            $('.odiv ul').css({
                "position": 'relative',
                "background": "rgba(255,255,255,0.3)",
                "width": '100%'
            })
        }
    });
});