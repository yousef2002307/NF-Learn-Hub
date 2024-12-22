<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Laravel\Fortify\Http\Controllers\LogoutController as FortifyLogoutController;

class CustomLogoutController extends FortifyLogoutController
{
    public function logout(Request $request)
    {
        // Add your custom logic here before logging out the user

        $response = parent::logout($request);

        // Add your custom logic here after logging out the user

        return $response;
    }
}