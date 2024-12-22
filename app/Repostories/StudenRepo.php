<?php
namespace App\Repostories;
use App\Models\User;
use App\Models\Code;
use Carbon\Carbon;
use App\Helper\Functions\Functions;
use Illuminate\Support\Str;
use App\Models\Payment;
use App\Models\Lesson;
use GuzzleHttp\Psr7\Request;
use App\Http\Controllers\OrderController;

class StudenRepo
{
   public function success($userid){
    $user = User::find($userid);
    $Functions = new Functions();
   
    if (!$user) {
        // Handle the case where the user is not authenticated
        return response()->json(['message' => 'User not authenticated'], 401);
    }
    if( $user->subscribe_at && !$Functions->monthPassed($user->subscribe_at)){
        return response()->json(['message' => 'Already Subscribed'],409);
    }
    // if($user->subscribe_at == 0){
        
    // }
    // $user->subscribe_at = now();
    // $user->save();
    $payment = Payment::create(['user_id' => $userid, 'amount' => request('amount')]);

    return response()->json(["message" => "all good,continue",'url' => (new OrderController)->initiatePayment( $payment->id)], 200);
   }

   public function cancel($userid){
    $user = User::find($userid);
   
    if (!$user) {
        // Handle the case where the user is not authenticated
        return response()->json(['message' => 'User not authenticated'], 401);
    }
    if( !$user->subscribe_at){
        return response()->json(['message' => 'Already notSubscribed'], 401);
    }
    $user->subscribe_at = null;
    $user->save();
    return response()->json(['message' => 'Unsubscribed Successfully'], 200);
   }

   public function is_Subscribe($userid){
    $user = User::find($userid);
    $Functions = new Functions();
    if (!$user) {
        // Handle the case where the user is not authenticated
        return response()->json(['message' => 'User not authenticated'], 401);
    }
    if( $user->subscribe_at && !$Functions->monthPassed($user->subscribe_at)){
        return response()->json(['subscribed' => true], 200);
    }
    return response()->json(['subscribed' => false], 200);
   }

   public function profiledata($userid){
    $user = User::find($userid);
    if (!$user) {
        // Handle the case where the user is not authenticated
        return response()->json(['message' => 'User not authenticated'], 401);
    }
    return $user;
   }

   public function pcode($userid){
    $user = User::find($userid);
     if (!$user) {
//         // Handle the case where the user is not authenticated
       return response()->json(['message' => 'User not authenticated'], 401);
    }
   if($user->code){
    return $user->code;
   }
   return response()->json(['message' => 'parent code does not exist to this student'], 200);

   }


   public function gpcode($userid){
    $user = User::find($userid);
     if (!$user) {
//         // Handle the case where the user is not authenticated
       return response()->json(['message' => 'User not authenticated'], 401);
    }
   if($user->code){
    return $user->code;
   }else{
    $randomText = Str::random(12);
    $code = new Code();
    $code->user_id = $userid;
    $code->code = $randomText;
    $code->save();
    return $code; 
   }
   }


   
   public function rgpcode($userid){
    $user = User::find($userid);
     if (!$user) {
//         // Handle the case where the user is not authenticated
       return response()->json(['message' => 'User not authenticated'], 401);
    }
   
    $randomText = Str::random(12);
    $code = Code::where('user_id', $userid)->first();
    if($code){
    $code->user_id = $userid;
    $code->code = $randomText;
    $code->save();
    return $code; 
    }else{
        return response()->json(['message' => 'code does not exist for this student try to generate first'], 401);
    }
  
   }
   public function hisrate($userid){
    $user = User::find($userid);
    if (!$user) {   
        return response()->json(['message' => 'User not authenticated'], 401);
    }
    if(!count( $user->rate)){
        return response()->json(['message' => 'student has no rating yet'], 422);
    }
    return $user->rate()->orderBy('id', 'desc')->first();
}




public function hisattend($userid){
    $user = User::find($userid);
    if (!$user) {   
        return response()->json(['message' => 'User not authenticated'], 401);
    }
    if(!count( $user->attendences)){
        return response()->json(['message' => 'student has no rating yet'], 422);
    }
    return $user->attendences()->orderBy('id', 'desc')->get();
}

public function hislesson($userid,$lectureid){
    $user = User::find($userid);
    if (!$user) {   
        return response()->json(['message' => 'User not authenticated'], 401);
    }
   $useryear = $user->studyyear;
   return Lesson::with("quiz")->where("lecture_id", $lectureid)->where("study_year", $useryear)->orderBy('id', 'Asc')->cursor();
    // return $user->attendences()->orderBy('id', 'desc')->take(3)->get();
}
}