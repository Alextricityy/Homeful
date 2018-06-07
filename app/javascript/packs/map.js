import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');




const style= [
   {
        "featureType": "administrative.country",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "simplified"
            },
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.icon"
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry",
        "stylers": [
            {
                "hue": "#0077ff"
            },
            {
                "gamma": 3.1
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "hue": "#00ccff"
            },
            {
                "gamma": 0.44
            },
            {
                "saturation": -33
            }
        ]
    },
    {
        "featureType": "poi.park",
        "stylers": [
            {
                "hue": "#44ff00"
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "hue": "#007fff"
            },
            {
                "gamma": 0.77
            },
            {
                "saturation": 65
            },
            {
                "lightness": 99
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "gamma": 0.11
            },
            {
                "weight": 5.6
            },
            {
                "saturation": 99
            },
            {
                "hue": "#0091ff"
            },
            {
                "lightness": -86
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": -48
            },
            {
                "hue": "#ff5e00"
            },
            {
                "gamma": 1.2
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "saturation": -64
            },
            {
                "hue": "#ff9100"
            },
            {
                "lightness": 16
            },
            {
                "gamma": 0.47
            },
            {
                "weight": 2.7
            }
        ]
    }
]
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  //let particularMarker = markers[0]
  // let collection = markers.rest;

  markers.forEach(function(marker) {
     if (marker.type === "primary") {
        var marker1 = new google.maps.Marker({
          position: {lat: marker.lat, lng: marker.lng},
          map: map,
          icon: {
            url: "http://www.clker.com/cliparts/R/g/O/v/U/h/google-maps-marker-for-residencelamontagne-hi.png",
            scaledSize: new google.maps.Size(27, 43)
          }
        });
        map.addMarker(marker1)  //'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
      } else {
        map.addMarker(marker);
      }
  });


  // map.addMarkers(collection);
  //map.addMarkers(markers);
  //console.log(markers.length)
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else if (markers.lat) {
   // map.addMarker(markers)
    map.setCenter(markers.lat, markers.lng);
    map.setZoom(14)
  } else {
    map.fitLatLngBounds(markers);
  }

  map.addStyle({
    styles: style,
    mapTypeId: 'map_style'
  })

  map.setStyle('map_style')

}


autocomplete();
