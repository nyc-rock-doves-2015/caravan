 $(document).ready(function(){
 handler = Gmaps.build('Google');
  handler.buildMap({ provider: {
  zoom: 3,
  center: new google.maps.LatLng(39.5, -98.35)
  }, internal: {id: 'map'}}, function(){
    // markers = handler.addMarkers(#{raw @locations_hash.to_json});
    handler.fitMapToBounds();
  });
})