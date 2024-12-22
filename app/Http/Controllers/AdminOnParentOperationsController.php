<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Resources\Parentcode;

/**
 * @group Admin operation on Parents
 *
 * APIs for admin operations on parent
 */
class AdminOnParentOperationsController extends Controller
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
     * "child_id": 1,
     * "study_year": 1 or 2 or 3 , // 1 = 1st year , 2 = 2nd year , 3 = 3rd year and these values are the only accepted vals
     * "is_subscribed": true ,
     * "is_parent": true,
     * "code": {
     * "id": 1,
     * "parent_id": 1,
     * "code": "Parent Code"
     * }
     * }
     * ]
     * }
     */
    public function index()
    {
        return User::all()->load('code');
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @response 200 {
     * "data": {
     * "id": 1,
     * "parent_id": 1,
     * "code": "Parent Code"
     * }
     * }
     * @response 404 {
     * "message": "User not found"
     * }
     */
    public function show(string $id)
    {
        $user = User::find($id);
        if(!$user){
            return response()->json(['message' => 'User not found'], 404);
        }
        if($user->code){
        return new Parentcode( $user->code);
        }else{
            return response()->json(['message' => 'No parent code found'], 404);
        }
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
        //
    }
}

