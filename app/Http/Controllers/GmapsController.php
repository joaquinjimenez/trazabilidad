<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use App\Markers;
//use GeneaLabs\Phpgmaps\Facades\PhpgmapsFacade;

class GmapsController extends Controller
{
    //
    public function index()
    {

    	$marcadores = Markers::all();


        return view('gmaps', compact('map'));
    }
}
