<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\UserResolver;
use Illuminate\Support\Facades\Auth;

class Clima extends Model implements Auditable
{
    //
    //use Notifiable;
    use \OwenIt\Auditing\Auditable;

    public static function resolveId()
    {
        return Auth::check() ? Auth::user()->getAuthIdentifier() : null;
    }
}
