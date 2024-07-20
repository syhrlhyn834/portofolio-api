<?php

namespace App\Http\Controllers\Api\Web;

use App\Http\Controllers\Controller;
use App\Http\Resources\InboxResource;
use App\Models\Inbox;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class InboxController extends Controller
{
    public function storeInboxInboxes(Request $request)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required',
        'email' => 'required|email',
        'subject' => 'required',
        'message' => 'required'
    ]);
    if ($validator->fails()) {
        return response()->json($validator->errors(), 422);
    }

    $inbox = Inbox::create([
        'name' => $request->name,
        'email' => $request->email,
        'subject' => $request->subject,
        'message' => $request->message,
        'status' => 'pending'
    ]);

    return new InboxResource(true, 'Data Inbox Berhasil Disimpan!', $inbox);
}}
