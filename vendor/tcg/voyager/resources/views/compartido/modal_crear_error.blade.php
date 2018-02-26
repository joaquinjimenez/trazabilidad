<div class="row">
	<a href="#" class="btn btn-danger pull-right" data-toggle="modal" data-target="#create">
		<i class="voyager-bug"></i> Enviar error 
	</a>
	<div class="modal fade" id="create">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span>×</span>
						</button>
						<h4>Enviar Error</h4>
						<small class="text-muted">Muchas gracias por su comentario</small>
					</div>
					<div class="modal-body">
						<textarea id="body_error" class="form-control" maxlength="256" placeholder="Describe yourself here..."></textarea>
					</div>
					<div class="modal-footer">
						<button  class="btn btn-warning" data-dismiss="modal"><i class="voyager-x"></i> Cerrar</button>
						<button type="submit" class="btn btn-primary"><i class="voyager-paper-plane"></i> Enviar</button>
					</div>
				</div>
			</div>
	</div>
</div>
<div id="app">
	<modal-error></modal-error>
	
</div>

 <script src="{{ asset('js/app.js') }}"></script>

