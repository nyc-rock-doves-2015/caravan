$(document).ready(function() {
 $('.parcel_details').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var $details = $(event.target);
    $.ajax({
      url: $details[0].href,
      type: 'GET',
      }).done(function (response) {
          $('#sectionA').children().hide();
          $('#sectionA').append(response);
      }).fail(function (response) {
        alert("Can Not Render Your Parcels Due to Error")
      })
    });

   $('.parcels_tab').on('click', function(event) {
      $('#sectionA').children().show();
      $('.parcel_show').hide();
    });

    $('.trip_details').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var $details = $(event.target.parentElement);
    $.ajax({
      url: $details.context.action,
      type: 'GET',
      }).done(function (response) {
          $('#sectionB').children().hide();
          $('#sectionB').append(response);
      }).fail(function (response) {
        alert("Can Not Render Your Trips Due to Error")
      })
    });

     $('.trips_tab').on('click', function(event) {
      $('#sectionB').children().show();
      $('.trip_show').hide();
    });

  });