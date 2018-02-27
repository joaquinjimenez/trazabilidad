<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ErrorUsuario;

class ErrorUsuario extends Controller
{
    //
    public function store(Request $request)
    {
        //
         Chat::create([
            'user_id' => $request->user_id,
            'friend_id' => $request->friend_id,
            'chat' => $request->chat
        ]);
    }

}
