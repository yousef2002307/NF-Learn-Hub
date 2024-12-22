<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Codex;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;

class CodexController extends Controller
{
    /**
     * Display a listing of the resource.
     */
     /**
     * Display a listing of the resource.
     * 
     * @group Codex Management
     * @response 200 {
     *  "success": true,
     *  "data": {
     *      "current_page": 1,
     *      "data": [
     *          {
     *              "id": 1,
     *              "value": "Example Value",
     *              "amount": 10,
     *              "created_at": "2023-10-07T12:00:00.000000Z",
     *              "updated_at": "2023-10-07T12:00:00.000000Z"
     *          }
     *      ],
     *      "first_page_url": "http://example.com?page=1",
     *      "from": 1,
     *      "last_page": 1,
     *      "last_page_url": "http://example.com?page=1",
     *      "next_page_url": null,
     *      "path": "http://example.com",
     *      "per_page": 6,
     *      "prev_page_url": null,
     *      "to": 1,
     *      "total": 1
     *  }
     * }
     * @response 500 {
     *  "success": false,
     *  "message": "Server error message"
     * }
     */

    public function index(): JsonResponse
    {
        try {
            $codexes = Codex::paginate(6);
            return response()->json(['success' => true, 'data' => $codexes], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // Not needed for API-based controller
    }

    /**
     * Store a newly created resource in storage.
     */
    /**
     * Store a newly created resource in storage.
     * 
     * @group Codex Management
     * @bodyParam value string required The value of the codex. Example: Example Value
     * @bodyParam amount integer required The amount of the codex. Example: 10
     * @response 201 {
     *  "success": true,
     *  "data": {
     *      "id": 1,
     *      "value": "Example Value",
     *      "amount": 10,
     *      "created_at": "2023-10-07T12:00:00.000000Z",
     *      "updated_at": "2023-10-07T12:00:00.000000Z"
     *  }
     * }
     * @response 400 {
     *  "success": false,
     *  "errors": {
     *      "value": ["The value field is required."],
     *      "amount": ["The amount field is required."]
     *  }
     * }
     * @response 500 {
     *  "success": false,
     *  "message": "Server error message"
     * }
     */
    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'value' => 'required|string|max:255',
            'amount' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 400);
        }

        try {
            $codex = Codex::create($request->all());
            return response()->json(['success' => true, 'data' => $codex], 201);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    /**
     * Display the specified resource.
     * 
     * @group Codex Management
     * @urlParam id integer required The ID of the codex. Example: 1
     * @response 200 {
     *  "success": true,
     *  "data": {
     *      "id": 1,
     *      "value": "Example Value",
     *      "amount": 10,
     *      "created_at": "2023-10-07T12:00:00.000000Z",
     *      "updated_at": "2023-10-07T12:00:00.000000Z"
     *  }
     * }
     * @response 404 {
     *  "success": false,
     *  "message": "Resource not found"
     * }
     */
    public function show(string $id): JsonResponse
    {
        try {
            $codex = Codex::findOrFail($id);
            return response()->json(['success' => true, 'data' => $codex], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        // Not needed for API-based controller
    }

 /**
     * Update the specified resource in storage.
     * 
     * @group Codex Management
     * @urlParam id integer required The ID of the codex. Example: 1
     * @bodyParam value string The value of the codex. Example: Updated Value
     * @bodyParam amount integer The amount of the codex. Example: 20
     * @response 200 {
     *  "success": true,
     *  "data": {
     *      "id": 1,
     *      "value": "Updated Value",
     *      "amount": 20,
     *      "created_at": "2023-10-07T12:00:00.000000Z",
     *      "updated_at": "2023-10-07T12:00:00.000000Z"
     *  }
     * }
     * @response 400 {
     *  "success": false,
     *  "errors": {
     *      "value": ["The value field is required."],
     *      "amount": ["The amount field is required."]
     *  }
     * }
     * @response 500 {
     *  "success": false,
     *  "message": "Server error message"
     * }
     */
    public function update(Request $request, string $id): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'value' => 'sometimes|required|string|max:255',
            'amount' => 'sometimes|required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 400);
        }

        try {
            $codex = Codex::findOrFail($id);
            $codex->update($request->all());
            return response()->json(['success' => true, 'data' => $codex], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

 /**
     * Remove the specified resource from storage.
     * 
     * @group Codex Management
     * @urlParam id integer required The ID of the codex. Example: 1
     * @response 200 {
     *  "success": true,
     *  "message": "Resource deleted successfully"
     * }
     * @response 500 {
     *  "success": false,
     *  "message": "Server error message"
     * }
     */
    public function destroy(string $id): JsonResponse
    {
        try {
            $codex = Codex::findOrFail($id);
            $codex->delete();
            return response()->json(['success' => true, 'message' => 'Resource deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
}