<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Laravel\Fortify\Contracts\CreatesNewUsers;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array<string, string>  $input
     */
    public function create(array $input): User 
    {
        Validator::make($input, [
            'name' => ['required', 'string', 'max:255'],
            // 'is_parent' => ['required', 'boolean'],
            // 'child_id' => ['nullable', 'numeric','unique:users,child_id'],
            'studyyear' => ['required', 'numeric', 'min:1', 'max:4'],
            'email' => [
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique(User::class),
            ],
            'password' => $this->passwordRules(),
        ])->validate();
           
        return User::create([
            'name' => $input['name'],
            // "is_parent" => isset($input['is_parent']) ? $input['is_parent'] : null,
            // "child_id" => isset($input['child_id']) && $input['is_parent'] ? $input['child_id'] : null,
            'studyyear' =>  isset($input['studyyear']) ? $input['studyyear'] : null,
            'email' => $input['email'],
            'password' => Hash::make($input['password']),
        ]);
    
    }
}
