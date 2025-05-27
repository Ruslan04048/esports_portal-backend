<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Comment;
use Illuminate\Support\Facades\Validator;
use App\Models\User;


class CommentController extends Controller
{

    public function store(Request $request, Post $post)
    {

        $validator = Validator::make($request->all(), [
            'body' => 'required|string|max:1000',
        ]);

            $user = $request->user();

        if ($user->banned) {
            return response()->json([
                'status'  => 0,
                'message' => 'Вы забанены и не можете оставлять комментарии.',
            ], 403);
        }

        if ($validator->fails()) {
            return response()->json([
                'status'  => 0,
                'message' => 'Ошибка валидации',
                'errors'  => $validator->errors(),
            ], 422);
        }

        $comment = $post->comments()->create([
            'body'    => $request->body,
            'user_id' => $request->user()->id,
        ]);

        // Подгружаем автора
        $comment->load('user');

        $post->comments()->save($comment);

        return response()->json([
            'status'  => 1,
            'message' => 'Комментарий добавлен',
            'data'    => $comment,
        ], 201);
    }
    public function destroy($id)
    {
        $comment = Comment::findOrFail($id);

        if (auth()->user()->role !== 'admin') {
            return response()->json(['message' => 'Недостаточно прав'], 403);
        }

        $comment->delete();

        return response()->json(['message' => 'Комментарий удален']);
    }
}
