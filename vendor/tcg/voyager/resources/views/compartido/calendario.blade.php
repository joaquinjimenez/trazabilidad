<!doctype html>
<html lang="en">
<head>
<title>Calendario</title>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.2.7/fullcalendar.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<script src='https://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery.min.js'></script>
	<script src="https://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery-ui.custom.min.js"></script>
    <script src='https://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
	<script src='https://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
	<script type="text/javascript">
	function showModal(x) {

		console.log(x);

		var html = '<strong>' + x.title + '</strong>';

		//HACER: hacer estos parseos con moment
		var aux = new Date(x.start.toString());
		html = html + '<br><strong>Fecha: </strong>' + ((aux.getDate() < 10? '0' : '') + aux.getDate()) + '/' + ((aux.getMonth() < 9? '0' : '') + (aux.getMonth() + 1)) + '/' + aux.getFullYear();
		
		var aux = new Date(x.end.toString());
		html = html + '<br><strong>Fecha de fin: </strong>' + ((aux.getDate() < 10? '0' : '') + aux.getDate()) + '/' + ((aux.getMonth() < 9? '0' : '') + (aux.getMonth() + 1)) + '/' + aux.getFullYear();
		//html = html + '<br><strong>Fecha: </strong>' + x.end.toString();

		$("#cuerpo_modal").html(html);

		$("#exampleModal").modal('show');

        //alert('Clicked on: ' + date.format());

        //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

        //alert('Current view: ' + view.name);

        // change the day's background color just for fun
        $(this).css('background-color', 'red');

    }
</script>
    
</head>
<body>

<div class="row"> ACA VA EL CALENDARIO</div>

    {!! $calendar->calendar() !!}
    {!! $calendar->script() !!}


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Detalles</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="cuerpo_modal">
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>	        
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>

