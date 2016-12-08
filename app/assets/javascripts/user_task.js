$(document).on("turbolinks:load AjaxComplete", function() {
  if($(".user-task-page").length > 0) {
    $("#comment-field").unbind("keypress").on("keypress", function(e){
      var content = $.trim($(this).val());
      var user_task_id = $(this).parent().find(".data-user-task-id").data("user-task-id");
      if (e.keyCode == 13) {
        event.preventDefault();
        if (content != "") {
          $.post("/comments", {user_task_id: user_task_id,
            content: content});
        }
      }
    });

    $(".comments .contents").slimScroll({
      height: '100%',
      start: 'bottom'
    });
  }
});

$(document).on("turbolinks:load", function() {
  $(".user-task-collapse").on("hide.bs.collapse", function () {
    toggle_icon_class($(this));
  });

  $(".user-task-collapse").on("show.bs.collapse", function () {
    toggle_icon_class($(this));
  });

  function toggle_icon_class(element) {
    element.prev("tr").find(".glyphicon")
      .toggleClass("glyphicon-chevron-down glyphicon-chevron-up");
  }
});
