<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Middleware\HandleCors;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // Регистрируем CORS глобально
        $this->app->make(Kernel::class)
            ->pushMiddleware(HandleCors::class);
    }
}
