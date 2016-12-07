App.notifications = App.cable.subscriptions.create('CommentsChannel', {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(data) {
    var contents = $(".comments .contents");
    var title = $(".comments .box-title .badge")
    $("#comment-field").val("");
    contents.append(data.comment);
    contents.slimScroll({scrollTo: contents.prop("scrollHeight")});
    title.html(parseInt(title.text()) + 1);
  }
});
