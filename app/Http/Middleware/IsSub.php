<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Helper\Functions\Functions;
use Illuminate\Support\Facades\Auth;
class IsSub
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $Functions = new Functions();
        if ($Functions->monthPassed(Auth::user()->subscribe_at)) {
            return response()->json(['message' => 'Not Subscribed'], 401);
        }
        return $next($request);
    }
}
