<?php

namespace App\Http\Controllers;

use App\Models\Quiz;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use App\Http\Middleware\AdminMiddleware;
/**
 * @group Quiz endpoint
 * 
 * APIs for Quiz
 */
class QuizController extends BaseController
{
 
     public function __construct()
    {
        $this->middleware(AdminMiddleware::class)->only(['store', 'update', 'destroy']);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        /**
         * @OA\Get(
         *     path="/quizzes",
         *     summary="Get all quizzes",
         *     tags={"Quiz"},
         *     @OA\Response(
         *         response=200,
         *         description="Successful response"
         *     ),
         *     @OA\Response(
         *         response=401,
         *         description="Unauthorized"
         *     )
         * )
         */
        return Quiz::all();
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
        /**
         * @OA\Post(
         *     path="/quizzes",
         *     summary="Store a new quiz",
         *     tags={"Quiz"},
         *     @OA\RequestBody(
         *         required=true,
         *         @OA\JsonContent(
         *             type="object",
         *             @OA\Property(property="title", type="string", example="Quiz Title"),
         *             @OA\Property(property="description", type="string", example="Quiz Description")
         *         )
         *     ),
         *     @OA\Response(
         *         response=201,
         *         description="Resource Created"
         *     ),
         *     @OA\Response(
         *         response=400,
         *         description="Bad Request"
         *     ),
         *     @OA\Response(
         *         response=401,
         *         description="Unauthorized"
         *     )
         * )
         */
        $request->validate([
            'title' => 'required | string',
            'description' => 'required | string',
            "lesson_id" => 'required | exists:lessons,id|unique:quizzes,lesson_id'

        ]);
        // if(Quiz::where('lesson_id',$request->lesson_id)->first()){
        //    return response()->json(['message' => 'Quiz already exists for this lesson'], 409);
        // }
        return Quiz::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        /**
         * @OA\Get(
         *     path="/quizzes/{id}",
         *     summary="Get a quiz by id",
         *     tags={"Quiz"},
         *     @OA\Parameter(
         *         in="path",
         *         name="id",
         *         required=true,
         *         description="Quiz id",
         *         @OA\Schema(type="string")
         *     ),
         *     @OA\Response(
         *         response=200,
         *         description="Successful response"
         *     ),
         *     @OA\Response(
         *         response=404,
         *         description="Not Found"
         *     ),
         *     @OA\Response(
         *         response=401,
         *         description="Unauthorized"
         *     )
         * )
         */
        $que = Quiz::find($id);
        if($que){
          return $que;
        }else{
          return response('Not Found', 404);
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
        /**
         * @OA\Patch(
         *     path="/quizzes/{id}",
         *     summary="Update a quiz by id",
         *     tags={"Quiz"},
         *     @OA\Parameter(
         *         in="path",
         *         name="id",
         *         required=true,
         *         description="Quiz id",
         *         @OA\Schema(type="string")
         *     ),
         *     @OA\RequestBody(
         *         required=true,
         *         @OA\JsonContent(
         *             type="object",
         *             @OA\Property(property="title", type="string", example="Quiz Title"),
         *             @OA\Property(property="description", type="string", example="Quiz Description")
         *         )
         *     ),
         *     @OA\Response(
         *         response=200,
         *         description="Successful response"
         *     ),
         *     @OA\Response(
         *         response=400,
         *         description="Bad Request"
         *     ),
         *     @OA\Response(
         *         response=401,
         *         description="Unauthorized"
         *     )
         * )
         */
        $newque = Quiz::find($id);
       if($newque){
        $newque->update($request->all());
        return $newque;
       }else{
        return response('Not Found', 404);
       }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        /**
         * @OA\Delete(
         *     path="/quizzes/{id}",
         *     summary="Delete a quiz by id",
         *     tags={"Quiz"},
         *     @OA\Parameter(
         *         in="path",
         *         name="id",
         *         required=true,
         *         description="Quiz id",
         *         @OA\Schema(type="string")
         *     ),
         *     @OA\Response(
         *         response=204,
         *         description="Resource Deleted"
         *     ),
         *     @OA\Response(
         *         response=404,
         *         description="Not Found"
         *     ),
         *     @OA\Response(
         *         response=401,
         *         description="Unauthorized"
         *     )
         * )
         */
        return Quiz::destroy($id);
    }
}
