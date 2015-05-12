$(document).ready(function() {
  $.ajax({
    method: "POST",
    url: "some.php",
    data: { name: "John", location: "Boston" }
  })
    .done(function( msg ) {
      alert( "Data Saved: " + msg );
    });
    $.ajax
  ><%= button_to 'details', parcel_path(parcel), class: "btn btn-primary nextBtn btn-xs", method: 'get'%></div>

})

 $('#details').on('submit', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var $details = $(event.target);

    $.ajax({
      url: $details.attr('action'),
      type: 'GET',
    }).done(function (response) {
      console.log(response)
    $('sectionA').closest('#new_question').html(response)
      $question_form.hide;
    }).fail(function (response) {


    });
  });