<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Payment;
use App\Helper\Functions\Functions;
use App\Models\Lesson;
/**
 * @group Admin operations
 *
 * APIs for admin operations
 */
class AdminController extends Controller
{
   /**
     * Activate or deactivate a user
     * 
     * @response 200 {
     * "message": "User activated successfully"
     * }
     * @response 404 {
     * "message": "User not found"
     * }
     */
    public function actdis($id){
        $user = User::find($id);
        if(!$user) return response()->json(['message' => 'User not found'], 404);
        if($user->is_active == 1){
            $user->update(['is_active' => 0]);
            return response()->json(['message' => 'User deactivated successfully'], 200);
        }  else{
        
          $user->update(['is_active' => 1]);
          return response()->json(['message' => 'User activated successfully'], 200);
        }
    }


   /**
     * Get the status of a user
     * 
     * @response 200 {
     * "student_status": 1
     * }
     * @response 404 {
     * "message": "User not found"
     * }
     */
    public function actdis2($id){
        $user = User::find($id);
        if(!$user) return response()->json(['message' => 'User not found'], 404);
        return response()->json(['student_status' => $user->is_active], 200);
    }

    public function paymentsrecords(){

        return Payment::all()->load('user');
    }
    public function paymentstatus($id){
      $user = User::find($id);
      if(!$user) return response()->json(['message' => 'User not found'], 404);
      $Functions = new Functions();
      if( $user->subscribe_at && !$Functions->monthPassed($user->subscribe_at)){
       return response()->json(['message' => 'Subscribed'],200);
      }else{
       return response()->json(['message' => 'not subscribed'],200);
      }
  }




  public function lessons(){
  return Lesson::orderBy('id','desc')->get();
  }



  public function lessonsy($id){
    return Lesson::where("study_year",$id)->orderBy('id','desc')->get();
    }
  
  
    public function lessonsid($id){
      return Lesson::where("id",$id)->orderBy('id','desc')->get();
      }
   }