/**
 * Created by DAGONG on 2017/6/20.
 */
$(function () {
    /*
     **顶部吸顶
     */
    $(window).scroll(function () {
        var tops = $(document).scrollTop();
        if (tops > 100) {
            $(".navbars").addClass("navbar-fixed-top");
        } else {
            $(".navbars").removeClass("navbar-fixed-top");
        }
    });

    /*
     **视频播放
     */
    $("#adv").one("click", function () {
        var innerHtml = "<video controls id='mmedia'>"
            + "<source src='static/index0623/video/oceans-clip.mp4'></source>"
            + "</video><img src='static/index0623/dist/img/video.png' id='adv2' width='285px' >";
        $("#videos").html(innerHtml);

        var mmedia = document.getElementById("mmedia");
        mmedia.play();
        var adv = document.getElementById("adv2");
        //视频播放暂停切换
        mmedia.addEventListener('pause', function () {
            adv.style.display = 'block';
        });
        mmedia.addEventListener('play', function () {
            adv.style.display = 'none';
        });
        $("#adv2").on("click", function () {
            // 点击图片全屏显示视频
            if (mmedia.requestFullScreen) {
                mmedia.requestFullScreen();//点击图片视频显示全屏状态
            } else if (mmedia.mozRequestFullScreen) {
                mmedia.mozRequestFullScreen();
            } else if (mmedia.webkitRequestFullScreen) {
                mmedia.webkitRequestFullScreen();
            }
            // 切换视频暂停和播放模式
            if (mmedia.paused) {//如果暂停就播放
                mmedia.play();
                this.value = '暂停';
            } else {//否则 暂停
                mmedia.pause();
                this.value = '播放';
            }
        });
        $("#adv").fadeOut(1000);
    });

    /*
     * 
     * 公告无缝轮播，需要等到页面dom结构加载完毕后才能调用的方法
     * */
    window.onload = function () {
        $('.anTitle').liMarquee({
            direction: 'up',
            scrollamount: 20
        });
    };

    /*
     * 我的账户鼠标移入事件
     */
    $(".dropdown").mouseover(function () {
        $(".btn-group").addClass("open");
    }).mouseleave(function () {
        $(".btn-group").removeClass("open");
    })
});
