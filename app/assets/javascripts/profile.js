$(document).on("page:change", function() {
  var tbl_profile = $("#profile-tbl");
  if(tbl_profile.length > 0) {
    set_datatable(tbl_profile, [0, 2]);
  }
});
