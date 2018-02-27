<style>
  .modal-mask {
	position: fixed;
	z-index: 9998;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .5);
	display: table;
	transition: opacity .3s ease;
  }

  .modal-wrapper {
	display: table-cell;
	vertical-align: middle;
  }

  .modal-container {
	width: 300px;
	margin: 0px auto;
	padding: 20px 30px;
	background-color: #fff;
	border-radius: 2px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
	transition: all .3s ease;
	font-family: Helvetica, Arial, sans-serif;
  }

  .modal-header h3 {
	margin-top: 0;
	color: #42b983;
  }

  .modal-body {
	margin: 20px 0;
  }

  .modal-default-button {
	float: right;
  }

  /*
   * The following styles are auto-applied to elements with
   * transition="modal" when their visibility is toggled
   * by Vue.js.
   *
   * You can easily play with the modal transition by editing
   * these styles.
   */

  .modal-enter {
	opacity: 0;
  }

  .modal-leave-active {
	opacity: 0;
  }

  .modal-enter .modal-container,
  .modal-leave-active .modal-container {
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
  }

</style>

<template v-if="conditionA">
	<div class="row">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	      <div class="modal-dialog" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	            <h4 class="modal-title" id="myModalLabel">Nuevo Error</h4>
	          </div>
	          <div class="modal-body">
	            <textarea v-model="body_error" maxlength="256" class="form-control" placeholder="Ingrese su inconveniente, duda o consejo">
	            	
	            </textarea>
	          </div>
	          <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="voyager-x"></i>  Cerrar</button>
	            <button type="button" class="btn btn-primary"><i class="voyager-paper-plane"></i>  Enviar </button>
	          </div>
	        </div>
	      </div>
	    </div>    

	  <!--   <h1 v-if="showModal == true" >HOLLAAA</h1> -->
		
	 <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"><i class="voyager-bug"></i>Mandar Error</button>
		<!-- <button id="show-modal" @click="showModal? showModal = false : showModal =true" class="btn btn-danger" ><i class="voyager-bug"></i> Show Modal</button> -->
		
	</div>
</template>
<script>
	import axios  from 'axios';
    //import toastr from 'toastr';
 //    import moment from 'moment'

	export default {
		 data() {
			 return {
			  showModal: false,
			  body_error: '',
			  conditionA : true
			};
		},
		methods: {
            createError: function() {
                var url = 'guardar_error';
                axios.post(url, {
                    description: this.body_error
                }).then(response => {
                    this.body_error = '';
                    alert(response.data);
                   // toastr.success('Nueva idea registrada');
                }).catch(error => {
                   // toastr.error('Error');
                });
            }
	}
}
</script>
