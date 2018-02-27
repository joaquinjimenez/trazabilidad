<?php

namespace TCG\Voyager\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Constraint;
use Intervention\Image\Facades\Image;
use TCG\Voyager\Facades\Voyager;

//mios
//namespace App\Http\Controllers;

//use Illuminate\Http\Request;
use MaddHatter\LaravelFullcalendar\Facades\Calendar;

use App\EventModel;
use App\Markers;

class VoyagerController extends Controller
{
    public function index()
    {

        //mis cosas
        $marcadores = Markers::all();


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
//dd($calendar);


        return Voyager::view('voyager::index',compact('calendar','map'));
    }

    public function logout()
    {
        Auth::logout();

        return redirect()->route('voyager.login');
    }

    public function upload(Request $request)
    {
        $fullFilename = null;
        $resizeWidth = 1800;
        $resizeHeight = null;
        $slug = $request->input('type_slug');
        $file = $request->file('image');

        $path = $slug.'/'.date('F').date('Y').'/';

        $filename = basename($file->getClientOriginalName(), '.'.$file->getClientOriginalExtension());
        $filename_counter = 1;

        // Make sure the filename does not exist, if it does make sure to add a number to the end 1, 2, 3, etc...
        while (Storage::disk(config('voyager.storage.disk'))->exists($path.$filename.'.'.$file->getClientOriginalExtension())) {
            $filename = basename($file->getClientOriginalName(), '.'.$file->getClientOriginalExtension()).(string) ($filename_counter++);
        }

        $fullPath = $path.$filename.'.'.$file->getClientOriginalExtension();

        $ext = $file->guessClientExtension();

        if (in_array($ext, ['jpeg', 'jpg', 'png', 'gif'])) {
            $image = Image::make($file)
                ->resize($resizeWidth, $resizeHeight, function (Constraint $constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })
                ->encode($file->getClientOriginalExtension(), 75);

            // move uploaded file from temp to uploads directory
            if (Storage::disk(config('voyager.storage.disk'))->put($fullPath, (string) $image, 'public')) {
                $status = __('voyager.media.success_uploading');
                $fullFilename = $fullPath;
            } else {
                $status = __('voyager.media.error_uploading');
            }
        } else {
            $status = __('voyager.media.uploading_wrong_type');
        }

        // echo out script that TinyMCE can handle and update the image in the editor
        return "<script> parent.helpers.setImageValue('".Voyager::image($fullFilename)."'); </script>";
    }

    public function profile()
    {
        return Voyager::view('voyager::profile');
    }
}
