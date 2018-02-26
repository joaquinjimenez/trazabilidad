<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

	 <style>
      #map {
        height: 400px;
        width: 100%;
       }

       html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }

    </style>
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<script
	  src="https://code.jquery.com/jquery-3.2.1.min.js"
	  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	  crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
    	<div class="col-sm-4">
	    	<h1>Add Vendor, Location</h1>

	    	<div class="form-group">
	    		<label>Titulo</label>
	    		<input type="text" class="form-control input-sm" name="title">
	    	</div>
	    	<div class="form-group">
	    		<input onclick="clearMarkers();" type=button value="Hide Markers">
			      <input onclick="showMarkers();" type=button value="Show All Markers">
			      <input onclick="deleteMarkers();" type=button value="Delete Markers">

	    	</div>
	    	<div class="form-group">
	    		<label>Mapa</label>
	    		 <input id="pac-input" class="controls" type="text" placeholder="Search Box">
	    	</div>
	    	<div class="form-group">
	    		<label>Lat</label>
	    		<input type="text" class="form-control input-sm" name="lat" id="lat">
	    	</div>
	    	<div class="form-group">
	    		<label>Lng</label>
	    		<input type="text" class="form-control input-sm" name="lng" id="lng">
	    	</div>
	    	<button class="btn btn-sm btn-danger">Save</button>
    	</div>
    </div>

    <div id="map"></div>
    <script>
    var markers = [];
    var map;
      function initMap() {
        var uluru = {lat: -31.532111, lng: -68.543135};
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: uluru
        });
        // var marker = new google.maps.Marker({
        //   position: uluru,
        //   map: map,
        //   draggable: true
        // });

       // var searchBox = new google.maps.places.SearchBox(document.getElementById('pac-input'));
       var infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);



         var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });


        service.getDetails({
          placeId: 'ChIJl9Q8oylAgZYRs_w8I6Cj878'
        }, function(place, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            var marker = new google.maps.Marker({
              map: map,
              position: place.geometry.location
            });
            google.maps.event.addListener(marker, 'click', function() {
              infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                'Place ID: ' + place.place_id + '<br>' +
                place.formatted_address + '</div>');
              infowindow.open(map, this);
            });
          }
        });




 


        //botones de agregar esconder y eliminar
         // This event listener will call addMarker() when the map is clicked.
        map.addListener('click', function(event) {
          addMarker(event.latLng);
        });

        // Adds a marker at the center of the map.
        addMarker(uluru);
      }

      // Adds a marker to the map and push to the array.
      function addMarker(location) {
        var marker = new google.maps.Marker({
          position: location,
          map: map
        });
        markers.push(marker);
      }

      // Sets the map on all markers in the array.
      function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(map);
        }
      }

      // Removes the markers from the map, but keeps them in the array.
      function clearMarkers() {
        setMapOnAll(null);
      }

      // Shows any markers currently in the array.
      function showMarkers() {
        setMapOnAll(map);
      }

      // Deletes all markers in the array by removing references to them.
      function deleteMarkers() {
        clearMarkers();
        markers = [];
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNT2DlqSugISpL62Oxe-2J_u0Gqos4qho&libraries=places&callback=initMap">
    </script>
</body>
</html>