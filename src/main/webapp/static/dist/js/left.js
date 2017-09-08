/**
 * Created by DAGONG on 2016/7/18.linyuan
 */
$(function () {
    //    $(".con-left ul li a").click(function(){
//        var e = window.event || arguments[0];
//        var target = e.srcElement || e.target;//获取触发事件的元素
//        var num = $(target).parent().attr("data-i")-0;
//        $(".con-left ul li a").removeClass("gy-active");
//        $(target).addClass("gy-active");
//        if(num==0){
//            $("#dsz").show().siblings().hide();
//            $(".con-left").show();
//        }
//        if(num==1){
//            $("#jtgk").show().siblings().hide();
//            $(".con-left").show();
//        }
//        if(num==2){
//            $("#xwzt").show().siblings().hide();
//            $(".con-left").show();
//        }
//        if(num==3){
//            $("#spdb").show().siblings().hide();
//            $(".con-left").show();
//        }
//
//    })

    $(".zhzllevel1 p").click(function () {
        $(this).siblings().toggle();
        $(this).parent().toggleClass("youjian").toggleClass("xiajian");
    })


    //    倒计时
    var SysSecond1;
    var InterValObj1;
    var time1;

    $(document).ready(function () {
        if ($('#weihuan').html() != null) {
            $('#weihuan').each(function () {
                time1 = $(this).parent().children('.time1')[0].innerHTML;
            });
            var arr11 = time1.split("-");
            time1 = new Date(arr11[0], arr11[1] - 1, arr11[2]);
            var time2 = new Date();
            var time3 = (time1.getTime() - time2.getTime()) / 1000;
            SysSecond1 = parseInt(time3); //这里获取倒计时的起始时间
            InterValObj1 = window.setInterval(SetRemainTime1, 1000); //间隔函数，1秒执行
        }
    });

    //将时间减去1秒，计算天、时、分、秒
    function SetRemainTime1() {
        if (SysSecond1 > 0) {
            SysSecond1 = SysSecond1 - 1;
            var second = Math.floor(SysSecond1 % 60);             // 计算秒
            var minite = Math.floor((SysSecond1 / 60) % 60);      //计算分
            var hour = Math.floor((SysSecond1 / 3600) % 24);      //计算小时
            var day = Math.floor((SysSecond1 / 3600) / 24);        //计算天

            $(".remainTime1").html(day + "天" + hour + "小时" + minite + "分" + second + "秒");
        } else {//剩余时间小于或等于0的时候，就停止间隔函数
            window.clearInterval(InterValObj1);
            //这里可以添加倒计时时间为0后需要执行的事件
        }
    }
})



