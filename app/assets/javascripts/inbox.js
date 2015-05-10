
$(function() {
  $('.inbox').on('click', function(e) {
    var msgId = e.target.dataset.id;
    $("#msgbody" + msgId).toggle();
  });
});