<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Repostories\StudenRepo;
class LoginController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if ($user && Hash::check($request->password, $user->password)) {
            // $token = $user->tokens()->delete();
            // Generate an access token for the user
            $token = $user->createToken('YourAppName')->plainTextToken;
            $userid =$user->id;
            $repo = new StudenRepo();
            $user2 = $repo->gpcode($userid);
            return response()->json([
                'user' => $user,
                'access_token' => $token,
            ]);
        }

        return response()->json(['message' => 'Invalid credentials'], 401);
    }
}

