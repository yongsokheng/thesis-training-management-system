$(document).on("page:change", function() {
  jQuery(function() {
    $("#subjects").dataTable({
      sPaginationType: "full_numbers",
      bJQueryUI: true,
      bProcessing: true,
      bServerSide: true,
      order: [1],
      "columnDefs": [{"orderable": false, "targets": [0, 2]}],
      aLengthMenu: [
        [5, 10, 20, 50, 100, -1],
        [5, 10, 20, 50, 100, "All"]
      ],
      "pageLength": 10,
      sAjaxSource: $("#subjects").data("source")
    });
  });
});
