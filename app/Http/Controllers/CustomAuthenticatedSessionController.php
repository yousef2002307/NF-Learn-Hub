<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Laravel\Fortify\Http\Controllers\AuthenticatedSessionController;
use App\Http\Responses\CustomLogoutResponse;

class CustomAuthenticatedSessionController extends AuthenticatedSessionController
{
    public function destroy(Request $request): CustomLogoutResponse
    {
        $this->guard()->logout();

        // Optionally, invalidate the session
        $request->session()->invalidate();

        // Optionally regenerate the session token
        $request->session()->regenerateToken();

        // Return the custom logout response
        return new CustomLogoutResponse();
    }
}
