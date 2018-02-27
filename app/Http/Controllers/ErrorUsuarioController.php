<?php

namespace App\Http\Controllers;

use App\ErrorUsuario;
use Auth;
use Illuminate\Http\Request;

class ErrorUsuarioController extends Controller
{
    //
    public function store(Request $request)
    {
        //
        ErrorUsuario::create([
            'body' => $request->description,
            'quien' => Auth::user()->id,
            'estado' => "Enviado y sin respuesta"
        ]);
        return 200;

        /*return redirect()
            ->route('voyager.menus.builder', [$menuItem->menu_id])
            ->with([
                'message'    => __('voyager.menu_builder.successfully_updated'),
                'alert-type' => 'success',
            ]);*/
    }
    public function index()
	{
		echo "esto en el index";
	}

}
