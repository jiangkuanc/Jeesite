$.extend({
    selectdic: function (value, type, defaultValue) {
        var zhi = '';
        var a = $.ajax({
            url: 'selectDict',
            async: false,
            type: 'post',
            dataType: 'json',
            data: {value: value, type: type, defaultValue: defaultValue},
            success: function (d) {
                zhi = d.responseText;
            },
            error: function (e) {
                zhi = e.responseText;
                return zhi;
            }
        });
        return zhi;
    }
});


