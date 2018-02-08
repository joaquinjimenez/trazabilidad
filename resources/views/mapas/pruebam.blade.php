<!DOCTYPE html>
<html ng-app="MyApp">
<head>
	<style>gm-map {display: block; width: 100%; height: 300px;}</style>

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

	<script src="/js/angular.min.js"></script>
	<script src="/vendor/angulargooglemaps/dist/angular-google-maps-native.min.js "></script>
	<script>
	var app = 
	angular.module('MyApp', ['GoogleMapsNative'])
		.controller('MpaContoller', function($scope, $timeout) {
			$scope.coords = {latitude: false, longitude: false};
			$scope.latitud = false;
			$scope.longitud = false;
			$scope.saludos="holaass";

			$scope.showTransitLayer = true;
			$scope.showTrafficLayer=false;
			$scope.showBicyclingLayer=false;
			


			$scope.ventana =  '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
            'sandstone rock formation in the southern part of the '+
            'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
            'south west of the nearest large town, Alice Springs; 450&#160;km '+
            '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
            'features of the Uluru - Kata Tjuta National Park. Uluru is '+
            'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
            'Aboriginal people of the area. It has many springs, waterholes, '+
            'rock caves and ancient paintings. Uluru is listed as a World '+
            'Heritage Site.</p>'+
            '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
            'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
            '(last visited June 22, 2009).</p>'+
            '</div>'+
            '</div>';
			$scope.image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
        
			$scope.animate = function (renderer) {
			    $timeout(function () {
			      renderer.setAnimation($scope.google.maps.Animation.BOUNCE);
			      //renderer.setAnimation($scope.google.maps.Animation.DROP);
			    }, 3000);
			  };

			$scope.setPanel = function (renderer) {
		renderer.setPanel(document.getElementById('routes'));
		}
	}); 
	</script>
</head>
	<body ng-controller="MpaContoller">
 
		<!-- <gm-map options="{center: [-31.535259, -68.518145], zoom: 14, mapTypeId: google.maps.MapTypeId.ROADMAP}">
			<gm-marker options="{position:  [-31.535259, -68.518145], draggable: true}" on-dragend="coords.latitude=marker.getPosition().lat(); coords.longitude=marker.getPosition().lng()">
				<gm-infowindow options="{content: 'Arrastrarme puto!'}"></gm-infowindow>
			</gm-marker>
		</gm-map>
			<div ng-if="coords.latitude !== false">Dragend on [@{{coords.latitude}}, @{{coords.longitude}}]</div>
		<h1>Las cordenas @{{saludos}} </h1>  -->

		<h1>{{$valor}}</h1>
		@if($valor == 4)
			<h1> Hola sr generador</h1>
		@else <h1> Hola sr pelotudo</h1>
		@endif
		<div class="panel">
			<div class="item">
				<button ng-click="destination=[-31.53547846498398, -68.48063698913575]">address 1</button>
			</div>
			<div class="item">
				<button ng-click="destination=[-31.557714908349933, -68.5328220477295]">address 2</button>
			</div>
			<div class="item">
				<button ng-click="destination=[-31.551863726409106,-68.51222268249512]">Casita</button>
			</div>
			<div class="item">
				<button ng-click="ventana = 'ARRASTRAME PUTO!'">Mensaje</button>
			</div>

			<div class="item">
				<label>
					<input type="checkbox" ng-model="showGroundOverlay"> Mostrar Sol Perez
				</label>
			</div>
			<div class="item">
			    <label>
			      <input type="checkbox" ng-model="showTransitLayer"> Show the TransitLayer
			    </label>
			  </div>
			  <div class="item">
			    <label>
			      <input type="checkbox" ng-model="showTrafficLayer"> Show the TrafficLayer
			    </label>
			  </div>
			  <div class="item">
			    <label>
			      <input type="checkbox" ng-model="showBicyclingLayer"> Show the BicyclingLayer
			    </label>
			  </div>


		</div>
	  <gm-map options="{center: [-31.551, -68.612], zoom: 13}">

    <gm-directions destination="destination" options="{origin:[-31.53138170022603, -68.52801552917481] , travelMode: google.maps.DirectionsTravelMode.DRIVING}">
     
     <gm-marker options="{position:  [-31.535259, -68.518145], draggable: true, icon: image, title: 'La banderita'}" on-dragend="coords.latitude=marker.getPosition().lat(); coords.longitude=marker.getPosition().lng()" gm-then="animate(marker)">
				<gm-infowindow options="{content: ventana}"></gm-infowindow>
			</gm-marker>

      <gm-renderer options="{polylineOptions:{strokeColor: '#0077c4', strokeWeight: 4, strokeOpacity: 1.0}}" gm-then="setPanel(renderer)"></gm-renderer>
    </gm-directions>

		<gm-groundOverlay ng-show="showGroundOverlay" options="{url:'https://www.infobae.com/new-resizer/1Cz_sYM98aH2Dv3nGwr4vZNdOGo=/600x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/06/08164339/Sol-Perez-31.jpg', bounds:{ne:{lat:-31.551863726409106, lng:-68.51222268249512}, sw:{lat:-31.557714908349933, lng:  -68.5328220477295}}, opts: {opacity:0.8}}"></gm-groundOverlay>
		<gm-transitLayer ng-show="showTransitLayer"></gm-transitLayer>
		 <gm-trafficLayer ng-show="showTrafficLayer"></gm-trafficLayer>
		 <gm-bicyclingLayer ng-show="showBicyclingLayer"></gm-bicyclingLayer>
				<gm-polygon
					options="{strokeColor: '#FF0000', strokeOpacity: 0.8, strokeWeight: 2, fillColor: '#FF0000', fillOpacity: 0.35, paths:[[-31.511992786681294, -68.60929719116206], [-31.54593903084701, -68.61015549804682], [-31.524431420367435, -68.56088868286128], [-31.505699670694003, -68.56380692626948]]}"
					on-click="polygon.setOptions({strokeColor: '#0000FF', fillColor: '#0000FF'})"
				 ></gm-polygon>


<gm-circle
    ng-show="showCircle"
    center="map.getCenter()"
    options="{radius: 250000, fillColor: '#008BB2', strokeColor: '#005BB7'}"
    ></gm-circle>

		  </gm-map>

  	<div ng-if="coords.latitude !== false">Dragend on [@{{coords.latitude}}, @{{coords.longitude}}]</div>
		<h1>Las cordenas @{{saludos}} </h1> 
		


  <div id="routes"></div>
	</body>
</html>