@extends('layout')
@section('content')
	<div class="row">
		<h1>List of friends</h1>
		@forelse($friends as $friend)
			<a href="{{ route('chat.show', $friend->id) }}" class="panel-block">
				<div>{{ $friend->name }}</div>
				<onlineuser v-bind:friend="{{ $friend }}" v-bind:onlineusers="onlineUsers"></onlineuser>
			</a>
		@empty 
		<div class="row">
			You don't have any friends
		</div>
		@endforelse
	</div>
		
@endsection
