<!DOCTYPE html>
<html ng-app="sampleApp">
<head>
	<style>gm-map {display: block; width: 100%; height: 300px;}</style>
   <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
	
	
	
	<!-- AngularJS -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js"></script>

<!-- Firebase -->
<script src="https://www.gstatic.com/firebasejs/3.6.6/firebase.js"></script>

<!-- AngularFire -->
<script src="https://cdn.firebase.com/libs/angularfire/2.3.0/angularfire.min.js"></script>


<script>
  // Initialize the Firebase SDK
  var config = {
    apiKey: "AIzaSyAvjusDE9iWml-wx5BHw5VIFLIQAwpOXco",
    authDomain: "hola-mondo.firebaseapp.com",
    databaseURL: "https://hola-mondo.firebaseio.com",
    storageBucket: "hola-mondo.appspot.com"
  };
  firebase.initializeApp(config);
</script>



	<script>
	var app = angular.module('sampleApp', ['firebase'])
		.controller('MpaContoller', function($scope, $firebaseObject, $firebaseArray, $firebaseAuth) {
		var ref = firebase.database().ref().child("messages");
	  // create a synchronized array
	  $scope.messages = $firebaseArray(ref);
	  // add new items to the array
	  // the message is automatically added to our Firebase database!
	  $scope.addMessage = function() {
	    $scope.messages.$add({
	      text: $scope.newMessageText
	    });
	  };

	 var auth = $firebaseAuth();

    $scope.signIn = function() {
      $scope.firebaseUser = null;
      $scope.error = null;

      auth.$signInAnonymously().then(function(firebaseUser) {
        $scope.firebaseUser = firebaseUser;
      }).catch(function(error) {
        $scope.error = error;
      });

    };

	  // click on `index.html` above to see $remove() and $save() in action
	}); 
	</script>
  <script>
      function initMap() {
        var LatLng = new google.maps.LatLng(-25.363, 131.044); 
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: LatLng
        });
        var marker = new google.maps.Marker({
          position: LatLng,
          map: map
        });
        ref = firebase.database().ref("ubicaciones").once('value', function(){

        });
      }
    </script>

  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaevMUIFCIWiH4WGZNjXkO3w7x8OaooH4&callback=initMap">
    </script>




  <script type="text/javascript">
      function agregar()
      {
        u = {};
        u.lat = document.getElementById("lat").value;
        u.lon = document.getElementById("lon").value;
        firebase.database().ref("ubicaciones").push(u);
        document.getElementById("lat").value = "";
        document.getElementById("lon").value = "";
        alert("Registro ingresado correctamente");
      }
    </script>
</head>
	 <body ng-controller="MpaContoller">
	  <input type="text" name="lat" id="lat" placeholder="Latitud">
    <input type="text" name="lon" id="lon" placeholder="Longitud">
    <button id="agregar" type="button" onclick="agregar();" name="agregar">Agregar</button>

<div id="map"></div>
    
   


  </body>
</html>