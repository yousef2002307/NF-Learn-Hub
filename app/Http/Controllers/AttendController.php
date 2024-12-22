<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Resources\Attendres;
/**
 * @group attendence
 * 
 * APIs for crud operation on  student attendence
 */
class AttendController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return  Attendres::collection( Attendance::all());
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
            'attendance_date' => 'required|date',
            'user_id' => 'required',
            'present' => 'required|boolean',
        ]);

        return new Attendres(Attendance::create($request->all()));
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return User::with('attendences')->find($id);
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
            'attendance_date' => 'required|date',
            'user_id' => 'required',
            'present' => 'required|boolean',
        ]);
        $attendence = Attendance::find($id);
        $attendence->update($request->all());
        return new Attendres($attendence);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $attendence = Attendance::find($id);
        $attendence->delete();
        return response()->json([
            'message' => 'Attendence deleted successfully'
        ]);
    }
}
