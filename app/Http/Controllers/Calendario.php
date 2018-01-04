<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
//use MaddHatter\LaravelFullcalendar\Facades\Calendar;

use App\EventModel;


class Calendario extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
     {
        $saludo =" Hola Calendario";
        $events = [];

        $events[] = \Calendar::event(
            'Event One', //event title
            false, //full day event?
            '2017-12-11', //start time (you can also use Carbon instead of DateTime)
            '2017-12-12', //end time (you can also use Carbon instead of DateTime)
            0, //optionally, you can specify an event ID
            [
                'url' => 'http://full-calendar.io',
                //any other full-calendar supported parameters
            ]
        );

        $events[] = \Calendar::event(
            "Valentine's Day", //event title
            true, //full day event?
            new \DateTime('2015-02-14'), //start time (you can also use Carbon instead of DateTime)
            new \DateTime('2015-02-14'), //end time (you can also use Carbon instead of DateTime)
            'stringEventId' //optionally, you can specify an event ID
        );
        
        $eloquentEvent = EventModel::first(); //EventModel implements MaddHatter\LaravelFullcalendar\Event

            $calendar = \Calendar::addEvents($events) //add an array with addEvents
                ->addEvent($eloquentEvent, [ //set custom color fo this event
                    'color' => '#800',
                ])->setOptions([ //set fullcalendar options
                    'firstDay' => 1
                ])
                // ->setCallbacks([ //set fullcalendar callback options (will not be JSON encoded)
             //        'viewRender' => 'function() {alert("Callbacks!");}'
             //    ])
                ;
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
