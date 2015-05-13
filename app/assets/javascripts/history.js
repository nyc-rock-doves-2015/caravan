$(document).ready(function() {
 $('#history').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var $details = $(event.target);
    console.log($details[0].href)
    $.ajax({
      url: $details[0].href,
      type: 'GET',
      }).done(function (response) {
          $('.profile-content').children().hide();
          $('.profile-content').append(response);
      }).fail(function (response) {
        alert("Can Not Render Your Parcels Due to Error")
      })

   $('.parcels_tab').on('click', function(event) {
      $('#sectionA').children().show();
      $('.parcel_show').hide();
    });
 });
})
