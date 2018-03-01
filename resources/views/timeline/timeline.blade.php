<!doctype html>
<html lang="en">
<head>
<title>Eventos</title>
	 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- AngularJS -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.1/angular.min.js"></script>
	 <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
	 
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/angular-timeline.css"/>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 <script src="js/angular-timeline.js" type="text/javascript"></script>

	 <style>
	  body { background-color: aliceblue; }
	  timeline-footer { background-color: aliceblue; }
	</style>

</head>
<body>

	<div class="app-container">
	    <div class="fadetoblack visible-xs"></div>
	    <div class="row content-container">
	        
	        <!-- Main Content -->
	        <div class="container-fluid">
	            <div class="side-body padding-top">
	                <div class="container-fluid">
				        <h1 class="page-title">
				            <center><i class="glyphicon glyphicon-time"></i> Eventos</center>

				        </h1>
				        
				    </div>
	                <div id="voyager-notifications"></div>
	                <div class="page-content browse container-fluid">
						<div ng-app="tl" ng-controller="tl">
							<br>
							<timeline>
							 	<timeline-event ng-repeat="event in events" side="@{{$index % 2 == 0? 'left' : 'right'}}">
									<timeline-badge class="@{{event.badgeClass}}">
									  	<i class="glyphicon @{{event.badgeIconClass}}"></i>
									</timeline-badge>

									<timeline-panel class="@{{event.badgeClass}}">
									    <timeline-heading>
											<h4>@{{event.title}}</h4>
									    </timeline-heading>
									    <p>@{{event.content}}</p>
									</timeline-panel>
								 </timeline-event>
							</timeline>
							<br>
							<center><img src="img/Loading_2.gif" width="100" id="gif_carga" hidden></center>
						</div>
					</div>
	            </div>
	        </div>
	    </div>
	</div>					

</body>
</html>

<script type="text/javascript">

	var app = angular.module('tl', ['angular-timeline'])
	.controller('tl', function($scope, $http) {		

		var currentPage = 1;
		$scope.events = [];
		var badgeClass = {
			'created': 'success',
			'updated': 'info',
			'deleted': 'danger',
			'restored': 'warning',
		};

		var badgeIconClass = {
			'created': 'glyphicon-plus',
			'updated': 'glyphicon-edit',
			'deleted': 'glyphicon-trash',
			'restored': 'glyphicon-repeat',
		};

		var title = {
			'created': 'creado',
			'updated': 'actualizado',
			'deleted': 'eliminado',
			'restored': 'restaurado',
		};

		$scope.traer_registros = function() {

			$("#gif_carga").show();

			var postData = {  
                currentPage: currentPage
            };

            $http.get('<?= url("timeline/list")?>' + '/' + currentPage, $.param(postData))
            .then(function (data, status) {
            	console.log(data.data);
            	var events_aux = data.data;
            	for (var i =  0; i < events_aux.length; i++) {
            		
            		var x = events_aux[i];

            		var fecha = x.created_at.split(' ')[0].split('-').reverse().join('/');
            		var hora = x.created_at.split(' ')[1]

            		var nombre_tabla = x.auditable_type.split('\\');
            		nombre_tabla = nombre_tabla[nombre_tabla.length - 1];

            		$scope.events.push({
            			badgeClass: badgeClass[x.event],
					    badgeIconClass: badgeIconClass[x.event],
					    title: 'Ha sido ' + title[x.event] + ' un registro de la tabla "' + nombre_tabla + '"',
					    content: 'El día ' + fecha + ' a las ' + hora + 'hs.',
            		});
            	}

            	$("#gif_carga").hide();

            	currentPage++;
            },
            function(error){}
	        );

		}

		window.onscroll = function(ev) {
		    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		        $scope.traer_registros();
		    }
		};

		$scope.traer_registros();
    });
	
</script>