<?php

return [
    'paths' => ['api/*', 'sanctum/csrf-cookie'],
    
    // Разрешаем нужные методы
    'allowed_methods' => ['*'], 
    
    // Разрешаем нужные источники
    'allowed_origins' => ['http://localhost:5173'], // Для Vite
    'allowed_origins_patterns' => [],
    
    // Разрешаем заголовки
    'allowed_headers' => ['*'], 
    
    // Экспонируем заголовки
    'exposed_headers' => [],
    
    // Кэшируем запросы (0 - отключено)
    'max_age' => 0,
    
    // Поддержка кук
    'supports_credentials' => true,
];

