<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Response;
use Illuminate\Http\Request;
/**
 * @group responses endpoint
 * 
 * APIs for responses
 */
class ResponseController extends Controller
{
    /**
     * @OA\Get(
     *     path="/responses",
     *     summary="Get all responses",
     *     tags={"responses"},
     *     @OA\Parameter(
     *         description="quiz id",
     *         in="query",
     *         name="quiz_id",
     *         required=true,
     *         example=1,
     *         @OA\Schema(
     *             type="integer",
     *             format="int64"
     *         )
     *     ),
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

    public function index(Request $request)
    {
        return Response::where('quiz_id', $request->quiz_id)->get()->toArray() ?? response('Not Found', 404);
    }

    /**
     * @OA\Post(
     *     path="/responses",
     *     summary="Store a new response",
     *     tags={"responses"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="student_id", type="integer", example=1),
     *             @OA\Property(property="quiz_id", type="integer", example=1),
     *             @OA\Property(property="question_id", type="integer", example=1),
     *             @OA\Property(property="selected_answer_id", type="integer", example=1),
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

    public function store(Request $request)
    {
        $request->validate([
            'student_id' => 'required | numeric | exists:users,id',
            'quiz_id' => 'required | numeric | exists:quizzes,id',
            "question_id" => 'required | numeric | exists:questions,id',
            'selected_answer_id' => 'required | numeric | exists:answers,id',

        ]);
        return Response::create($request->all());
    }

    /**
     * @OA\Get(
     *     path="/responses/{id}",
     *     summary="Get a response",
     *     tags={"responses"},
     *     @OA\Parameter(
     *         description="response id",
     *         in="path",
     *         name="id",
     *         required=true,
     *         example=1,
     *         @OA\Schema(
     *             type="integer",
     *             format="int64"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Successful response"
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthorized"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Not Found"
     *     )
     * )
     */

    public function show(string $id)
    {
        $que = Response::find($id);
        if($que){
            return $que;
        }else{
            return response('Not Found', 404);
        }
    }

    /**
     * @OA\Put(
     *     path="/responses/{id}",
     *     summary="Update a response",
     *     tags={"responses"},
     *     @OA\Parameter(
     *         description="response id",
     *         in="path",
     *         name="id",
     *         required=true,
     *         example=1,
     *         @OA\Schema(
     *             type="integer",
     *             format="int64"
     *         )
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="student_id", type="integer", example=1),
     *             @OA\Property(property="quiz_id", type="integer", example=1),
     *             @OA\Property(property="question_id", type="integer", example=1),
     *             @OA\Property(property="selected_answer_id", type="integer", example=1),
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Resource Updated"
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Bad Request"
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthorized"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Not Found"
     *     )
     * )
     */

    public function update(Request $request, string $id)
    {
        $newque = Response::find($id);
        if($newque){
            $newque->update($request->all());
            return $newque;
        }else{
            return response('Not Found', 404);
        }
    }

    /**
     * @OA\Delete(
     *     path="/responses/{id}",
     *     summary="Delete a response",
     *     tags={"responses"},
     *     @OA\Parameter(
     *         description="response id",
     *         in="path",
     *         name="id",
     *         required=true,
     *         example=1,
     *         @OA\Schema(
     *             type="integer",
     *             format="int64"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Resource Deleted"
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Unauthorized"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Not Found"
     *     )
     * )
     */

    public function destroy(string $id)
    {
        return Response::destroy($id);
    }
}
