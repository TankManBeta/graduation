$("#new_patent_submit").click(function () {
    let data = {
        "patent_id": $("#patent_id").val(),
        "patent_name": $("#patent_name").val(),
        "patent_type": $("#patent_type").val(),
        "patent_time": $("#patent_time").val(),
        "patent_owner": $("#patent_owner").val(),
        "patent_state": $("#patent_state").val(),
        "inventor_rank": $("#inventor_rank").val()
    };
    $.ajax({
        type: "POST",
        url: window.location.pathname,
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(data),
        success(msg){
            if(msg === "yes"){
                 $("#new_result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>添加成功!</strong>' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }else {
                 $("#new_result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>添加失败!</strong>' + msg +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});

$("#new_paper_submit").click(function () {
    let data = {
        "paper_id": $("#paper_id").val(),
        "paper_name": $("#paper_name").val(),
        "paper_source": $("#paper_source").val(),
        "paper_region": $("#paper_region").val(),
        "paper_time": $("#paper_time").val(),
        "paper_state": $("#paper_state").val(),
        "paper_keywords": $("#paper_keywords").val(),
        "paper_quote": $("#paper_quote").val(),
        "paper_influence": $("#paper_influence").val(),
        "paper_search_type": $("#paper_search_type").val(),
        "paper_press": $("#paper_press").val(),
        "paper_doi": $("#paper_doi").val(),
        "author_rank": $("#author_rank").val()
    };
    console.log(data);
    $.ajax({
        type: "POST",
        url: window.location.pathname,
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(data),
        success(msg){
            if(msg === "yes"){
                 $("#new_result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>添加成功!</strong>' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }else {
                 $("#new_result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>添加失败!</strong>' + msg +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});

$("#new_project_submit").click(function () {
    let data = {
        "project_id": $("#project_id").val(),
        "project_name": $("#project_name").val(),
        "project_source": $("#project_source").val(),
        "project_type": $("#project_type").val(),
        "project_state": $("#project_state").val(),
        "project_time": $("#project_time").val(),
        "project_principal": $("#project_principal").val(),
        "project_principal_title": $("#project_principal_title").val(),
        "participator_rank": $("#participator_rank").val()
    };
    $.ajax({
        type: "POST",
        url: window.location.pathname,
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(data),
        success(msg){
            if(msg === "yes"){
                 $("#new_result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>添加成功!</strong>' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }else {
                 $("#new_result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>添加失败!</strong>' + msg +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});

$("#new_password_submit").click(function () {
    let data = {
        "old_password": $("#old_password").val(),
        "new_password": $("#new_password").val(),
        "confirm_password": $("#confirm_password").val()
    };
    $.ajax({
        type: "POST",
        url: window.location.pathname,
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(data),
        success(msg) {
            if (msg === "yes"){
                $("#new_result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>密码修改成功!</strong>' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }else {
                $("#new_result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>密码修改失败!</strong>' + msg +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});

$("#new_info_submit").click(function () {
    let data = {
        "user_title": $("#user_title").val(),
        "province1": $("#province1").val(),
        "city1": $("#city1").val(),
        "district1": $("#district1").val(),
        "address1": $("#address1").val(),
        "province2": $("#province2").val(),
        "city2": $("#city2").val(),
        "district2": $("#district2").val(),
        "address2": $("#address2").val(),
    };
    $.ajax({
        type: "POST",
        url: window.location.pathname,
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(data),
        success(msg) {
            if (msg === "yes"){
                $("#new_result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>个人信息修改成功!</strong>' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }else {
                $("#new_result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>个人信息修改失败!</strong>' + msg +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});