<?php

namespace App\Http\Controllers;

use App\Models\User;
use http\Client;
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

//        $client = new \GuzzleHttp\Client();
        try {
            $client = $request->create(
                config('service.passport.login_endpoint'),
                'POST'
            );
            $client->request->add([

                    "client_secret" => config('service.passport.client_secret'),
                    "grant_type" => "password",
                    "client_id" => config('service.passport.client_id'),
                    "username" => $request->email,
                    "password" => $request->password,

            ]);
            $response = app()->handle($client);
            return $response;
        }catch (\Exception $e){
            return response()->json(['status' => 'error', 'message'=>$e->getMessage()]);
        }
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

    public function logout(Request $request){
        try {
            auth()->user()->tokens()->each(function($token){
               $token->delete();
            });
            return response()->json(['status'=>'success', 'message'=>'logout success']);
        }catch (\Exception $e){
            return response()->json(['status'=>'error', 'message'=>$e->getMessage()]);
        }
    }
}
