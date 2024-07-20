<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\InboxResource;
use App\Models\Inbox;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class InboxController extends Controller
{
    public function index()
    {//get inbox
        $inboxes = Inbox::when(request()->q, function($inboxes) {
            $inboxes = $inboxes->where('name', 'like', '%'. request()->q . '%');
        })->latest()->paginate(10);

        //return with Api Resource
        return new InboxResource(true, 'List Data Inbox', $inboxes);
    }
public function store(Request $request)
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
        'message' => $request->message
    ]);

    return new InboxResource(true, 'Data Inbox Berhasil Disimpan!', $inbox);
}
public function show($id)
    {
        $inbox = Inbox::find($id);
        if (!$inbox) {
            return new InboxResource(false, 'Data inbox Tidak Ditemukan', null);
        }
        return new InboxResource(true, 'Detail Data Inbox', $inbox);
    }

    public function update(Request $request, $id)
    {
        $inbox = Inbox::find($id);
        if (!$inbox) {
            return new InboxResource(false, 'Data inbox Tidak Ditemukan', null);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'subject' => 'required',
            'message' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $inbox->update([
            'name' => $request->name,
            'email' => $request->email,
            'subject' => $request->subject,
            'message' => $request->message
        ]);

        return new InboxResource(true, 'Data inbox Berhasil Diupdate!', $inbox);
    }

    public function destroy($id)
    {
        $inbox = Inbox::find($id);
        if (!$inbox) {
            return new InboxResource(false, 'Data inbox Tidak Ditemukan', null);
        }


        $inbox->delete();

        return new InboxResource(true, 'Data inbox Berhasil Dihapus!', null);
    }
    public function markAsRead($id)
{
    try {
        $inbox = Inbox::findOrFail($id);
        $inbox->status = 'read';
        $inbox->save();

        return response()->json(['message' => 'Inbox marked as read'], 200);
    } catch (\Exception $e) {
        return response()->json(['error' => 'Error updating status'], 500);
    }
}
}
