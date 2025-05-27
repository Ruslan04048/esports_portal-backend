<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\Rating;

class Post extends Model
{
    use HasFactory;
    protected $fillable = ['title', 'body', 'category', 'image'];

    public function comments()
    {
        return $this->hasMany(Comment::class);
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
