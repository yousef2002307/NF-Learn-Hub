<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    use HasFactory;
    protected $table = 'answers';
protected $guarded = [];
    public function answers()
    {
        return $this->hasMany(\App\Models\Answer::class);
    }

    public function getImageAttribute($value)
    {
        return asset( $value);
    }

    public function setImageAttribute($value)
    {
        $this->attributes['image'] = 'images/' . $value;
    }
}
