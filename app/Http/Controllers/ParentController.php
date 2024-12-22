<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Code;
use App\Helper\Functions\Functions;
/**
 * @group parent endpoint
 * 
 * APIs for parent
 */
class ParentController extends Controller
{
    /**
 * Login user based on the provided code.
 *
 * This endpoint checks if a specific code exists in the database.
 *
 * @param \Illuminate\Http\Request $request
 * @return \Illuminate\Http\JsonResponse
 */
   public function login(Request $request){
    //the reqest consist of code
    $code2 = $request->code;
    $code = Code::where('code',$code2)->first();
 
    if($code){
        
        return response()->json(['message' => 'code found'], 200);
    }else{
        
        return response()->json(['message' => 'code not found'], 404);
    }
   }


   /**
     * Get the last 5 rating of the user that is associated with the provided code
     *
     * This endpoint gets the last 5 rating of a user that is associated with the provided code.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
   public function getlast5rating(Request $request){
    $code = $request->code;
    $code = Code::where('code',$code)->first();
    if(!$code){
        return response()->json(['message' => 'code not found'], 404);
    }
    $user = User::find($code->user_id);
    return $user->rate()->orderBy('id', 'desc')->take(5)->get();
   }
   /**
     * Get the last 5 attendence of the user that is associated with the provided code
     *
     * This endpoint gets the last 5 attendence of a user that is associated with the provided code.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
   public function getlast5attendence(Request $request){
    $code = $request->code;
    $code = Code::where('code',$code)->first();
    if(!$code){
        return response()->json(['message' => 'code not found'], 404);
    }
    $user = User::find($code->user_id);
    return $user->attendences()->orderBy('id', 'desc')->take(5)->get();
   }

   /**
     * Get the last 5 result of the user that is associated with the provided code
     *
     * This endpoint gets the last 5 result of a user that is associated with the provided code.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
   public function getlast5result(Request $request){
    $code = $request->code;
    $code = Code::where('code',$code)->first();
    if(!$code){
        return response()->json(['message' => 'code not found'], 404);
    }
    $user = User::find($code->user_id);
    return $user->results()->orderBy('id', 'desc')->take(5)->get();
   }

   /**
     * Check if the child of parent is subscribed
     *
     * This endpoint check if the user that is associated with the provided code is subscribed or not
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
   public function getpay(Request $request){
    $code = $request->code;
    $code = Code::where('code',$code)->first();
    if(!$code){
        return response()->json(['message' => 'code not found'], 404);
    }
    $user = User::find($code->user_id);
   $Functions = new Functions();
   if( $user->subscribe_at && !$Functions->monthPassed($user->subscribe_at)){
    return response()->json(['message' => 'Subscribed'],200);
   }else{
    return response()->json(['message' => 'not subscribed'],200);
   }
    
   }
}
