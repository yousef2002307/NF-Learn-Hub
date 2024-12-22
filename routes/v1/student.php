<?php
use Illuminate\Support\Facades\Route;

use Laravel\Fortify\Http\Controllers\AuthenticatedSessionController;

use Laravel\Fortify\Http\Controllers\PasswordResetLinkController;

use Laravel\Fortify\RoutePath;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;
use Illuminate\Notifications\Notification;
use App\Http\Controllers\AttendController;
use App\Http\Controllers\RateController;
use App\Http\Controllers\AdminController;

use App\Http\Middleware\IsSub;

use App\Http\Controllers\AdminOnStudentOperationsController;
use App\Http\Controllers\AdminOnParentOperationsController;

use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\SuperAdminMiddleware;
use App\Models\User;

use App\Http\Middleware\ActiveMiddleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\ParentController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\AnsController;
use App\Http\Controllers\CodexController;
use App\Http\Controllers\LectureController;
use App\Models\Payment;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\ResponseController;
use App\Http\Controllers\ResultController;
use App\Models\Lesson;
use App\Models\Codex;
use App\Models\Quiz;
use App\Models\Result;
use App\Http\Controllers\VideoUploadController;
use App\Http\Controllers\viewsController;
use App\Models\Lecture;

Route::post('/upload', [VideoUploadController::class, 'upload'])->withoutMiddleware("auth:sanctum")->name('upload.video');
Route::post('/uploadinfo', [VideoUploadController::class, 'uploadembeded']);
Route::get("/rr",function(){
// return User::find(20)->code;
// $quiz = Quiz::find(1);
// $questions = $quiz->questions;
//  return $questions;
// $que = Aque::find(1);
// return $que->answers;
// return $que->quiz;
// return Code::find(1)->user;
 });//->middleware(IsSub::class)->name("rr");
Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout')->middleware(ActiveMiddleware::class);
// Route::get("/deletetoken",function(){
//     $user = Auth::user();
//     if (!$user) {
//         // Handle the case where the user is not authenticated
//         return response()->json(['message' => 'User not authenticated'], 401);
//     }

//     $token = $user->tokens()->delete();

//     // Return the token or store it for later use
//     return response()->json(['token' => 'token has been deleted']);
    
// });
Route::get("/hislesson/{lectureid}",[App\Http\Controllers\StudentController::class,"hislesson"])->middleware([ActiveMiddleware::class,IsSub::class]);
Route::get("/hislesson2/{lectureid}",[App\Http\Controllers\StudentController::class,"hislesson"]);
Route::post("/success",[App\Http\Controllers\StudentController::class,"success"])->middleware(ActiveMiddleware::class);
Route::post("/cancel",[App\Http\Controllers\StudentController::class,"cancel"])->middleware(ActiveMiddleware::class);
Route::get("/is_Subscribe",[App\Http\Controllers\StudentController::class,"is_Subscribe"])->middleware(ActiveMiddleware::class);
Route::get("/profile",[App\Http\Controllers\StudentController::class,"profiledata"])->middleware(ActiveMiddleware::class);
Route::get("/parentcode",[App\Http\Controllers\StudentController::class,"pcode"])->middleware(ActiveMiddleware::class);
Route::post("/generateparentcode",[App\Http\Controllers\StudentController::class,"gpcode"])->middleware(ActiveMiddleware::class);
Route::post("/regenerateparentcode",[App\Http\Controllers\StudentController::class,"rgpcode"])->middleware(ActiveMiddleware::class);
Route::get("/hisrate",[App\Http\Controllers\StudentController::class,"hisrate"])->middleware(ActiveMiddleware::class);
Route::get("/hisattend",[App\Http\Controllers\StudentController::class,"hisattend"])->middleware(ActiveMiddleware::class);
Route::post("/parentlogin",[ParentController::class,"login"])->withoutMiddleware("auth:sanctum");
Route::post("/getlast5rating",[ParentController::class,"getlast5rating"])->withoutMiddleware("auth:sanctum");
Route::post("/getlast5attendence",[ParentController::class,"getlast5attendence"])->withoutMiddleware("auth:sanctum");
Route::post("/getlast5result",[ParentController::class,"getlast5result"])->withoutMiddleware("auth:sanctum");

Route::post("/getpay",[ParentController::class,"getpay"])->withoutMiddleware("auth:sanctum");



