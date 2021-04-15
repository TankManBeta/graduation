$("#select-all").click(function () {
    let is_checked = $("#select-all").prop('checked');
    if (is_checked){
        $("#users_table").find("input[type='checkbox']").each(function () {
            this.checked = true;
        });
    }else {
        $("#users_table").find("input[type='checkbox']").each(function () {
            if(this.checked===true){
                this.checked = false;
            }
        });
    }
});

$('#exampleModalCenter').on('hidden.bs.modal', function (){
    $("input[type='password']").val('');
});

$("#submit_reset_password").click(function () {
    let new_password = $("#password_reset").val();
    let confirm_new_password = $("#password_reset_confirm").val();
    if (new_password !== confirm_new_password || new_password.length===0){
        $("#result").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>密码为空或两次密码不一致！' +
            '</strong>' + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
    }else {
        let reset_list = [];
        $("#users_table").find("input[type='checkbox']:checked").each(function (index, elem) {
            reset_list.push($(elem).attr("id"));
        });
        console.log(reset_list.length);
        if (reset_list.length===0){
            $("#result").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>未选择需要重置密码的用户！' +
            '</strong>' + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
        }else {
            let data = {
                "users_list": reset_list,
                "new_password": new_password
            };
            $.ajax({
                type: "POST",
                url: window.location.pathname,
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify(data),
                success() {
                   $("#result").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>密码重置成功！' +
                '</strong>' + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
                }
            })
        }
    }
});