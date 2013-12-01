var map;
var service;
var infowindow;

function map_initialize() {
  var myloc = new google.maps.LatLng($('#prop-addr').attr('data-lat'), $('#prop-addr').attr('data-long'));
  var mapOptions = {
    center: myloc,
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  var marker = new google.maps.Marker({
    map: map,
    position: myloc
  });

  // Add kosher restaurants
  var request = {
    location: myloc,
    radius: '1000',
    keyword: 'kosher'
  };
  infowindow = new google.maps.InfoWindow();
  service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request, callback);
  // Add synagogues
  request = {
    location: myloc,
    radius: '500',
    types: ['synagogue']
  };
  service.nearbySearch(request, callback2);
}

function callback(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      var place = results[i];
      createMarker(results[i], 'gold');
    }
  }
}
function callback2(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      var place = results[i];
      createMarker(results[i], 'red');
    }
  }
}
function createMarker(place, color) {
  var placeLoc = place.geometry.location;
  var symbol = {
    // path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
    path: google.maps.SymbolPath.CIRCLE,
    fillOpacity: 0.8,
    scale: 6,
    strokeColor: color,
  };
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location,
    icon: symbol
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}

$( document ).ready(function() {
  if ("google" in window) {
    map_initialize();
  }
});

