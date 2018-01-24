@extends('layout')
@section('content')
	<div class="row">
		<h1>List of friends</h1>
		@forelse($friends as $friend)
			<a href="{{route('chat.show', $friend->id)}}" class="btn btn-light btn-xl js-scroll-trigger" >
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">{{$friend->name}}</h2>
					<hr class="my-4">
				</div>
			</a>
		@empty 
		<div class="row">
			You don't have any friends
		</div>
		@endforelse
	</div>
		
@endsection
