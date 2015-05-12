$(document).ready(function() {
 $('.details').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var $details = $(event.target.parentElement);
    $.ajax({
      url: $details.context.action,
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

   $('.trips_tab').on('click', function(event) {
      $('.nav-tabs:eq(1)').removeClass('active')
      $('.nav-tabs:eq(2)').addClass('active')
    });

  });