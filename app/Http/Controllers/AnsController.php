<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use App\Http\Middleware\AdminMiddleware;
use App\Models\Answer;
/**
 * @group answer endpoint
 * 
 * APIs for answer
 */
class AnsController extends BaseController
{


     public function __construct()
    {
        $this->middleware(AdminMiddleware::class)->only(['store', 'update', 'destroy']);
    }
        /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        /**
         * @OA\Get(
         *     path="/answer",
         *     summary="Get answers",
         *     description="Get answers by question id",
         *     operationId="getAnswers",
         *     tags={"answer"},
         *     @OA\Parameter(
         *         description="question id",
         *         in="query",
         *         name="question_id",
         *         required=true,
         *         example="1",
         *         @OA\Schema(
         *             type="integer",
         *             format="int64"
         *         )
         *     ),
         *     @OA\Response(
         *         response=200,
         *         description="successful operation"
         *     ),
         *     @OA\Response(
         *         response=404,
         *         description="Not Found"
         *     )
         * )
         */
        return Answer::where('question_id', $request->question_id)->get()->toArray() ?? response('Not Found', 404);
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
            'answer_text' => 'nullable | string',
            'question_id' => 'required | numeric | exists:questions,id',
            "is_correct" => 'required | boolean',
            "image" => "nullable | image"

        ]);
        if ($request->hasFile('image')) {
            $imagePath = time().'.'.$request->image->extension();  
            $request->image->move(public_path('images'), $imagePath);
            
        }
        return Answer::create(["answer_text" => $request->answer_text ?? null , "question_id" => $request->question_id,"is_correct" => $request->is_correct,"image" =>  $request->image ?$imagePath : null]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        /**
         * @OA\Get(
         *     path="/answer/{id}",
         *     summary="get answer by id",
         *     description="get answer by id",
         *     operationId="getAnswerById",
         *     tags={"answer"},
         *     @OA\Parameter(
         *         description="answer id",
         *         in="path",
         *         name="id",
         *         required=true,
         *         example="1",
         *         @OA\Schema(
         *             type="integer",
         *             format="int64"
         *         )
         *     ),
         *     @OA\Response(
         *         response=200,
         *         description="successful operation"
         *     ),
         *     @OA\Response(
         *         response=404,
         *         description="Not Found"
         *     )
         * )
         */
        $que = Answer::find($id);
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
       
        $request->validate([
            'answer_text' => 'nullable | string',
            'question_id' => 'required | numeric | exists:questions,id',
            "is_correct" => 'required | boolean',
            "image" => "nullable | image"

        ]);
        if ($request->hasFile('image')) {
            $imagePath = time().'.'.$request->image->extension();  
            $request->image->move(public_path('images'), $imagePath);
            
        }
        $answer = Answer::find($id);
        return $answer::find($id)->update(["answer_text" => $request->answer_text ?? null , "question_id" => $request->question_id,"is_correct" => $request->is_correct,"image" =>  $request->image ?$imagePath : null]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        /**
         * @OA\Delete(
         *     path="/answer/{id}",
         *     summary="delete answer",
         *     description="delete answer",
         *     operationId="deleteAnswer",
         *     tags={"answer"},
         *     @OA\Parameter(
         *         description="answer id",
         *         in="path",
         *         name="id",
         *         required=true,
         *         example="1",
         *         @OA\Schema(
         *             type="integer",
         *             format="int64"
         *         )
         *     ),
         *     @OA\Response(
         *         response=204,
         *         description="No Content"
         *     ),
         *     @OA\Response(
         *         response=404,
         *         description="Not Found"
         *     )
         * )
         */
        return Answer::destroy($id);
    }
}
