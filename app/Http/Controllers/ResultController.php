<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Middleware\AdminMiddleware;
use App\Models\Result;
use Illuminate\Routing\Controller as BaseController;
/**
 * @group results endpoint
 * 
 * APIs for results
 */
class ResultController extends BaseController
{
 
    
       /**
     * @OA\Get(
     *     path="/results",
     *     summary="Get results",
     *     tags={"results"},
     *     @OA\Parameter(
     *         name="quiz_id",
     *         in="query",
     *         description="Quiz id",
     *         required=true,
     *         @OA\Schema(
     *             type="integer"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Resource Retrieved"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Resource Not Found"
     *     )
     * )
     */
    public function index(Request $request)
    {
        return Result::with("user")->where('quiz_id', $request->quiz_id)->get()->toArray() ?? response('Not Found', 404);
    }

    /**
     * @OA\Get(
     *     path="/results/{id}",
     *     summary="Get result by id",
     *     tags={"results"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="Result id",
     *         required=true,
     *         @OA\Schema(
     *             type="integer"
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Resource Retrieved"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Resource Not Found"
     *     )
     * )
     */
    public function show(string $id)
    {
        $que = Result::with("user")->find($id);
        if($que){
            return $que;
        }else{
            return response('Not Found', 404);
        }
    }

    /**
     * @OA\Post(
     *     path="/results",
     *     summary="Create a new result",
     *     tags={"results"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="user_id", type="integer", example="1"),
     *             @OA\Property(property="quiz_id", type="integer", example="1"),
     *             @OA\Property(property="score", type="integer", example="80")
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
            'user_id' => 'required | numeric | exists:users,id',
            'quiz_id' => 'required | numeric | exists:quizzes,id',
            "score" => 'required | numeric ',

        ]);
        //see if recored excist for this user and this quiz in result table
       if(Result::where('user_id', $request->user_id)->where('quiz_id', $request->quiz_id)->where("score",">","5")->exists()){
           return response('Not Found', 404);
       }
       if(Result::where('user_id', $request->user_id)->where('quiz_id', $request->quiz_id)->exists()){
           Result::where('user_id', $request->user_id)->where('quiz_id', $request->quiz_id)->delete();
       }
        return Result::create($request->all());
    }

    /**
     * @OA\Put(
     *     path="/results/{id}",
     *     summary="Update a result by id",
     *     tags={"results"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="Result id",
     *         required=true,
     *         @OA\Schema(
     *             type="integer"
     *         )
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="user_id", type="integer", example="1"),
     *             @OA\Property(property="quiz_id", type="integer", example="1"),
     *             @OA\Property(property="score", type="integer", example="80")
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
     *         description="Resource Not Found"
     *     )
     * )
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'user_id' => ' numeric | exists:users,id',
            'quiz_id' => ' numeric | exists:quizzes,id',
            "score" => ' numeric ',

        ]);
        $newque = Result::find($id);
        if($newque){
            $newque->update($request->all());
            return $newque;
        }else{
            return response('Not Found', 404);
        }
    }

    /**
     * @OA\Delete(
     *     path="/results/{id}",
     *     summary="Delete a result by id",
     *     tags={"results"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="Result id",
     *         required=true,
     *         @OA\Schema(
     *             type="integer"
     *         )
     *     ),
     *     @OA\Response(
     *         response=204,
     *         description="Resource Deleted"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Resource Not Found"
     *     )
     * )
     */
    public function destroy(string $id)
    {
        return Result::destroy($id);
    }
}
