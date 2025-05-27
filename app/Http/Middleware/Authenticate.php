<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Authenticate
{
    public function handle(Request $request, Closure $next)
    {
        // Проверка, авторизован ли пользователь
        if (!Auth::check()) {
            return response()->json(['message' => 'Не авторизован'], 401);
        }

        return $next($request);
    }
}
