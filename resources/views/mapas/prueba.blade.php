<!-- <!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Blogcito</title>
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
 html, body, #map_canvas {
            height: 100%;
            width: 100%;
            margin: 0px;
        }
 

        #map_canvas {
            position: relative;
        }

        .angular-google-map-container {
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
        }
    </style>

		<script src="{{asset('js/angular.min.js')}}" type="text/javascript"></script>
		  <script src="//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.js"></script>
    <script src="http://rawgit.com/angular-ui/angular-google-maps/2.0.X/dist/angular-google-maps.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5yrsZnqY4IW5BkJhGwDnc4WZH5dD9XKk&callback=initMap" ></script>
     <!-- <script type='text/javascript' src='script.js'></script><!--script-> ->
		<script type="text/javascript">
			   angular.module('appMaps', ['uiGmapgoogle-maps'])
			    .controller('mainCtrl', function($scope) {
			       $scope.greeting = "Hello World";
			        $scope.map = { center: { latitude: 45, longitude: -73 }, zoom: 8 };
			    });

			</script>

	</head>

	<div class="row" ng-app="appMaps" ng-controller="mainCtrl">
		<h1>Que se yo estoy re loko</h1>
		<p>soy @{{greeting}}</p>
		<div id="map_canvas">
		      <ui-gmap-google-map center="map.center" zoom="map.zoom"></ui-gmap-google-map>
		 </div>

	</div>
		<script src="/vendor/jquery/jquery.min.js"></script>
		</body>
</html> -->

<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
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
  </head>
  <body>
  <div ng-app="miApp">
  	<div ng-controller="ctrl">
  	@{{	greeting}}
	<leaflet></leaflet>

  	<br>

<!--   	 <div id="map"></div> -->

  	</div>
  	
  </div>
 


<script src="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.js"></script> 
    <script src="/js/angular.min.js"></script>
    <script type="text/javascript">
    	var miApp = angular.module('miApp', ["leaflet-directive"]);
    	  miApp.controller("ctrl", [ "$scope", function($scope) {
        }]);


  //   	angular.module('miApp', [])
		//    .controller('ctrl', function($scope) {
		//        $scope.greeting = "Hello World";
		// });

    </script>

     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAyQINCVFHqM-mQuZffMV_AbmRptMBYI1c&callback=initMap"
    async defer></script>

    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -31.535382, lng: -68.530706},
          zoom: 16
        });
      }
    </script> 
  </body>
</html>





<!-- 
<!DOCTYPE html>
<html ng-app="ngMap">
		<head>
		<title>Simle Map</title>
		<meta name="description" content="Simple Map">
		<meta name="keywords" content="ng-map,AngularJS,center">
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<script src="script-tags-for-development.js"></script>
	</head>

	<body>
	  <ng-map center="[-31.535382, -68.530706]"></ng-map>
	</body>
</html> -->