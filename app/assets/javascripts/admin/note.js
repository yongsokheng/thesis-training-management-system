$(document).on("page:change", function() {
  $("#note-modal").on("hidden.bs.modal", function () {
    $("#note_name").val("");
  });
});
