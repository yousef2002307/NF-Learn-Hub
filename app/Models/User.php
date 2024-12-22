<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\Code;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\Rate;
use App\Models\Attendance;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\Result;
use App\Models\View;
use App\Models\Lesson;
class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable ;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'is_parent',
        'child_id',
        'studyyear',
        'is_active'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

     /**
     * Get the user associated with the User
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function code(): HasOne
    {
        return $this->hasOne(Code::class, 'user_id', 'id');
    }

    /**
     * Get all of the comments for the User
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rate(): HasMany
    {
        return $this->hasMany(Rate::class, 'user_id', 'id');
    }

    public function attendences(): HasMany
    {
        return $this->hasMany(Attendance::class, 'user_id', 'id');
    }
    public function payments(): HasMany
    {
        return $this->hasMany(Payment::class, 'user_id', 'id');
    }
    public function results() : HasMany
    {
        return $this->hasMany(Result::class);
    }
    public function viewedLessons()
    {
        return $this->hasMany(View::class);
    }

    /**
     * Get all the lessons the user has viewed directly.
     */
    public function lessons()
    {
        return $this->belongsToMany(Lesson::class, 'views', 'user_id', 'lesson_id')
                    ->withTimestamps();
    }
}
