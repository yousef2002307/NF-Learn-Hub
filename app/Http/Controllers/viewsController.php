<?php

namespace App\Http\Controllers;

use App\Models\Lesson;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\View;

class viewsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    //get all views related to specicfic user
    public function index(Request $request)
    {
       $userid = $request->id;
       return User::find($userid)->viewedLessons()->get();
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
           "lesson_id" => "required",
           "user_id" => "required"
        ]);
        View::create($request->all());
        return response()->json([
            "message" => "success"
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Lesson::find($id)->viewers()->get();
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
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        View::find($id)->delete();
        return response()->json([
            "message" => "success"
        ]);
    }
}
