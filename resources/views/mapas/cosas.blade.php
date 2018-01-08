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



<script src="https://www.gstatic.com/firebasejs/4.8.1/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyAvjusDE9iWml-wx5BHw5VIFLIQAwpOXco",
    authDomain: "hola-mondo.firebaseapp.com",
    databaseURL: "https://hola-mondo.firebaseio.com",
    projectId: "hola-mondo",
    storageBucket: "hola-mondo.appspot.com",
    messagingSenderId: "380413539487"
  };
  firebase.initializeApp(config);
</script>


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
    <!-- <script>
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
    </script> -->


<script src="https://cdn.firebase.com/js/client/2.3.2/firebase.js"></script>



    <script >







      /**
      * Reference to Firebase database.
      * @const
      */
      var firebase = new Firebase('https://hola-mondo.firebaseio.com/');

      /**
      * Data object to be written to Firebase.
      */
      var data = {
        sender: null,
        timestamp: null,
        lat: null,
        lng: null
      };

      function makeInfoBox(controlDiv, map) {
        // Set CSS for the control border.
        var controlUI = document.createElement('div');
        controlUI.style.boxShadow = 'rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px';
        controlUI.style.backgroundColor = '#fff';
        controlUI.style.border = '2px solid #fff';
        controlUI.style.borderRadius = '2px';
        controlUI.style.marginBottom = '22px';
        controlUI.style.marginTop = '10px';
        controlUI.style.textAlign = 'center';
        controlDiv.appendChild(controlUI);

        // Set CSS for the control interior.
        var controlText = document.createElement('div');
        controlText.style.color = 'rgb(25,25,25)';
        controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
        controlText.style.fontSize = '100%';
        controlText.style.padding = '6px';
        controlText.textContent = 'The map shows all clicks made in the last 10 minutes.';
        controlUI.appendChild(controlText);
      }

      /**
      * Starting point for running the program. Authenticates the user.
      * @param {function()} onAuthSuccess - Called when authentication succeeds.
      */
      function initAuthentication(onAuthSuccess) {
        firebase.authAnonymously(function(error, authData) {
          if (error) {
            console.log('Login Failed!', error);
          } else {
            data.sender = authData.uid;
            onAuthSuccess();
          }
        }, {remember: 'sessionOnly'});  // Users will get a new id for every session.
      }
      /**
       * Creates a map object with a click listener and a heatmap.
       */
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 0, lng: 0},
          zoom: 3,
          styles: [{
            featureType: 'poi',
            stylers: [{ visibility: 'off' }]  // Turn off POI.
          },
          {
            featureType: 'transit.station',
            stylers: [{ visibility: 'off' }]  // Turn off bus, train stations etc.
          }],
          disableDoubleClickZoom: true,
          streetViewControl: false,
        });

        // Create the DIV to hold the control and call the makeInfoBox() constructor
        // passing in this DIV.
        var infoBoxDiv = document.createElement('div');
        makeInfoBox(infoBoxDiv, map);
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(infoBoxDiv);

        // Listen for clicks and add the location of the click to firebase.
        map.addListener('click', function(e) {
          data.lat = e.latLng.lat();
          data.lng = e.latLng.lng();
          addToFirebase(data);
        });

        // Create a heatmap.
        var heatmap = new google.maps.visualization.HeatmapLayer({
          data: [],
          map: map,
          radius: 16
        });

        initAuthentication(initFirebase.bind(undefined, heatmap));
      }

      /**
       * Set up a Firebase with deletion on clicks older than expirySeconds
       * @param {!google.maps.visualization.HeatmapLayer} heatmap The heatmap to
       * which points are added from Firebase.
       */
      function initFirebase(heatmap) {

        // 10 minutes before current time.
        var startTime = new Date().getTime() - (60 * 10 * 1000);

        // Reference to the clicks in Firebase.
        var clicks = firebase.child('clicks');

        // Listener for when a click is added.
        clicks.orderByChild('timestamp').startAt(startTime).on('child_added',
          function(snapshot) {

            // Get that click from firebase.
            var newPosition = snapshot.val();
            var point = new google.maps.LatLng(newPosition.lat, newPosition.lng);
            var elapsed = new Date().getTime() - newPosition.timestamp;

            // Add the point to  the heatmap.
            heatmap.getData().push(point);

            // Requests entries older than expiry time (10 minutes).
            var expirySeconds = Math.max(60 * 10 * 1000 - elapsed, 0);
            // Set client timeout to remove the point after a certain time.
            window.setTimeout(function() {
              // Delete the old point from the database.
              snapshot.ref().remove();
            }, expirySeconds);
          }
        );

        // Remove old data from the heatmap when a point is removed from firebase.
        clicks.on('child_removed', function(snapshot, prevChildKey) {
          var heatmapData = heatmap.getData();
          var i = 0;
          while (snapshot.val().lat != heatmapData.getAt(i).lat()
            || snapshot.val().lng != heatmapData.getAt(i).lng()) {
            i++;
          }
          heatmapData.removeAt(i);
        });
      }

      /**
       * Updates the last_message/ path with the current timestamp.
       * @param {function(Date)} addClick After the last message timestamp has been updated,
       *     this function is called with the current timestamp to add the
       *     click to the firebase.
       */
      function getTimestamp(addClick) {
        // Reference to location for saving the last click time.
        var ref = firebase.child('last_message/' + data.sender);

        ref.onDisconnect().remove();  // Delete reference from firebase on disconnect.

        // Set value to timestamp.
        ref.set(Firebase.ServerValue.TIMESTAMP, function(err) {
          if (err) {  // Write to last message was unsuccessful.
            console.log(err);
          } else {  // Write to last message was successful.
            ref.once('value', function(snap) {
              addClick(snap.val());  // Add click with same timestamp.
            }, function(err) {
              console.warn(err);
            });
          }
        });
      }

      /**
       * Adds a click to firebase.
       * @param {Object} data The data to be added to firebase.
       *     It contains the lat, lng, sender and timestamp.
       */
      function addToFirebase(data) {
        getTimestamp(function(timestamp) {
          // Add the new timestamp to the record data.
          data.timestamp = timestamp;
          var ref = firebase.child('clicks').push(data, function(err) {
            if (err) {  // Data was not written to firebase.
              console.warn(err);
            }
          });
        });
      }



















