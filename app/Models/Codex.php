<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Codex extends Model
{
    use HasFactory;
    protected $table = "codexes";
    protected $guarded = [];
}
