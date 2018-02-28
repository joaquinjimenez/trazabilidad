@extends('pdf.layout_pdf')

@section('content')

<div class="container-fluid">
	<div class="row">
		<h1>Orden de transporte Numero : {{$orden[0]["id_sot"]}} </h1>
	</div>
<div class="row">
	<table style="width:100%" >
	  
	  <tbody>
	    <tr>
	      <th style="width:60%">Razon Social: {{$orden[0]["razon_social_generador"]}}</th>
	      <th style="width:40%">CUIT:  {{$orden[0]["cuit_generador"]}}</th>
	    </tr>
	    <tr>
	    	<th style="width:60%">Domicilio: {{$orden[0]["domicilio_generador"]}}</th>
	    	<th style="width:40%">Departamento:  {{$orden[0]["localidad_generador"]}}</th>
	    </tr>
	    <tr>
	      <th style="width:20%">2</th>
	      <td style="width:80%;height:100px">
			  <input type="text" class="form-control" style="width:90%" value="que se yo estoy re loko"> 
	      </td>
	    </tr>
	    
	  </tbody>
	</table>
	</div>

	<table class="table">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">First</th>
	      <th scope="col">Last</th>
	      <th scope="col">Handle</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">1</th>
	      <td>Mark</td>
	      <td>Otto</td>
	      <td>@mdo</td>
	    </tr>
	    <tr>
	      <th scope="row">2</th>
	      <td>Jacob</td>
	      <td>Thornton</td>
	      <td>@fat</td>
	    </tr>
	    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>

<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td><div class="alert alert-dark" >
		  This is a dark alert—check it out!
		</div></td>
    </tr>
  </tbody>
</table>
	<div class="row">
		<div class="alert alert-primary" >
		  This is a primary alert—check it out!
		</div>
	</div>
	<div class="row">
		<div class="alert alert-secondary" >
		  This is a secondary alert—check it out!
		</div>
	</div>
	<div class="row">
		<div class="alert alert-success" >
		  This is a success alert—check it out!
		</div>
	</div>
	<div class="row">
		<div class="alert alert-danger" >
		  This is a danger alert—check it out!
		</div>
	</div>
	<div class="row">
		<div class="alert alert-warning" >
		  This is a warning alert—check it out!
		</div>
	</div>
	<div class="row">
		<div class="alert alert-info" >
		  This is a info alert—check it out!
		</div>
	</div>
	<div class="row">
		<div class="alert alert-light" >
		  This is a light alert—check it out!
		</div>
	</div>
	<div class="row">
		<div class="alert alert-dark" >
		  This is a dark alert—check it out!
		</div>
	</div>
	<div class="row">
		<button type="button" class="btn btn-success">Success</button>
	</div>
</div>
	