<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\ContactResource;

class ContactController extends Controller
{
    public function index()
    {
        $contacts = Contact::latest()->paginate(5);
        return new ContactResource(true, 'Data Contacts', $contacts);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'description' => 'required',
            'location' => 'required',
            'number' => 'required|numeric',
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $contact = Contact::create([
            'name' => $request->name,
            'description' => $request->description,
            'location' => $request->location,
            'number' => $request->number,
            'email' => $request->email,
        ]);

        return new ContactResource(true, 'Data Contact Berhasil Disimpan!', $contact);
    }

    public function show($id)
    {
        $contact = Contact::find($id);
        if (!$contact) {
            return new ContactResource(false, 'Data Contact Tidak Ditemukan', null);
        }
        return new ContactResource(true, 'Detail Data Contact', $contact);
    }

    public function update(Request $request, $id)
    {
        $contact = Contact::find($id);
        if (!$contact) {
            return new ContactResource(false, 'Data Contact Tidak Ditemukan', null);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'description' => 'required',
            'location' => 'required',
            'number' => 'required|numeric',
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $contact->update([
            'name' => $request->name,
            'description' => $request->description,
            'location' => $request->location,
            'number' => $request->number,
            'email' => $request->email,
        ]);

        return new ContactResource(true, 'Data Contact Berhasil Diupdate!', $contact);
    }

    public function destroy($id)
    {
        $contact = Contact::find($id);
        if (!$contact) {
            return new ContactResource(false, 'Data Contact Tidak Ditemukan', null);
        }

        $contact->delete();

        return new ContactResource(true, 'Data Contact Berhasil Dihapus!', null);
    }
}
