<?php

namespace App\Http\Controllers;

use App\Chat;
use App\User;
use Auth;
use Illuminate\Http\Request;

class ChatController extends Controller
{
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		//
		   $friends = Auth::user()->friends();
		//dd($friends);
		$saludo=" Chupame la pija";
		return view('chat.index')->withFriends($friends)->withsaludo($saludo);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		//
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  \App\Chat  $chat
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		//
		$friend = User::find($id);
		$saludo = " ";
		return view('chat.show')->withFriend($friend)->withsaludo($saludo);
	}

	public function sendChat(Request $request) {
		dd($request->friend_id);
        Chat::create([
            'user_id' => $request->user_id,
            'friend_id' => $request->friend_id,
            'chat' => $request->chat
        ]);
        
        return [];
    }
	 public function prueba_envio()
     {
         Chat::create([
        	'user_id'=>  '4',
        	'friend_id'=> '12',
        	'chat'=> 'hdffhdfhdfhder',
        ]);
        echo "lo cree bien";
    }


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  \App\Chat  $chat
	 * @return \Illuminate\Http\Response
	 */
	public function edit(Chat $chat)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \App\Chat  $chat
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, Chat $chat)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  \App\Chat  $chat
	 * @return \Illuminate\Http\Response
	 */
	public function destroy(Chat $chat)
	{
		//
	}
	public function getChat($id)
	{
		//
		$chat =  Chat::where(function($query) use ($id){
			$query->where('user_id', "=", Auth::user()->id)->where('friend_id', '=', $id);
		})->orWhere(function($query) use ($id){
			$query->where('user_id', "=", $id)->where('friend_id', '=', Auth::user()->id);
		})->get();
		return ($chat);
	}
}
