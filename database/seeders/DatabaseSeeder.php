<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Post;
use App\Models\Comment;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // Создаем 10 пользователей
        $users = User::factory(10)->create();

        // Создаем 20 постов
        $posts = Post::factory(20)->create();

        // Для каждого поста создаем от 1 до 5 комментариев от случайных пользователей
        foreach ($posts as $post) {
            Comment::factory(rand(1, 5))->create([
                'post_id' => $post->id,
                'user_id' => $users->random()->id
            ]);
        }
    }
}
