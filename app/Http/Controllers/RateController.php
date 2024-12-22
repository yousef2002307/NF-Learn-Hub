<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Rate;
use App\Repostories\RateRepo;
use App\Http\Resources\rateres;
use OpenApi\Annotations as OA;

/**
 * @group Rate
 * 
 * APIs for crud operation on rating student
 */
class RateController extends Controller
{
    /**
     * @OA\Get(
     *     path="/rates",
     *     summary="Get all rates",
     *     @OA\Response(
     *         response=200,
     *         description="List of rates"
     *     )
     * )
     */
    public function index()
    {
        $raterepo = (new RateRepo)->alldata();
      
        return  rateres::collection($raterepo);
    }

    /**
     * @OA\Post(
     *     path="/rates",
     *     summary="Create a new rate",
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="rate", type="integer"),
     *             @OA\Property(property="user_id", type="integer")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Rate created successfully"
     *     ),
     *     @OA\Response(
     *         response=422,
     *         description="Validation error"
     *     )
     * )
     */
    public function store(Request $request,RateRepo $rep)
    {
       $created =$rep->create($request->only(['rate','user_id'])); // means return this only from the request
      
       return
       new rateres($created);
   
    }


    /**
     * @OA\Get(
     *     path="/rates/{id}",
     *     summary="Get a rate by id",
     *     @OA\Parameter(
     *         in="path",
     *         name="id",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Rate found"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Rate not found"
     *     )
     * )
     */
    public function show(Rate $rate)
    {
       return $rate;
    }

    /**
     * @OA\Put(
     *     path="/rates/{id}",
     *     summary="Update a rate",
     *     @OA\Parameter(
     *         in="path",
     *         name="id",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="rate", type="integer")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Rate updated successfully"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Rate not found"
     *     ),
     *     @OA\Response(
     *         response=422,
     *         description="Validation error"
     *     )
     * )
     */
    public function update(Request $request, Rate $rate,RateRepo $rateRepo)
    {
       
        $updated =  $rateRepo->update($request->rate,$rate);
        if($updated){
            
        
        return new rateres($rate);
        }else{
            return response()->json([
                'message' => 'Rate not updated'
            ], 400);
        }
    }

    /**
     * @OA\Delete(
     *     path="/rates/{id}",
     *     summary="Delete a rate",
     *     @OA\Parameter(
     *         in="path",
     *         name="id",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=204,
     *         description="Rate deleted successfully"
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Rate not found"
     *     )
     * )
     */
    public function destroy(Rate $rate)
    {
        $bool = (new RateRepo)->deleterate($rate);
        if($bool){
            return response()->json([
                'message' => 'Rate deleted successfully'
            ]);
        }
        return response()->json([
            'message' => 'Rate not deleted'
        ]);
    }
}

