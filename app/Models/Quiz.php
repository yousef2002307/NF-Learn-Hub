<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\Lesson;
use App\Models\Aque;
use App\Models\Result;

class Quiz extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function results() : HasMany
    {
        return $this->hasMany(Result::class);
    }
    public function questions() : HasMany
    {
        return $this->hasMany(Aque::class, 'quiz_id', 'id');
    }
    public function lesson() : BelongsTo
    {
        return $this->belongsTo(Lesson::class);
    }
}
