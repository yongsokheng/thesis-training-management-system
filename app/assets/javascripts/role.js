$(document).on("page:change", function() {
  var tbl_role = $("#role-tbl");
  if(tbl_role.length > 0) {
    set_datatable(tbl_role, [0, 2, 3, 4]);
  }
});
