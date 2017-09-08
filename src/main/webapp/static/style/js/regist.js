var a, b, c, d, e, f, g;
$(function () {
    // 用户名的获取焦点与失去焦点事件
    $("#username").blur(function () {
        a = eleValidator(this, $("#username_msg"), "用户名", /^[a-zA-Z0-9_]{4,16}$/);
        if (a == true) {
            $.ajax({
                url: 'getByLoginName',
                type: 'post',
                data: {"loginName": $("#username").val()},
                dataType: 'json',
                success: function (result) {
                    e = result;
                    if (e == false) {
                        $("#username_msg").text("用户名已被注册.").attr("class", "error");
                    }
                }
            });
        }
    });

    //手机
    $("#phone").blur(function () {
        a = eleValidator(this, $("#phone_msg"), "手机号码", /^1[3|5|7|8|][0-9]{9}$/);
        if (a == true) {
            $.ajax({
                url: 'getByPhone',
                type: 'post',
                data: {"phone": $("#phone").val()},
                dataType: 'json',
                success: function (result) {
                    f = result;
                    if (f == false) {
                        $("#phone_msg").text("手机号已被注册.").attr("class", "error");
                    }
                }
            });
        }
    });
    // 密码的获取焦点与失去焦点事件
    $("#password").blur(function () {
        b = eleValidator(this, $("#password_msg"), "密码", /^[a-zA-Z0-9_]{6,16}$/);
    });
    // 确认密码的获取焦点与失去焦点事件
    $("#pwdRepeat").blur(function () {
        if ($("#pwdRepeat").val() == "") {
            c = null;
        }
        if (eleValidator(this, $("#pwdRepeat_msg"), "密码", /^[a-zA-Z0-9_]{6,16}$/)) {
            // 两次密码输入是否一致的验证
            if (this.value != $("#password").val()) {
                $("#pwdRepeat_msg").text("两次密码输入不一致.").attr("class", "error");
                c = null;
            }
        }
    });

    //验证码
    $("#validateCode").blur(function () {
        $.ajax({
            url: $("#code").val(),
            type: 'post',
            data: {"validateCode": $("#validateCode").val()},
            dataType: 'json',
            success: function (result) {
                g = result;
                if (g == false) {
                    $("#validateCode_msg").text("验证码错误.").attr("class", "error");
                }
            }
        });
    });
    $("#registsubmit").click(function () {
        if ($("#agree").get(0).checked == true) {
            if (a == true && b == true && c != null && d == true && e == true && f == true && g == true) {
                $("#personRegForm").submit();
            } else {
                alert(a + " " + b + " " + c + " " + d + " " + f + " " + g + " ");
                alert("您还有选项输入错误，请更改.");
            }
        } else {
            alert("注册成为平台用户需要同意协议.");
        }

    });
});

function eleValidator(elem, msgElem, msg, regExp) {
    var value = elem.value;
    if (value == "" || value == null) {
        msgElem.text("请输入你的" + msg + ".").attr("class", "error");

        return false;
    } else if (!regExp.test(value)) {
        msgElem.text(msg + "输入有误.").attr("class", "error");

        return false;
    } else {
        msgElem.text("").attr("class", "hide");
        return true;

    }
}



