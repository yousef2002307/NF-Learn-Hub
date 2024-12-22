<?php
namespace App\Helper\Functions;

use Carbon\Carbon;
class Functions{
    public function monthPassed($date){
        if(!$date) return true;

        $date = Carbon::parse($date);
        $now = Carbon::now();
        $diff = $now->diffInMonths($date);

        if($diff <= -1){
            return true;
        }else{
            return false;
        }
    }
}