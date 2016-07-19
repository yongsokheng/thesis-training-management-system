$(document).on("turbolinks:load", function() {
  var tbl_user = $("#tbl-user");
  if(tbl_user.length > 0) {
    set_datatable(tbl_user, [0, 4, 5]);
  }
});
