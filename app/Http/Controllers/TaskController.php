<?php

namespace App\Http\Controllers;

use App\Task;
use App\SolicitudOT;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Barryvdh\DomPDF\Facade as PDF;

class TaskController extends Controller
{
    public function index()
    {
        return Task::latest()->get();
    }
    public function ver()
    {
        return view("Tasks.task_view");
    }


    public function store(Request $request)
    {
        $this->validate($request, [
            'body' => 'required|max:500'
        ]);
        return Task::create([ 'body' => request('body') ]);
    }
    public function destroy($id)
    {
        $task = Task::findOrFail($id);
        $task->delete();
        return 204;
    }

    public function pdf()
    {
         /**
         * toma en cuenta que para ver los mismos 
         * datos debemos hacer la misma consulta
        */
        $tareas = Task::all(); 
        $pdf = PDF::loadView('pdf.pdf_lista_tareas', compact('tareas'));
        return $pdf->download('listado.pdf');
          /*$pdf = PDF::loadView('pdfView');

        return $pdf->download('invoice.pdf');*/


    }

    
    public function ot_pdf($id_buscando)
    {
        $orden = SolicitudOT::where('solicitud_o_ts.id', $id_buscando)
                            ->join('generadors', 'solicitud_o_ts.id_generador', '=', 'generadors.id')
                            ->join('transportista', 'solicitud_o_ts.id_transportista', '=', 'transportista.id')
                            ->get(['solicitud_o_ts.id as id_sot', 'generadors.id as id_generador', 'transportista.id as id_transportista',
                                    'generadors.razon_social as razon_social_generador', 'transportista.razon_social as razon_social_transportista',
                                    'generadors.domicilio as domicilio_generador', 'transportista.domicilio as domicilio_transportista',
                                    'generadors.cuit as cuit_generador', 'transportista.cuit as cuit_transportista',
                                    'generadors.localidad as localidad_generador', 'transportista.localidad as localidad_transportista'])
                            ->toArray();
        //dd($orden);
        $pdf = PDF::loadView('pdf.orden_transporte_contenido_pdf', compact('orden'));
        return $pdf->download('ot.pdf');


    }

}












