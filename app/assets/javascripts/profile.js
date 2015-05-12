$(document).ready(function() {
 $('.details').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var $details = $(event.target.parentElement);
    $.ajax({
      url: $details.context.action,
      type: 'GET',
      }).done(function (response) {
        console.log(response)
          $('#sectionA').children().hide();
          $('#sectionA').append(response);
      }).fail(function (response) {

      })
    });

  });