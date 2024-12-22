<?php


use Illuminate\Support\Facades\Route;

use App\Helper\Routes\RouteHelper;
Route::get('/user', function () {
    return 2;
})->middleware('auth:sanctum');

Route::prefix('v1')->middleware('auth:sanctum')->group(function () {
    RouteHelper::getRoutes(__DIR__ . '/../routes/v1');
 });
