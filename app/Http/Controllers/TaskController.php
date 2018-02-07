<?php

namespace App\Http\Controllers;

use App\Task;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TaskController extends Controller
{
    public function index()
    {
        return Task::latest()->get();
    }
    public function ver()
    {
        return view("tasks.task_view");
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
}
