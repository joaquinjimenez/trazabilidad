<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class ErrorUsuario extends Model
{
    protected $fillable= [ 'body', 'quien', 'estado'];
}
