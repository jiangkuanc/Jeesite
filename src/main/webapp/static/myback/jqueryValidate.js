/**
 * 自定义jquery validate 验证
 */


//用户名验证
$.validator.addMethod("isLegal", function (value, element) {
    var str = /^[a-zA-Z0-9_]{4,16}$/;
    return this.optional(element) || (str.test(value));
}, "只能输入字母或数字或下划线");
//手机验证
$.validator.addMethod("isMobile", function (value, element) {
    var length = value.length;
    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");
//图片验证
$.validator.addMethod("isPic", function (value, element) {
    if (value == "") {
        return true;
    }
    var filepath = value;

    //获得上传文件名
    var fileArr = filepath.split("\\");
    var fileTArr = fileArr[fileArr.length - 1].toLowerCase().split(".");
    var filetype = fileTArr[fileTArr.length - 1];
    //切割出后缀文件名
    if (filetype == "jpg" || filetype == "png" || filetype == "gif") {
        return true;
    } else {
        return false;
    }
}, "请上传jpg、png、gif格式图片");
//利率验证
$.validator.addMethod("rateNumber", function (value, element) {
    if (value == "") {
        return true;
    }
    var returnVal = true;
    inputZ = value;
    var ArrMen = inputZ.split(".");
    if (ArrMen.length == 2) {
        if (ArrMen[1].length > 4) {
            returnVal = false;
            return false;
        }
    } else {
        return false
    }
    var vzNum = parseFloat(inputZ).toFixed(4);
    // alert(vzNum);
    if (isNaN(vzNum)) {
        returnVal = false;
        return false;
    }
    var ele = parseFloat('1');
    if (ele < parseFloat(vzNum)) {
        returnVal = false;
        return false;
    }
    // } for end
    return returnVal;
}, "请填写小于1，小数小于4位的数字");
//金额验证	 
$.validator.addMethod("moneyNumber", function (value, element) {
    if (value == "") {
        return true;
    }
    var returnVal = true;
    inputZ = value;
    var ArrMen = inputZ.split(".");
    if (ArrMen.length == 2) {
        if (ArrMen[1].length > 2 || ArrMen[1].length < 2) {
            returnVal = false;
            return false;
        }
    } else {
        return false
    }
    var vzNum = parseFloat(inputZ).toFixed(2);
    // alert(vzNum);
    if (isNaN(vzNum)) {
        returnVal = false;
        return false;
    }
    var ele = parseFloat('999999999.99');
    if (ele < parseFloat(vzNum)) {
        returnVal = false;
        return false;
    }
    // } for end
    return returnVal;
}, "请填写整数小于9位，小数为2位格式的金额");
