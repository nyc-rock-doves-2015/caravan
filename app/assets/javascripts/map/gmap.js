GmapAutoComplete = function(firstSearch) {
  // Autocomplete
 var input = document.getElementById('origin_search');
  var autocomplete = new google.maps.places.Autocomplete(input);
  var place;
  var photos;
  // Autocomplete Listener
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    place = autocomplete.getPlace();

    document.getElementById("origin_address_latitude").value = place.geometry.location.lat();
    document.getElementById("origin_address_longitude").value = place.geometry.location.lng();

    var address = '';
    if (place.address_components) {
      address = [(place.address_components[0] &&
                  place.address_components[0].short_name || ''),
                 (place.address_components[1] &&
                  place.address_components[1].short_name || ''),
                 (place.address_components[2] &&
                  place.address_components[2].short_name || '')
                ].join(' ');
    }
    // Autofill the fields in the form. TODO: improve parsing of the returned JSON data.
    var address = place.address_components;
    console.log(address)
    var website = place.url;
    if (address[address.length - 1]) {
      var zipcode = address[address.length - 1].long_name;
    };
    if (address[address.length - 2]) {
      var country = address[address.length - 2].long_name;
    };
    if (address[address.length - 3]) {
      var city = address[address.length - 3].long_name;
      var state = address[address.length - 3].short_name
    };
    if (address[0]) {
      var streetnumber = address[0].long_name;
    };
    if (address[1]) {
      var streetname = address[1].long_name;
    };
    if (place.name) {
      var location_name = place.name;
    }
    var formatted_address = place.formatted_address;
    var formatted_phone_number = place.formatted_phone_number;

    if (zipcode){
      document.getElementById("origin_address_zip_code").value = zipcode;
    }
    if (city) {
      document.getElementById("origin_address_city").value = city;
    }
    if (state) {
      document.getElementById("origin_address_state").value = state;
    }
    if (location_name) {
      document.getElementById("origin_address_street_address").value = location_name;
    }
  });

}