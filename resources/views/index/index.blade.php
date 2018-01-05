@extends('layout')
@section('body')
	<div class="row">
		<div class="col-lg-10 mx-auto">
			<h1 class="text-uppercase">
				<strong>Super Voyager</strong>
			</h1>
			<hr>
		</div>
		<div class="col-lg-8 mx-auto">
			<p class="text-faded mb-5">Son todos putos better websites using the Bootstrap CSS framework! Just</p>
			@foreach ($posts as $post)
			<p>
				<a href="{{route('index.post', $post)}}">{{$post->title}}</a>
			</p>
			@endforeach
			<p class="text-faded mb-5"></p>
			<a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
		</div>
	</div>
		
@endsection