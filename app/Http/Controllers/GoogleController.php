<?php

// namespace App\Http\Controllers;

// use Illuminate\Http\Request;
// use Google\Client as Google_Client;
// use Google\Service\Drive as Google_Service_Drive;
// class GoogleController extends Controller
// {
//     public function redirectToGoogle()
//     {
//         $client = new Google_Client();
//         $client->setClientId(env('GOOGLE_CLIENT_ID'));
//         $client->setClientSecret(env('GOOGLE_CLIENT_SECRET'));
//         $client->setRedirectUri(route('google.callback'));
//         $client->addScope(\Google\Service\Drive::DRIVE_FILE);

//         return redirect($client->createAuthUrl());
//     }

//     public function handleGoogleCallback(Request $request)
//     {
//         $client = new Google_Client();
//         $client->setClientId(env('GOOGLE_CLIENT_ID'));
//         $client->setClientSecret(env('GOOGLE_CLIENT_SECRET'));
//         $client->setRedirectUri(route('google.callback'));

//         // Fetch the access token using the authorization code returned in the query string
//         $token = $client->fetchAccessTokenWithAuthCode($request->code);

//         // Store the refresh token in the session or database
//         session(['google_refresh_token' => $token['refresh_token']]);

//         // Optionally, redirect the user or return a response
//         return redirect()->route('home')->with('success', 'Google authentication successful!');
//     }
// }