//////////rating routes
Route::resource('rate', RateController::class)->middleware(ActiveMiddleware::class);
Route::resource('question', QuestionController::class)->except("update")->middleware([ActiveMiddleware::class]);
Route::post("/updatequestion/{id}",[QuestionController::class,"update"])->middleware([ActiveMiddleware::class]);
Route::resource('quiz', QuizController::class)->middleware([ActiveMiddleware::class]);
Route::resource('response', ResponseController::class)->middleware([ActiveMiddleware::class]);
Route::resource('result', ResultController::class)->middleware([ActiveMiddleware::class]);
Route::resource('ans', AnsController::class)->except("update")->middleware([ActiveMiddleware::class]);
Route::post("/updateans/{id}",[AnsController::class,"update"])->middleware([ActiveMiddleware::class]);
Route::resource('attend', AttendController::class)->middleware(ActiveMiddleware::class);

Route::resource('students', AdminOnStudentOperationsController::class)->middleware([ActiveMiddleware::class,AdminMiddleware::class]);


Route::resource('codex',CodexController::class)->middleware([ActiveMiddleware::class,AdminMiddleware::class]);



Route::post("/getallcodex",function(){
    try {
        $codexes = Codex::paginate(6);
        return response()->json(['success' => true, 'data' => $codexes], 200);
    } catch (\Exception $e) {
        return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
    }
})->withoutMiddleware("auth:sanctum");



Route::post("/payfree",function(){
Payment::create(['user_id' => Auth::user()->id, 'amount' => 0,"payment_transaction_id" => "free","payment_method"=>"free","payment_status"=>"Completed"]);
$userid = Auth::user()->id;
$user = User::find($userid);
$user->subscribe_at = now();
$user->save();
return response()->json(['success' => true, 'message' => "payment completed"], 200);

});


Route::resource('view', viewsController::class)->withoutMiddleware("auth:sanctum");
Route::resource('lecture', LectureController::class);

Route::resource('parent', AdminOnParentOperationsController::class)->middleware([ActiveMiddleware::class,AdminMiddleware::class]);
Route::get('/actdis/{id}',[AdminController::class,"actdis"])->middleware([ActiveMiddleware::class,AdminMiddleware::class]);

Route::get('/getstudentstatus/{id}',[AdminController::class,"actdis2"])->middleware([ActiveMiddleware::class,AdminMiddleware::class]);
Route::get('/getpaymentsrecored',[AdminController::class,"paymentsrecords"])->middleware([ActiveMiddleware::class,SuperAdminMiddleware::class]);

Route::get('/paymentstatus/{id}',[AdminController::class,"paymentstatus"])->middleware([ActiveMiddleware::class,AdminMiddleware::class]);
Route::get('/admlessonsid/{id}',[AdminController::class,"lessonsid"])->middleware([ActiveMiddleware::class,AdminMiddleware::class]);
Route::get('/admlessons',[AdminController::class,"lessons"])->middleware([ActiveMiddleware::class,AdminMiddleware::class]);
Route::get('/admlessonsy/{id}',[AdminController::class,"lessonsy"])->middleware([ActiveMiddleware::class,AdminMiddleware::class]);
//////fortify stuff

Route::get("/quizle/{id}",function($id){
    if(!Lesson::find($id)){
        return response()->json(['message' => 'lesson does not exist'], 401);
    }
    return response()->json(Lesson::find($id)->quiz) ;
});

Route::put("/user/profile-information",function(Request $request){
    // Get the authenticated user
    $user = Auth::user();

    // Validate the incoming request data
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
    ]);

    // Check if validation fails
    if ($validator->fails()) {
        return response()->json([
            'errors' => $validator->errors()
        ], 422); // Unprocessable Entity
    }

    // Update user's name and email
    $user->name = $request->name;
    $user->email = $request->email;
    $user->save();

    // Return a success response
    return response()->json([
        'message' => 'Profile updated successfully',
        'user' => $user
    ], 200); // OK
});


Route::put("/user/password",function(Request $request){
        // Get the authenticated user
        $user = Auth::user();

        // Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'current_password' => 'required|string',
            'password' => 'required|string|min:8|confirmed',
        ]);
    
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422); // Unprocessable Entity
        }
    
        // Check if the current password is correct
        if (!Hash::check($request->current_password, $user->password)) {
            return response()->json([
                'error' => 'Current password is incorrect.'
            ], 401); // Unauthorized
        }
    
        // Update the user's password
        $user->password = Hash::make($request->password);
        $user->save();
    
        // Return a success response
        return response()->json([
            'message' => 'Password updated successfully'
        ], 200); // OK
});





