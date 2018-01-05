@extends('header')
@section('body')
	<div class="row">
		<div class="col-lg-10 mx-auto">
			<h1 class="text-uppercase">
				<strong>{{$post->title}}</strong>
			</h1>
			<hr>
		</div>
		<div class="col-lg-8 mx-auto">
			<p class="text-faded mb-5">{{$post->body}}</p>
		</div>
	</div>
@endsection 

<!-- @extends('footer') -->
