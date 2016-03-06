<%-- 
    Document   : index
    Created on : Mar 5, 2016, 7:27:35 PM
    Author     : abhigp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="scripts/geolocation-marker.js"></script>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map_canvas {
        height: 100%;
      }
    </style>
  </head>
  <body>
    <div id="map_canvas"></div>
    <script>
      var map;
      var pos;
      function initMap() {
        var mapOptions = {
          zoom: 17,
          center: new google.maps.LatLng(-34.397, 150.644),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

        GeoMarker = new GeolocationMarker();
        GeoMarker.setCircleOptions({fillColor: '#808080'});

        google.maps.event.addListenerOnce(GeoMarker, 'position_changed', function() {
          map.setCenter(this.getPosition());
          map.fitBounds(this.getBounds());
        });

        google.maps.event.addListener(GeoMarker, 'geolocation_error', function(e) {
          alert('There was an error obtaining your position. Message: ' + e.message);
        });

        GeoMarker.setMap(map);
        if(!navigator.geolocation) {
            alert('Your browser does not support geolocation');
        }        
     }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBCpOZNSRRCeMPSvA9lBvE_EIc-Ik4NMrE&callback=initMap"
    async defer></script>
  </body>
</html>