Route::post(RoutePath::for('password.email', '/forgot-password'), [PasswordResetLinkController::class, 'store'])
->middleware(['guest:'.config('fortify.guard')])
->name('password.email')->withoutMiddleware("auth:sanctum");

Route::post("/register",function(Request $request){
    // Validate the incoming request data
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
        "studyyear" => 'required'
    ]);

    // Check if validation fails
    if ($validator->fails()) {
        return response()->json([
            'errors' => $validator->errors()
        ], 422); // Unprocessable Entity
    }

    // Create a new user instance
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'studyyear' => $request->studyyear // Hash the password
    ]);
    $hashedemail =URL::temporarySignedRoute('verifemail', now()->addSeconds(30), ['id' => $user->id]); ;
  
    // Return a success response
    return response()->json([
        'message' => 'User registered successfully',
        'user' => $user
    ], 201); // Created
})->withoutMiddleware("auth:sanctum");




Route::post("/register2",function(Request $request){
    // Validate the incoming request data
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
        "studyyear" => 'required'
    ]);

    // Check if validation fails
    if ($validator->fails()) {
        return response()->json([
            'errors' => $validator->errors()
        ], 422); // Unprocessable Entity
    }

    // Create a new user instance
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'studyyear' => $request->studyyear, // Hash the password
        "is_active" => 0
    ]);
    $hashedemail =URL::temporarySignedRoute('verifemail', now()->addSeconds(30), ['id' => $user->id]); ;
  
    // Return a success response
    return response()->json([
        'message' => 'User registered successfully',
        'user' => $user
    ], 201); // Created
})->withoutMiddleware("auth:sanctum");

//get the lesseon before the lesson that its id in url

Route::get("/lastlesson/{id}",function($id){
//check of lesson with that id excist
if(!Lesson::find($id)){
    return response()->json(["success" => false,'message' => 'lesson does not exist'], 401);
}

//get the lesson before the lesson that its id in url


// $previousLesson = Lesson::whereHas('quiz', function($q) {
//     $q->orderBy('lesson_id', 'ASC');
// })->where('id', '<', $id)->first();

$previousLesson = Lesson::whereHas('quiz')->where('id', '<', $id)->orderBy('id', 'desc')->first();

// if($previousLesson->quiz){
//     return "yes";
// }else{
//     return "no";
// }
if(!$previousLesson){
    return response()->json(["success" => true,'message' => 'no lesson with quizzez before taht'], 200);
}else{

    $previousLesson = Lesson::whereHas('quiz')->where('id', '<', $id)->orderBy('id', 'desc')->first()->toArray();
}
// return response()->json($previousLesson);
// return Quiz::where("lesson_id",$previousLesson["id"])->get();
$quiz = Quiz::where("lesson_id",$previousLesson["id"])->first();
$ques = count($quiz->questions);

if(!$quiz){
    return response()->json(["success" => true,'message' => 'no quiz found associated with previous lesson'], 200);
}
$quizid = $quiz->id;    
$userid = Auth::user()->id;
$response = Result::where("user_id",$userid)->where("quiz_id",$quizid)->first();
if($response){
    if($response->score <= ($ques / 2)){
        return response()->json(["success" => false,'message' => 'you are a failure,re-take previous exam'], 401);
    }
    return response()->json(["success"=>true,"data"=>$response]);
}else{
    return response()->json(["success" => false,'message' => 'no result of quiz found associated with this user'], 401);
}

// return response()->json($quizid);

});


//get all students
Route::get("/allstudents",function(){
return User::with("rate")->where("is_admin",0)->where("is_super_admin",0)->where("is_parent",0)->orderBy("id","desc")->get();
});

//delete student
Route::delete("/delstu/{id}",function($id){
    $user = User::find($id);
    $user->delete();
    return response()->json(["success" => true,'message' => 'student deleted'], 200);
});
//update student
Route::put("/updstu/{id}",function(Request $request,$id){
    $user = User::find($id);
    $user->name = $request->name;
    $user->email = $request->email;
    $user->studyyear = $request->studyyear;
    
    $user->save();
    return response()->json(["success" => true,'message' => 'student updated'], 200);
});

// delete lesson
Route::delete("/lesson/{id}",function($id){
    $lesson = Lesson::find($id);
    $lesson->delete();
    return response()->json(["success" => true,'message' => 'lesson deleted'], 200);
});
//update lesson
Route::put("/updatelesson/{id}",function(Request $request,$id){
    $lesson = Lesson::find($id);
    $lesson->title = $request->title;
    $lesson->description = $request->description;
    $lesson->save();
    return response()->json(["success" => true,'message' => 'lesson updated'], 200);
});