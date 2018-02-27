<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Paginator;

class Timeline extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        //

        /*
        traer elementos de la tabla audits_table (usar el eloquent)
        usar paginacion. buscar como es q paginaba eloquent, si es q lo hacia
        hacer funcion q por ajax traiga mas elementos, es decir, otra pagina

        hacer vista simple para dar salida a estos elememntos, usar el angular-timeline

        lo mejor seria hacer q esta funcion solo cargue la vista, y una funcion q por ajax devuelva paginas de resultados. cuando cargo la vista, automaticamente se trae la primer pagina por ajax. de ahi en mas cada vez q escrolee va trayendo el resto de las paginas por ajax. buscar si hay algun tutorial que enseñe a hacer todo esto
        */

        return view('timeline.timeline');
    }

    public function list($currentPage) {

        $entradas = DB::table('audits')->orderBy('created_at', 'desc')->paginate(10, ['*'], 'currentPage', $currentPage);

        return response()
            ->json($entradas->items());
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
