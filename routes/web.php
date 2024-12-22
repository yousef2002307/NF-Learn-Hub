<?php

use Illuminate\Support\Facades\Route;

use Laravel\Fortify\RoutePath;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\OrderController;
use App\Models\Lesson;
// Route::get("/rr",function(){
//     return Lesson::find(4)->quiz;
// });
use App\Http\Controllers\VideoUploadController;
Route::get("/details/{videoId}",[VideoUploadController::class,'getVideoDetails']);
// use App\Http\Controllers\GoogleController;

// Route::get('google/redirect', [GoogleController::class, 'redirectToGoogle'])->name('google.redirect');
// Route::get('google/callback', [GoogleController::class, 'handleGoogleCallback'])->name('google.callback');

// Route::get("/v",function(){
//     dd(config('filesystems.disks'));

// });
// Route::get('/upload', [VideoUploadController::class, 'showUploadForm'])->name('upload.form');
Route::get("/sss",function(){
return view("red");
});
Route::post('/upload', [VideoUploadController::class, 'upload'])->name('upload.video');
Route::get('/callback', [OrderController::class, 'handleCallback']);
Route::get('/ubbergibberishwhizzlefoxtruploadotuplFlflimflamwombatwaffleboop/{id}', function ($id) {
    return view('upload',["id"=>$id]);
});
Route::get('/ubbergibberishwhizzlefoxtruploadotuplFlflimflamwombatwaffleboop', function () {
    return view('upload');
});
Route::get("/thank-you",function(){
    return view("thankyou");
});
Route::get('/emailverified', function () {
    return 'email verified successfully';
    
})->name("emailverified");
Route::get("/verifemail/{id}",function(Request $request,$id){
    if(!$request->hasValidSignature()){ // here to make sure no modification happen in url
        abort(404);
      }
    
    $user = User::find($id);
    $user->email_verified_at = now();
    $user->save();
    return redirect()->route('emailverified');
})->name('verifemail');
Route::get('/{any}', function(){
    return view("welcome");
})->where('any', '.*');

// Route::get('/{any}', function () {
//     return 22; // Assuming your main HTML file is named index.html
// })->where('any', '.*');
Route::get('/', function () {
    return '';
});

// Route::get(RoutePath::for('password.reset', '/reset-password/{token}'), [NewPasswordController::class, 'create'])
//     ->middleware(['guest:' . config('fortify.guard')])
//     ->name('password.reset');

Route::get(RoutePath::for('password.reset/{token}', '/reset-password/{token}'), function($token){
    return view('auth.reset-password',['token' => $token]);
})
    
    ->name('password.reset');
    Route::get('/generate-token', function () {
        $user = Auth::user();
        if (!$user) {
            // Handle the case where the user is not authenticated
            return response()->json(['message' => 'User not authenticated'], 401);
        }
    
        $token = $user->createToken('my-app')->plainTextToken;
    
        // Return the token or store it for later use
        return response()->json(['token' => $token]);
    });


Route::get("/deletetoken",function(){
    $user = Auth::user();
    if (!$user) {
        // Handle the case where the user is not authenticated
        return response()->json(['message' => 'User not authenticated'], 401);
    }

    $token = $user->tokens()->delete();

    // Return the token or store it for later use
    return response()->json(['token' => 'token has been deleted']);
    
});

Route::get("/test",function(){  
    $user = Auth::user();
    return $user;
    });
    Route::get("/newpass",function(){
       return view("red"); 
       
    });


    Route::get('/email', [App\Http\Controllers\EmailController::class, 'create']);
Route::post('/email', [App\Http\Controllers\EmailController::class, 'sendEmail'])->name('send.email');

Route::get("/verifemail/{id}",function(Request $request,$id){
    if(!$request->hasValidSignature()){ // here to make sure no modification happen in url
        abort(404);
      }
    
    $user = User::find($id);
    $user->email_verified_at = now();
    $user->save();
    return redirect("/");
})->name('verifemail');

// verify email


// Route::get('/register', [RegisteredUserController::class, 'create'])
//     ->middleware('guest')
//     ->name('register');
//     Route::get('/login', [AuthenticatedSessionController::class, 'create'])
//     ->middleware('guest')
//     ->name('login');

// Route::post('/login', [AuthenticatedSessionController::class, 'store'])
//     ->middleware('guest');

// Route::get('/register', [RegisteredUserController::class, 'create'])
//     ->middleware('guest')
//     ->name('register');

// Route::post('/register', [RegisteredUserController::class, 'store'])
//     ->middleware('guest');
// Route::post("/register",function(Request $request){
//     // Validate the incoming request data
//     $validator = Validator::make($request->all(), [
//         'name' => 'required|string|max:255',
//         'email' => 'required|string|email|max:255|unique:users',
//         'password' => 'required|string|min:8|confirmed',
//         "studyyear" => 'required'
//     ]);

//     // Check if validation fails
//     if ($validator->fails()) {
//         return response()->json([
//             'errors' => $validator->errors()
//         ], 422); // Unprocessable Entity
//     }

//     // Create a new user instance
//     $user = User::create([
//         'name' => $request->name,
//         'email' => $request->email,
//         'password' => Hash::make($request->password),
//         'studyyear' => $request->studyyear // Hash the password
//     ]);

//     // Return a success response
//     return response()->json([
//         'message' => 'User registered successfully',
//         'user' => $user
//     ], 201); // Created
// });
