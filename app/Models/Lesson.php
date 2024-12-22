<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\Quiz;
use App\Models\User;
use App\Models\View;
use App\Http\Controllers\VideoUploadController;
class Lesson extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'video_url',
        'video_id',
        'duration',
        'instructor_id',
        'category_id',
        'status',
        'study_year',
    ];

    public function quiz() : HasOne
    {
        return $this->hasOne(Quiz::class);
    }
    public function getPosterAttribute($value)
    {
        return asset( $value);
    }

    public function setPosterAttribute($value)
    {
        $this->attributes['poster'] = 'images/' . $value;
    }


     /**
     * Get all the users who viewed this lesson.
     */
    public function viewers()
    {
        return $this->hasMany(View::class);
    }

    /**
     * Get all the users who have viewed this lesson directly.
     */
    public function users()
    {
        return $this->belongsToMany(User::class, 'views', 'lesson_id', 'user_id')
                    ->withTimestamps();
    }
    public function getDurationAttribute($value)
    {
        $videocontroller = new VideoUploadController();
        $videoid = $videocontroller->extractVideoId($this->video_id);
        $duration = $videocontroller->getVideoDetails($videoid);
        return $duration;

      
    }
}
