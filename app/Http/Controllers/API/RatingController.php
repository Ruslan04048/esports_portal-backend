<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Rating;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RatingController extends Controller
{


    public function rate(Request $request, Post $post)
    {
        $validator = Validator::make($request->all(), [
            'rating' => 'required|integer|min:1|max:5',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Заполните корректно поле rating (1–5).',
                'errors' => $validator->errors(),
            ], 422);
        }

        $user = $request->user();

        if ($user->id === $post->user_id) {
            return response()->json([
                'status' => 0,
                'message' => 'Вы не можете оценить собственный пост',
            ], 403);

        }
        $rating = Rating::where('post_id', $post->id)
            ->where('user_id', $user->id)
            ->first();

        if ($rating) {
            $rating->rating = $request->rating;
            $rating->save();
        } else {
            $rating = Rating::create([
                'post_id' => $post->id,
                'user_id' => $user->id,
                'rating' => $request->rating,
            ]);
        }

        $average = round($post->ratings()->avg('rating'), 1);
        $count = $post->ratings()->count();

        return response()->json([
            'status' => 1,
            'message' => 'Рейтинг сохранён',
            'data' => [
                'user_rating' => $rating->rating,
                'average_rating' => $average,
                'message' => ' Оценка сохранена',
                'rating_count' => $count,
            ],
        ], 200);
    }

    public function getRating(Post $post, Request $request)
    {
        $user = $request->user();
        $userRating = null;

        if ($user) {
            $existing = Rating::where('post_id', $post->id)
                ->where('user_id', $user->id)
                ->first();
            $userRating = $existing ? $existing->rating : null;
        }

        $average = round($post->ratings()->avg('rating'), 1);
        $count = $post->ratings()->count();

        return response()->json([
            'status' => 1,
            'data' => [
                'average_rating' => $average,
                'rating_count' => $count,
                'user_rating' => $userRating,
            ],
        ], 200);
    }
}
