$("#patent_submit").click(function () {
   let data = {
       "patent_state": $("#patent_state").val(),
   };
   $.ajax({
       type:"POST",
       url: window.location.pathname,
       contentType: "application/json;charset=UTF-8",
       data:JSON.stringify(data),
       success(msg){
           if (msg === "yes"){
               $("#result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>修改成功!</strong>' +
                   '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
           }else if (msg === "no"){
               $("#result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>修改失败!</strong> 请重新检查要修改的信息' +
                   '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
           }
       }
   })
});

$("#paper_submit").click(function () {
    let data = {
        "paper_state": $("#paper_state").val(),
        "paper_quote": $("#paper_quote").val(),
        "paper_influence": $("#paper_influence").val(),
        "paper_search_type":$("#paper_search_type").val(),
        "paper_press": $("#paper_press").val(),
        "paper_doi": $("#paper_doi").val()
    };
    $.ajax({
        type: "POST",
        url: window.location.pathname,
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify(data),
        success(msg) {
            if (msg === "yes"){
                $("#result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>修改成功!</strong>' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }else if (msg === "no"){
                $("#result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>修改失败!</strong> 请重新检查所填信息' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});

$("#project_submit").click(function () {
    let data = {
        "project_state": $("#project_state").val(),
        "project_principal_title": $("#project_principal_title").val()
    };
    $.ajax({
        type: "POST",
        url: window.location.pathname,
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify(data),
        success(msg) {
            if (msg === "yes"){
                $("#result_hint").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>修改成功!</strong>' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }else if (msg === "no"){
                $("#result_hint").html('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>修改失败!</strong> 请重新检查所填信息' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});