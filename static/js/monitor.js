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
            .append('<option value="已审核">已审核</option>').append('<option value="已立项">已立项</option>').append('<option value="已完成">已完成</option>');
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
                $("#paper_table_wrapper").css('display', 'none');
                $("#paper_table").css('display', 'none');
                $("#project_table_wrapper").css('display', 'none');
                $("#project_table").css('display', 'none');
                $("#patent_table").css('display', 'block');
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
                $("#patent_table_wrapper").css('display', 'none');
                $("#patent_table").css('display', 'none');
                $("#project_table_wrapper").css('display', 'none');
                $("#project_table").css('display', 'none');
                $("#paper_table").css('display', 'block');
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
        }
    })
});