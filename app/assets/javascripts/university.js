$(document).on("page:change", function() {
  var tbl_university = $("#university-tbl");
  if(tbl_university.length > 0) {
    set_datatable(tbl_university, [0, 2, 3]);
  }
});
