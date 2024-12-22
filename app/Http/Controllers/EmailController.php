<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    public function create()
    {
        return view('email');
    }

    public function sendEmail(Request $request)
    {
        $request->validate([
         
          'subject' => 'required',
          'name' => 'required',
          'content' => 'required',
          'hisemail' => 'required|email'
        ]);

        $data = [
          'subject' => $request->subject,
          'name' => $request->name,
          // 'email' => "info@omarroshdy.com",
        'email' => "info@omarroshdy.com",
          "hisemail" => $request->hisemail,
          'content' => $request->content
        ];

        Mail::send('email-template', $data, function($message) use ($data) {
          $message->to($data['email'])
          ->subject($data['subject']);
        });

        return response()->json(['message' => 'Email has been sent']);
    }
}