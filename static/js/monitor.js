$("#info_type").change(function() {
    let info_type_val = $("#info_type").val();
    if (info_type_val === "专利"){
        $("#info_state").empty().append('<option value="全部">全部</option>').append('<option value="已申请">已申请</option>')
            .append('<option value="已受理">已受理</option>').append('<option value="已审核">已审核</option>')
            .append('<option value="已授权">已授权</option>').append('<option value="已公开">已公开</option>');
    }
    if (info_type_val === "论文"){
        $("#info_state").empty().append('<option value="全部">全部</option>').append('<option value="已投递">已投递</option>')
            .append('<option value="已审核">已审核</option>').append('<option value="已发表">已发表</option>');
    }
    if (info_type_val === "项目"){
        $("#info_state").empty().append('<option value="全部">全部</option>').append('<option value="已申请">已申请</option>')
            .append('<option value="已审核">已审核</option>').append('<option value="已立项">已立项</option>').append('<option value="已结题">已结题</option>');
    }
});

$("#confirm_button").click(function () {
    let data = {
        "info_type" : $("#info_type").val(),
        "info_state": $("#info_state").val(),
        "start_date": $("#start_date").val(),
        "end_date": $("#end_date").val()
    };
    $.ajax({
        type: "POST",
        url: "/details",
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify(data),
        success(table_data){
            if(table_data["type"] === 0){
                $("#select-all").prop("checked", false);
                atable = $('#paper_table').dataTable();
                atable.fnClearTable(); //清空一下table
                atable.fnDestroy();//还原初始化了的datatable;
                $("#paper_table").css('display', 'none');
                btable = $('#project_table').dataTable();
                btable.fnClearTable(); //清空一下table
                btable.fnDestroy();//还原初始化了的datatable;
                $("#project_table").css('display', 'none');
                $("#patent_table").show();
                otable = $('#patent_table').dataTable();
                otable.fnClearTable(); //清空一下table
                otable.fnDestroy();//还原初始化了的datatable;
                $("#patent_table tbody").empty().append(table_data["html"]);
                $('#patent_table').DataTable({
                    "order": [],
                    "columnDefs": [{
                        "targets": 'no-sort',
                        "orderable": false,
                    }],
                    "lengthMenu": [5, 10, 15, 20, 25],
                    "bAutoWidth": false
                });
            }
            if(table_data["type"] === 1){
                $("#select-all").prop("checked", false);
                atable = $('#patent_table').dataTable();
                atable.fnClearTable(); //清空一下table
                atable.fnDestroy();//还原初始化了的datatable;
                $("#patent_table").css('display', 'none');
                btable = $('#project_table').dataTable();
                btable.fnClearTable(); //清空一下table
                btable.fnDestroy();//还原初始化了的datatable;
                $("#project_table").css('display', 'none');
                $("#paper_table").show();
                otable = $('#paper_table').dataTable();
                otable.fnClearTable(); //清空一下table
                otable.fnDestroy();//还原初始化了的datatable;
                $("#paper_table tbody").empty().append(table_data["html"]);
                $('#paper_table').DataTable({
                    "order": [],
                    "columnDefs": [{
                        "targets": 'no-sort',
                        "orderable": false,
                    }],
                    "lengthMenu": [5, 10, 15, 20, 25],
                    "bAutoWidth": false
                });
            }
            if(table_data["type"] === 2){
                $("#select-all").prop("checked", false);
                atable = $('#patent_table').dataTable();
                atable.fnClearTable(); //清空一下table
                atable.fnDestroy();//还原初始化了的datatable;
                $("#patent_table").css('display', 'none');
                btable = $('#paper_table').dataTable();
                btable.fnClearTable(); //清空一下table
                btable.fnDestroy();//还原初始化了的datatable;
                $("#paper_table").css('display', 'none');
                $("#project_table").show();
                otable = $('#project_table').dataTable();
                otable.fnClearTable(); //清空一下table
                otable.fnDestroy();//还原初始化了的datatable;
                $("#project_table tbody").empty().append(table_data["html"]);
                $('#project_table').DataTable({
                    "order": [],
                    "columnDefs": [{
                        "targets": 'no-sort',
                        "orderable": false,
                    }],
                    "lengthMenu": [5, 10, 15, 20, 25],
                    "bAutoWidth": false
                });
            }
        }
    })
});

$("#select-all").click(function () {
    let is_checked = $("#select-all").prop('checked');
    let info_type = $("#info_type").val();
    if (info_type === "专利" && $("#patent_table").css("display")==="table"){
        if (is_checked){
        $("#patent_table").find("input[type='checkbox']").each(function () {
            this.checked = true;
        });
    }else {
        $("#patent_table").find("input[type='checkbox']").each(function () {
            this.checked = false;
        });
    }
    }
    else if (info_type === "项目" && $("#project_table").css("display")==="table"){
        if (is_checked){
            $("#project_table").find("input[type='checkbox']").each(function () {
            this.checked = true;
        });
    }else {
        $("#project_table").find("input[type='checkbox']").each(function () {
            this.checked = false;
        });
        }
    }
    else if(info_type === "论文" && $("#paper_table").css("display")==="table") {
        if (is_checked){
        $("#paper_table").find("input[type='checkbox']").each(function () {
            this.checked = true;
        });
    }else {
        $("#paper_table").find("input[type='checkbox']").each(function () {
            this.checked = false;
        });
        }
    }
});

$("#delete_button").click(function () {
    let is_patent = $("#patent_table").css("display");
    let is_paper = $("#paper_table").css("display");
    let is_project = $("#project_table").css("display");
    if (is_patent === "table"){
        let table = $("#patent_table").dataTable();
        let patents_delete = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            patents_delete.push($(elem).attr("id"));
        });
        let data = {
            "delete_number": patents_delete
        };
        $.ajax({
            type: "POST",
            url: "/patent/delete",
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify(data),
            success() {
                $("#patent_table #select-all").prop("checked", false);
                $("#confirm_button").click();
            }
        })
    } else if (is_paper === "table"){
        let table = $("#paper_table").dataTable();
        let papers_delete = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            papers_delete.push($(elem).attr("id"));
        });
        let data = {
            "delete_number": papers_delete
        };
        $.ajax({
            type: "POST",
            url: "/paper/delete",
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify(data),
            success() {
                $("#paper_table #select-all").prop("checked", false);
                $("#confirm_button").click();
            }
        })
    } else{
        let table = $("#project_table").dataTable();
        let projects_delete = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            projects_delete.push($(elem).attr("id"));
        });
        let data = {
            "delete_number": projects_delete
        };
        $.ajax({
            type: "POST",
            url: "/project/delete",
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify(data),
            success() {
                $("#project_table #select-all").prop("checked", false);
                $("#confirm_button").click();
            }
        })
    }
});

$("#auto_update_button").click(function () {
    let interval = $("#interval").val();
    let is_inform = $("#is_inform").val();
    let data = {
        "interval": interval,
        "is_inform": is_inform
    };
    $.ajax({
        type: "POST",
        url: "/update/auto",
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify(data),
        success(msg) {
            if (msg === "success"){
                $("#show_result").html('<div class="alert alert-success alert-dismissible fade show" role="alert" id="set_success">' +
                    '<strong>参数设置成功!</strong><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>' +
                    '</button></div>')
            }else if (msg === "fail"){
                $("#show_result").html('<div class="alert alert-warning alert-dismissible fade show" role="alert" id="set_fail">' +
                    '<strong>参数设置失败!</strong> 请重新选择<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                    '<span aria-hidden="true">×</span></button></div>')
            }
        }
    })
});