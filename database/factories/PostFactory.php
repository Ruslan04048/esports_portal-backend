<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class PostFactory extends Factory
{
     use HasFactory;
    protected $model = \App\Models\Post::class;

    public function definition()
    {
        return [
            'title' => $this->faker->sentence(),
            'body' => $this->faker->paragraphs(3, true),
            'category' => $this->faker->randomElement(['cs', 'dota']),
            'image' => 'https://picsum.photos/640/480?random=' . rand(1, 1000),
            'user_id' => User::factory(),
        ];
    }
}
