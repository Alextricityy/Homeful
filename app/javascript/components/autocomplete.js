function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var Address = document.getElementById('recipient_location_address');

    if (Address) {
      var autocomplete = new google.maps.places.Autocomplete(Address, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(flatAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
document.addEventListener("DOMContentLoaded", function() {
    var Address = document.getElementById('location_address');

    if (Address) {
      var autocomplete = new google.maps.places.Autocomplete(Address, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(flatAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });



}

export { autocomplete };
