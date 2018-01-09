<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use MaddHatter\LaravelFullcalendar\Facades\Calendar;

use App\EventModel;


class Calendario extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function index() {

        $saludo = " Hola Calendario";
        $events = [];

        $events[] = Calendar::event('Event One', //event title
            false, //full day event?
            '2017-12-11', //start time (you can also use Carbon instead of DateTime)
            '2017-12-12', //end time (you can also use Carbon instead of DateTime)
            0, //optionally, you can specify an event ID
            ['url' => 'http://full-calendar.io',]
        );

        $eloquentEvents = EventModel::all(); //EventModel implements MaddHatter\LaravelFullcalendar\Event
        
        $calendar = Calendar::addEvents($eloquentEvents) //add an array with addEvents
        //->addEvent($eloquentEvent, ['color' => '#800', ]) //set custom color fo this event
        ->setOptions(['firstDay' => 1])
        ->setCallbacks([ //set fullcalendar callback options (will not be JSON encoded)
            'eventClick' => 'function(event) {
                 showModal(event);
             }'
        ]); //set fullcalendar options
        

        return view('calendario.calendario', compact('calendar'));
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
