<div class="clearfix container-fluid row">
	<div class="col-xs-12 col-sm-12 col-md-12">
		<a href="http://localhost:8000/admin/error-usuarios/create"  id="cargar_error" class="btn btn-danger"> <i class="voyager-bug"></i> Cargar error</a>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12">
		<h1>Mi segundo grafico</h1>
	</div>
</div>


<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Agregar Error nuevo</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<script
			  src="http://code.jquery.com/jquery-3.3.1.min.js"
			  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			  crossorigin="anonymous"></script>
<script type="text/javascript">
	$( document ).ready(function() {
		$('#cargar_error').click(function() {

			//$('#myModal').modal('show');
			 $('.modal-body').load('traer_modal_cargar',function(){
		        $('#myModal').modal({show:true});
		    });
		});
	});
</script>