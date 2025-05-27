<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class AdminUserController extends Controller
{
    public function index()
    {
        $users = User::select('id','name','email','role','avatar','banned')
                     ->get();
        return response()->json(['status'=>1,'data'=>$users]);
    }

    public function toggleBan(User $user)
    {
        $user->banned = !$user->banned;
        $user->save();
        return response()->json([
            'status' => 1,
            'message'=> $user->banned ? 'User banned' : 'User unbanned',
            'data'   => ['id'=>$user->id,'banned'=>$user->banned]
        ]);
    }

    public function show(User $user)
    {
        return response()->json(['status'=>1,'data'=>$user]);
    }
}
