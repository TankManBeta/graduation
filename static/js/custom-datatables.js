(function($) {
    "use strict"; // Start of use strict
    /* ====================
    Data tables
    =======================*/
    // Payents datatable
    $('#tableId').DataTable({
        "order": [],
        "columnDefs": [{
            "targets": 'no-sort',
            "orderable": false,
        }],
        "lengthMenu": [5, 10, 15, 20, 25]
    });
    $('#patent_table').DataTable({
        "order": [],
        "columnDefs": [{
            "targets": 'no-sort',
            "orderable": false,
        }],
        "lengthMenu": [5, 10, 15, 20, 25],
        "bAutoWidth": false
    });
})(jQuery);