<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    protected $model = \App\Models\User::class;

    public function definition()
    {
        return [
            'name' => $this->faker->name(),
            'email' => $this->faker->unique()->safeEmail(),
            'role' => $this->faker->randomElement(['user', 'admin']),
            'email_verified_at' => now(),
            'password' => bcrypt('password'),
            'avatar' => 'avatars/default.png',
            'remember_token' => Str::random(10),
        ];
    }
}
