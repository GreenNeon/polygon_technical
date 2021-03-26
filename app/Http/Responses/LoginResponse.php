<?php

namespace App\Http\Responses;

use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;
use Laravel\Fortify\Contracts\LoginResponse as LoginResponseContract;

class LoginResponse implements LoginResponseContract
{

    /**
     * @param  $request
     * @return mixed
     */
    public function toResponse($request)
    {
        $role = Auth::user()->role;
        if($role != 'OR' && $role != 'SW') return redirect(RouteServiceProvider::HOME);
        return redirect(RouteServiceProvider::PROFILE);
    }
}
