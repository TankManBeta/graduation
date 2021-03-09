$("#captcha").click(function() {
    var data = {
        "email": $("#email").val(),
    };
    $.ajax({
        type: "POST",
        url: "/captcha",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(data),
        success(data) {
            result = "<div class='alert alert-warning alert-dismissible fade show' role='alert'> <strong>" + data +
                "</strong><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button></div>";
            $("#captcha_result").html(result);
        }
    })
});