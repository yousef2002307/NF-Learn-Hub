<?php
namespace App\Repostories;
use App\Models\User;
use App\Models\Rate;

use App\Helper\Functions\Functions;
use Illuminate\Support\Facades\DB;
class RateRepo
{
  public function alldata(){
    return Rate::all();
  }

  public function deleterate(Rate $rate){
    if( $rate->delete()){
        return true;
    }
    return false;
  }

  public function update( $input,Rate $rate){
    if( $rate->update([
        'rate' => $input,
        'created_at' => date('Y-m-d H:i:s'),
    ])){
        return true;
    }
    return false;
  }
  public function create($input){
    return DB::transaction(function () use ($input) {
    $created =  Rate::create([
        'rate' => $input['rate'],
        'user_id' => $input['user_id'],
       
    ]);
   
    return $created;
    });
  }
}