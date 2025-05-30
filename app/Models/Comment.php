<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Comment extends Model
{
    use HasFactory;
    protected $fillable = ['post_id', 'user_id', 'body'];
    
    public function post()
    {
        return $this->belongsTo(Post::class);
    }

        public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}

