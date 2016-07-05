$(document).on("page:change", function() {
  $("#course-tbl").dataTable({
    "dom": "<'row'<'col-sm-4'l><'col-sm-4'f><'col-sm-4 filter-status'>>"
      + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-5'i><'col-sm-7 pull-right'p>>",
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    aLengthMenu: [
      [5, 10, 20, 50, 100, -1],
      [5, 10, 20, 50, 100, "All"]
    ],
    order: [1],
    "columnDefs": [{"orderable": false, "targets": [0, 2, 3]}],
    "pageLength": 10,
    sAjaxSource: $("#course-tbl").data("source")
  });

  $("#course-tbl").dataTable().columnFilter({
    aoColumns: [
      null,
      null,
      null,
      {sSelector: ".filter-status", type:"select",
        values: [{ value: "0", label: "init"}, { value: "1", label: "progress"},
        { value: "2", label: "finish"}]},
    ]
  });

  $("#course-tbl_wrapper .select_filter").removeClass("form-control");
});
