<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\UserResolver;
use Illuminate\Support\Facades\Auth;


class Bascula extends Model implements Auditable
{
	use \OwenIt\Auditing\Auditable;

    public static function resolveUserId()
    {
        return Auth::check() ? Auth::user()->getAuthIdentifier() : null;
    }
    
}