//ANDANDO BIEN

/*

    	 var customLabel = {
        restaurant: {
          label: 'r'
        },
        bar: {
          label: 'b'
        }
      };
 		var uluru = {lat: -31.532111, lng: -68.543135};
        function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center:uluru,
          zoom: 14
        });
        var infoWindow = new google.maps.InfoWindow;

          // Change this depending on the name of your PHP or XML file
          downloadUrl('{{ URL::to("traeme_xml")}}', function(data) {
            var xml = data.responseXML;
            var markers = xml.documentElement.getElementsByTagName('marker');
            Array.prototype.forEach.call(markers, function(markerElem) {
              var name = markerElem.getAttribute('name');
              var address = markerElem.getAttribute('address');
              var type = markerElem.getAttribute('type');
              var point = new google.maps.LatLng(
                  parseFloat(markerElem.getAttribute('lat')),
                  parseFloat(markerElem.getAttribute('lng')));

              var infowincontent = document.createElement('div');
              var strong = document.createElement('strong');
              strong.textContent = name
              infowincontent.appendChild(strong);
              infowincontent.appendChild(document.createElement('br'));

              var text = document.createElement('text');
              text.textContent = address
              infowincontent.appendChild(text);
              var icon = customLabel[type] || {};
              var marker = new google.maps.Marker({
                map: map,
                position: point,
                label: icon.label
              });
              marker.addListener('click', function() {
                infoWindow.setContent(infowincontent);
                infoWindow.open(map, marker);
              });
            });
          });
        }


      function downloadUrl(url, callback) {
        var request = window.ActiveXObject ?
            new ActiveXObject('Microsoft.XMLHTTP') :
            new XMLHttpRequest;

        request.onreadystatechange = function() {
          if (request.readyState == 4) {
            request.onreadystatechange = doNothing;
            callback(request, request.status);
          }
        };

        request.open('GET', url, true);
        request.send(null);
      }

      function doNothing() {}
*/
    
    </script>
    <!-- Andnado bien
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNT2DlqSugISpL62Oxe-2J_u0Gqos4qho&libraries=places&callback=initMap">
    </script> -->

        <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNT2DlqSugISpL62Oxe-2J_u0Gqos4qho&libraries=visualization&callback=initMap">
    </script>

</body>
</html>
























<!-- 
<!DOCTYPE html>
<html>
		<head>
		<title>XMLLLLL Map</title>
		<meta name="description" content="Simple Map">
		<meta name="keywords" content="ng-map,AngularJS,center">
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		
	</head>

	<body>
	  <button id="cosa" name="cosa" onclick="downloadUrl('{{ URL::to("traeme_xml")}}','mostrar')">traeme el XML</button>
	</body>
	<script type="text/javascript">
		function downloadUrl(url,callback) {
			var request = window.ActiveXObject ?  new ActiveXObject('Microsoft.XMLHTTP') : new XMLHttpRequest;
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					request.onreadystatechange = alert("Estoy en el estado 4");
					mostrar(request, request.status);
				}
			};
			request.open('GET', url, true);
			request.send(null);
		}


		function mostrar(respuesta,estado) {
			console.log("La respuesta es:"+respuesta+ "______  el estado es:"+estado);
		}
	</script>
</html> 
 -->