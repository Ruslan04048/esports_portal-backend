<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Models\User;

class AuthController extends Controller
{

    public function register(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email', 
            'password' => 'required|string|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Ошибка валидации.',
                'data' => $validator->errors()
            ], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'role' => 'user',
        ]);


        $response = [];
            $response['token'] = $user->createToken("MyApp")->plainTextToken;
            $response['name'] = $user->name;
            $response['email'] = $user->email;
            $response['role'] = $user->role; 

            return response()->json([
                'status' => 1,
                'message' => 'Пользователь успешно создан.',
                'data' => $response
            ], 201);

        }


    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                "status" => 0,
                "message" => "Неправильный email или пароль.",
                "data" => null
            ], 401);
        }

        $response = [];
        $response['token'] = $user->createToken("MyApp")->plainTextToken;
        $response['name'] = $user->name;
        $response['email'] = $user->email;
        $response['role'] = $user->role;

        return response()->json([
            'status' => 1,
            'message' => 'Пользователь успешно авторизован.',
            'data' => $response
        ], 200);
    }
}
