$(document).on("turbolinks:load", function() {
  var tbl_subject = $("#subjects");
  if(tbl_subject.length > 0) {
    set_datatable(tbl_subject, [0, 2]);
  }
});
