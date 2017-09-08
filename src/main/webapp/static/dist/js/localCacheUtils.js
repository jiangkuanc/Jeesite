/*******************************************************
 ********* H5 本地缓存文件(js,css,图片,等文件的读取工具类)*********
 ******************************************************/
var localCacheUtils
{

    //文件相关属性参数列表
    var params
:
    {
        fileId:"",		//文件id
            fileGroupId
    :
        ""	//文件组id
    }

    //检测浏览器是否支持File Api
    isSupportFileApi:function () {
        if (window.File && window.FileList && FileReader && window.Blob) {
            return true;
        }
        else {
            return false;
        }
    }

    //初始化方法
    init:function (params) {
        var oFile = document.getElementById('+params.fileId+');
        oFile.addEventListener("change", function (ev) {
            var event = ev || window.event;
            var files = this.files;
            for (var i = 0; len = files.length; i <= len;
            i++
            )
            {
                var reader = new FileReader();
                var file = files[i];
                reader.onload = (function () {
                    return function (e) {
                        var div = document.createElement("div");
                        div.innerHTML = this.result;
                        //preview
                    }
                })(file);
                //读取文件内容
                reader.readAsText(file, "utf-8");
            }
        }, false);
    }
}