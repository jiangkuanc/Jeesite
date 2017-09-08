var a, b, c, d;
$(function () {
    // 用户名的获取焦点与失去焦点事件
    $("#username").blur(function () {
        a = eleValidator(this, $("#username_msg"), "用户名", /^[a-zA-Z0-9]{6,12}$/);
    });

    //手机
    $("#phone").blur(function () {
        a = eleValidator(this, $("#phone_msg"), "手机号码", /^1[3|5|7|8|][0-9]{9}$/);
    });
    // 密码的获取焦点与失去焦点事件
    $("#password").blur(function () {
        b = eleValidator(this, $("#password_msg"), "密码", /^[0-9]{6,8}$/);
    });
    // 确认密码的获取焦点与失去焦点事件
    $("#pwdRepeat").blur(function () {
        if ($("#pwdRepeat").val() == "") {
            c = null;
        }
        if (eleValidator(this, $("#pwdRepeat_msg"), "密码", /^[0-9]{6,8}$/)) {
            // 两次密码输入是否一致的验证
            if (this.value != $("#password").val()) {
                $("#pwdRepeat_msg").text("两次密码输入不一致.").attr("class", "error");
                c = null;
            }
        }
    });

    $("#personRegForm").submit(function () {
        if (a == false || b == false || c === null || d == false) {
            event.preventDefault();
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



