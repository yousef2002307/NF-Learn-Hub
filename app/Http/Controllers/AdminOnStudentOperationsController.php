<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Resources\Studentres;
/**
 * @group admin operation on students
 * 
 * APIs for crud operation on  students
 * here all crud(create edit delete ) students can be done
 */
class AdminOnStudentOperationsController extends Controller
{
    /**
     * Display a listing of the resource.
     * 
     * @response 200 {
     * "data": [
     * {
     * "id": 1,
     * "name": "John Doe",
     * "email": "john@example.com",
     * "studyyear": 1
     * }
     * ]
     * }
     */
    public function index()
    {
       return Studentres::collection( User::where('is_admin',0)->where('is_super_admin',0)->where('is_parent',0)->get());
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
     * 
     * @response 201 {
     * "message": "Student created successfully"
     * }
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     * 
     * @response 200 {
     * "data": {
     * "id": 1,
     * "name": "John Doe",
     * "email": "john@example.com",
     * "studyyear": 1
     * }
     * }
     * @response 404 {
     * "message": "Student not found"
     * }
     */
    public function show(string $id)
    {
        return new Studentres( User::find($id));
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
     * 
     * @response 200 {
     * "message": "Student updated successfully"
     * }
     * @response 404 {
     * "message": "Student not found"
     * }
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required',
            'studyyear' => 'required',
            'email' => 'required | email | unique:users',
            'password' => 'required',

        ]);
        $student = User::find($id);
        if(!$student){
            return response()->json([
                'message' => 'Student not found'
            ], 404);
        }
        $student->update($request->all());
        return new Studentres($student);
    }

    /**
     * Remove the specified resource from storage.
     * 
     * @response 200 {
     * "message": "Student deleted successfully"
     * }
     * @response 404 {
     * "message": "Student not found"
     * }
     */
    public function destroy(string $id)
    {
        $student = User::find($id);
        if(!$student){
            return response()->json([
                'message' => 'Student not found'
            ], 404);
        }
        $student->code()->delete();
        $student->delete();
        return response()->json([
            'message' => 'Student deleted successfully'
        ]);
    }
}

