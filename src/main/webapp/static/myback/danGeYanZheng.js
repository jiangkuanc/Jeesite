function bindOnInput(num) {
    for (var i = 1; i <= num; i++) {
        $("#rejectReason" + i).bind('input oninput', function () {
            var textarea = "";
            for (var j = 1; j <= num; j++) {
                textarea += $("#rejectReason" + j).val();
            }
            $("textarea[name='auditResult']").val(textarea);
        });
    }
}
function radioChange() {
    $("input[type='radio']").change(function () {
        var obj = $(this).parent().next().children("textarea:first-child");

        if (this.value == 1) {
            obj.val("");
            obj.attr("disabled", "disabled");
        }
        if (this.value == 0) {
            obj.removeAttr("disabled");
            obj.attr("required", "required");
        }
    });
}
	
