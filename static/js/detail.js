$("#manual_confirm_button").click(function () {
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
                // $("#paper_table_wrapper").css('display', 'none');
                atable = $('#paper_table').dataTable();
                atable.fnClearTable(); //清空一下table
                atable.fnDestroy();//还原初始化了的datatable;
                $("#paper_table").css('display', 'none');

                // $("#project_table_wrapper").css('display', 'none');
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
                // $("#patent_table_wrapper").css('display', 'none');
                atable = $('#patent_table').dataTable();
                atable.fnClearTable(); //清空一下table
                atable.fnDestroy();//还原初始化了的datatable;
                $("#patent_table").css('display', 'none');

                // $("#project_table_wrapper").css('display', 'none');
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
                // $("#patent_table_wrapper").css('display', 'none');
                atable = $('#patent_table').dataTable();
                atable.fnClearTable(); //清空一下table
                atable.fnDestroy();//还原初始化了的datatable;
                $("#patent_table").css('display', 'none');

                // $("#project_table_wrapper").css('display', 'none');
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

$("#modify_detail").click(function () {
    let is_patent = $("#patent_table").css("display");
    let is_paper = $("#paper_table").css("display");
    let is_project = $("#project_table").css("display");
    if (is_patent === "table"){
        let table = $("#patent_table").dataTable();
        let patents_modify = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            patents_modify.push($(elem).attr("id"));
        });
        if (patents_modify.length !== 0){
            $("#modify_a").attr("href", "/modify/patent/"+patents_modify[0]);
            $("#modify_a").trigger("click");
        }
    }else if(is_paper === "table"){
        let table = $("#paper_table").dataTable();
        let paper_modify = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            paper_modify.push($(elem).attr("id"));
        });
        if (paper_modify.length !== 0){
            $("#modify_a").attr("href", "/modify/paper/"+paper_modify[0]);
            $("#modify_a").trigger("click");
        }
    }else {
        let table = $("#project_table").dataTable();
        let project_modify = [];
        let checked_collection = table.$("input[type='checkbox']:checked",{"page":"all"});
        checked_collection.each(function (index, elem) {
            project_modify.push($(elem).attr("id"));
        });
        if (project_modify.length !== 0){
            $("#modify_a").attr("href", "/modify/project/"+project_modify[0]);
            $("#modify_a").trigger("click");
        }
    }
});

$("#add_detail").click(function () {
    let is_patent = $("#patent_table").css("display");
    let is_paper = $("#paper_table").css("display");
    let is_project = $("#project_table").css("display");
    if (is_patent === "table"){
        $("#add_a").attr("href", "/add/patent");
        $("#add_a").trigger("click")
    }else if(is_paper === "table"){
        $("#add_a").attr("href", "/add/paper");
        $("#add_a").trigger("click")
    }else {
        $("#add_a").attr("href", "/add/project");
        $("#add_a").trigger("click")
    }
});
