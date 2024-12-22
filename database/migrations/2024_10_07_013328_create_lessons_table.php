<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLessonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lessons', function (Blueprint $table) {
            $table->id(); // Auto-incrementing ID
            $table->string('title'); // Title of the lesson
            $table->text('description')->nullable(); // Description of the lesson
            $table->string('video_url'); // URL of the video
            $table->string('video_id'); // Unique identifier for the video
         
            $table->integer('duration')->nullable(); // Duration of the video in seconds
           
            $table->enum('status', ['active', 'inactive'])->default('active'); // Status of the lesson
            $table->integer('study_year'); // Academic year for the lesson

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lessons');
    }
}
