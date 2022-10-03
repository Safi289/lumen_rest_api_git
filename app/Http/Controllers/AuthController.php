<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $email = $request->email;
        $password = $request->password;

        if(empty($email) OR empty($password))
        {
            return response()->json(['status' => 'errpr', 'message' => 'you must fill all fields']);
        }

        $credentials = request(['email', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);

    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }

    public function register(Request $request)
    {
        $name = $request->name;
        $email = $request->email;
        $password = $request->password;

        if(empty($name) OR empty($email) OR empty($password))
        {
            return response()->json(['status' => 'errpr', 'message' => 'you must fill all fields']);
        }

        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            return response()->json(['status'=>'error', 'message'=>'valid email should given']);
        }
        if(strlen($password) < 8){
            return response()->json(['status'=>'error', 'message'=>'at least 8 char']);
        }

        if(User::where('email', $email)->exists()){
            return response()->json(['status'=>'error', 'message'=>'already has']);
        }
        try {
            $user = new User();

            $user->name = $name;
            $user->email = $email;
            $user->password = app('hash')->make($password);

            if($user->save()){
                return $this->login($request);
            }

        }catch (\Exception $e){
            return response()->json(['status'=>'error', 'message'=>$e->getMessage()]);
        }
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }
}
