<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
//use OwenIt\Auditing\Contracts\UserResolver;
use Illuminate\Support\Facades\Auth;


class Bascula extends Model implements Auditable
{
	use \OwenIt\Auditing\Auditable;

	//SI DESCOMENTO LA FUNCION DE ABAJO, SE SOBREESCRIBE LA FUNCION QUE DETERMINA COMO OBTENER EL ID QUE REALIZA UNA DETERMINADA ACCION
    /*public static function resolveUserId() {
        return Auth::check() ? Auth::user()->getAuthIdentifier() : null;
    }*/
    
}
