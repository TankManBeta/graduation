$(document).ready(function() {
    dragula([document.getElementById("left"), document.getElementById("right")]);
});

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
                let patent_headers = ["专利权人", "发明人", "专利号", "专利名称", "专利状态", "时间", "专利类型"];
                $("#left>div").remove();
                $("#right>div").remove();
                for (let i=0; i<patent_headers.length; i++){
                    $("#left").append("<div>"+patent_headers[i]+"</div>")
                }
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
                let paper_headers = ["论文编号", "论文名称", "论文来源", "发表时间", "机构地区", "关键词", "刊登信息", "检索类型", "被引量", "影响因子", "检索类型", "doi号", "论文状态"];
                $("#left>div").remove();
                $("#right>div").remove();
                for (let i=0; i<paper_headers.length; i++){
                    $("#left").append("<div>"+paper_headers[i]+"</div>")
                }
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
                let project_headers = ["项目编号", "项目名称", "项目来源", "项目类型", "时间", "项目状态", "主持人", "主持人职称"];
                $("#left>div").remove();
                $("#right>div").remove();
                for (let i=0; i<project_headers.length; i++){
                    $("#left").append("<div>"+project_headers[i]+"</div>")
                }
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

$("#export_some").click(function () {
    let is_patent = $("#patent_table").css("display");
    let is_paper = $("#paper_table").css("display");
    let is_project = $("#project_table").css("display");
    let data = {};
    if (is_patent === "table"){
        let table = $("#patent_table").dataTable();
        let patents_export = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            patents_export.push($(elem).attr("id"));
        });
        data["export_type"] = 0;
        data["export_number"] = patents_export
    } else if (is_paper === "table"){
        let table = $("#paper_table").dataTable();
        let papers_export = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            papers_export.push($(elem).attr("id"));
        });
        data["export_type"] = 1;
        data["export_number"] = papers_export
    } else{
        let table = $("#project_table").dataTable();
        let projects_export = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            projects_export.push($(elem).attr("id"));
        });
        data["export_type"] = 2;
        data["export_number"] = projects_export
    }
    $.ajax({
        type: "POST",
        url: "/export/some",
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify(data),
        responseType: "blob",
        success(res) {
            alert("asdasd");
            if (res.ok){
                const res_data = res.blob();
                console.log(res_data)
            }
            $("#select-all").prop("checked", false);
            $("#confirm_button").click();
        }
    })
});

$("#export_all").click(function () {
    let is_patent = $("#patent_table").css("display");
    let is_paper = $("#paper_table").css("display");
    let is_project = $("#project_table").css("display");
    let data = {};
    if (is_patent === "table"){
        let table = $("#patent_table").dataTable();
        let patents_export = [];
        let checked_collection = table.$("input[type='checkbox']",{"page":"all"});
        checked_collection.each(function (index, elem) {
            patents_export.push($(elem).attr("id"));
        });
        data["export_type"] = 0;
        data["export_number"] = patents_export
    } else if (is_paper === "table"){
        let table = $("#paper_table").dataTable();
        let papers_export = [];
        let checked_collection = table.$("input[type='checkbox']",{"page":"all"});
        checked_collection.each(function (index, elem) {
            papers_export.push($(elem).attr("id"));
        });
        data["export_type"] = 1;
        data["export_number"] = papers_export
    } else{
        let table = $("#project_table").dataTable();
        let projects_export = [];
        let checked_collection = table.$("input[type='checkbox']",{"page":"all"});
        checked_collection.each(function (index, elem) {
            projects_export.push($(elem).attr("id"));
        });
        data["export_type"] = 0;
        data["export_number"] = projects_export
    }
    $.ajax({
        type: "POST",
        url: "/export/all",
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify(data),
        success() {
            $("#select-all").prop("checked", false);
            $("#confirm_button").click();
        }
    })
});

