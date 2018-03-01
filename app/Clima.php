<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Support\Facades\Auth;

class Clima extends Model implements Auditable
{
    //
    //use Notifiable;
    use \OwenIt\Auditing\Auditable;
   
}
