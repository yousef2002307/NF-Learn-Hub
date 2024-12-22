<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddLessonIdToQuizzesTable extends Migration
{
    public function up()
    {
        Schema::table('quizzes', function (Blueprint $table) {
            $table->unsignedBigInteger('lesson_id')->nullable();  // Add lesson_id column
            $table->foreign('lesson_id')
                  ->references('id')
                  ->on('lessons')
                  ->onDelete('cascade')
                  ->onUpdate('cascade');
        });
    }

    public function down()
    {
        Schema::table('quizzes', function (Blueprint $table) {
            $table->dropForeign(['lesson_id']);  // Drop foreign key
            $table->dropColumn('lesson_id');     // Drop lesson_id column
        });
    }
}