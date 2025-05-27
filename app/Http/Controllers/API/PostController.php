<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Http\Request;
use App\Models\Post;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use App\Models\Rating;
use App\Models\Comment;


class PostController extends Controller
{

    public function index(Request $request)
    {
        $category = $request->query('category');
        $posts = Post::with(['comments.user', 'ratings'])
            ->when($category, fn($query) => $query->where('category', $category))
            ->get();


        $data = $posts->map(fn($p) => [
            'id' => $p->id,
            'title' => $p->title,
            'category' => $p->category,
            'image' => $p->image,
            'created_at' => $p->created_at,
            'comments' => $p->comments,
            'comments_count' => $p->comments()->count(),
            'average_rating' => $p->average_rating,
            'rating_count' => $p->rating_count,
        ]);

        return response()->json([
            'status' => 1,
            'data' => ['data' => $data],
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string',
            'body' => 'required|string',
            'category' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Validation errors.',
                'data' => $validator->errors()->all()
            ], 422);
        }

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('uploads', 'public');
        }

        $post = Post::create([
            'title' => $request->title,
            'body' => $request->body,
            'category' => $request->category,
            'image' => $imagePath,
        ]);

        return response()->json([
            'status' => 1,
            'message' => 'Post created',
            'data' => $post
        ]);
    }

    public function show(Request $request, $id)
    {
        // Подтягиваем пост со всеми комментариями и их пользователями
        $post = Post::with([
            'comments' => function ($q) {
                $q->latest();      // новые комментарии сверху
            },
            'comments.user'    // связь user() в модели Comment
        ])
            ->find($id);

        if (!$post) {
            return response()->json([
                'status' => 0,
                'message' => 'Пост не найден',
                'data' => null
            ], 404);
        }

        return response()->json([
            'status' => 1,
            'message' => 'Пост загружен',
            'data' => $post
        ]);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string',
            'body' => 'required|string',
            'category' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Ошибки валидации .',
                'data' => $validator->errors()->all()
            ]);
        }

        $post = Post::find($id);

        if (!$post) {
            return response()->json([
                'status' => 0,
                'message' => 'Пост не найден',
                'data' => null
            ], 404);
        }

        if ($request->hasFile('image')) {
            if ($post->image && Storage::disk('public')->exists($post->image)) {
                Storage::disk('public')->delete($post->image);
            }
            $post->image = $request->file('image')->store('uploads', 'public');
        }

        $post->title = $request->title;
        $post->body = $request->body;
        $post->category = $request->category;
        $post->save();

        return response()->json([
            'status' => 1,
            'message' => 'Пост обновлён',
            'data' => $post
        ]);
    }

    public function destroy(Request $request, $id)
    {
        $post = Post::find($id);

        if (!$post) {
            return response()->json([
                'status' => 0,
                'message' => 'Пост не найден',
                'data' => null
            ], 404);
        }

        if ($post->image && Storage::disk('public')->exists($post->image)) {
            Storage::disk('public')->delete($post->image);
        }

        $post->delete();

        return response()->json([
            'status' => 1,
            'message' => 'Пост удален',
            'data' => null
        ]);
    }

    public function ratings(): HasMany
    {
        return $this->hasMany(Rating::class);
    }

    public function getAverageRatingAttribute(): float
    {
        if ($this->ratings()->count() === 0) {
            return 0.0;
        }
        // Округлим до одной цифры после запятой
        return round($this->ratings()->avg('rating'), 1);
    }

    public function getRatingCountAttribute(): int
    {
        return $this->ratings()->count();
    }
}
