@extends('layout')
@section('content')
<audio id="ChatAudio">
        <source src="{{ asset('sounds/chat.mp3') }}">
    </audio>
<meta name="friendId" content="{{ $friend->id}}">
<meta name="csrf-token" content="{{ csrf_token() }}">
	<div class="row">
		<div class="col-lg-8 text-center">
			<h2 class="section-heading">{{$friend->name}}</h2>
			<hr class="light my-4">
			<a class="btn btn-light btn-xl js-scroll-trigger" href="{{url('/chat')}}">Get Back!</a>
		</div>
		<div id="app">
			<chat v-bind:chats="chats" v-bind:userid="{{Auth::user()->id }}" v-bind:friendid="{{$friend->id}}"></chat>
		</div>
	</div>
		
@endsection