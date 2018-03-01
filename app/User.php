<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Contracts\UserResolver;
use Illuminate\Support\Facades\Auth;

class User extends \TCG\Voyager\Models\User implements Auditable, UserResolver
{
    use Notifiable;
    use \OwenIt\Auditing\Auditable;

    public static function resolveId() {
        return Auth::check() ? Auth::user()->getAuthIdentifier() : null;
    }
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

     public function friendsOfMine()
    {
        return $this->belongstoMany('App\User', 'friends', 'user_id', 'friend_id' );
    }
    public function friendsOf()
    {
        return $this->belongstoMany('App\User', 'friends', 'friend_id', 'user_id' );
    }
    public function friends(){
        return $this->friendsOfMine->merge($this->friendsOf);
    }
    


    /*public static function resolveUserId()
    {
        return Auth::check() ? Auth::user()->id : null;
    }*/
}
