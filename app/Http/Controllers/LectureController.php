<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lecture;
use App\Models\Lesson;

class LectureController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $lectures = Lecture::all()->map(function($item){
        //     return [
        //         "lecture" => $item,
        //         "its lessons" => Lesson::where("lecture_id",$item->id)->get()
        //     ];
        // });
        $lectures = Lecture::all()->map(function($item){
           $lesson  = Lesson::where("lecture_id",$item->id)->first();
           if($lesson){
               return [
                   "lecture" => $item,
                   "poster" => $lesson->poster
               ];
           }
        });
        return response()->json($lectures);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "name" => "required",
            "description" => "required"
        ]);
        $lecture = Lecture::create($request->all());
        return response()->json(["message" => "success","lecture" => $lecture]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $lecture = Lecture::find($id);
        $lessons = Lesson::where("lecture_id",$id)->get();
        return response()->json(["lecture" => $lecture,"lessons" => $lessons]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            "name" => "required",
            "description" => "required"
        ]);
        $lecture = Lecture::find($id);
        $lecture->update($request->all());
        return response()->json(["message" => "success","lecture" => $lecture]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $lecture = Lecture::find($id);
        $lecture->delete();
        return response()->json(["message" => "success"]);
    }
}
