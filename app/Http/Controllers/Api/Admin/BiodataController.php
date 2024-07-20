<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Biodata;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\BiodataResource;

class BiodataController extends Controller
{
    public function index()
    {
        $biodatas = Biodata::latest()->paginate(5);
        return new BiodataResource(true, 'Data Biodata', $biodatas);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'content' => 'required',
            'description' => 'required',
            'name' => 'required',
            'age' => 'required|integer',
            'from' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png,webp,svg',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $image = $request->file('image');
        $image->storeAs('public/biodatas', $image->hashName());

        $biodata = Biodata::create([
            'content' => $request->content,
            'description' => $request->description,
            'name' => $request->name,
            'age' => $request->age,
            'from' => $request->from,
            'image' => $image->hashName(),
        ]);

        return new BiodataResource(true, 'Data Biodata Berhasil Disimpan!', $biodata);
    }

    public function show($id)
    {
        $biodata = Biodata::find($id);
        if (!$biodata) {
            return new BiodataResource(false, 'Data Biodata Tidak Ditemukan', null);
        }
        return new BiodataResource(true, 'Detail Data Biodata', $biodata);
    }

    public function update(Request $request, $id)
    {
        $biodata = Biodata::find($id);
        if (!$biodata) {
            return new BiodataResource(false, 'Data Biodata Tidak Ditemukan', null);
        }

        $validator = Validator::make($request->all(), [
            'content' => 'required',
            'description' => 'required',
            'name' => 'required',
            'age' => 'required|integer',
            'from' => 'required',
            'image' => 'nullable|image|mimes:jpeg,jpg,png,webp,svg',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if ($request->file('image')) {
            Storage::disk('public')->delete('biodatas/' . basename($biodata->image));
            $image = $request->file('image');
            $image->storeAs('public/biodatas', $image->hashName());
            $biodata->image = $image->hashName();
        }

        $biodata->update([
            'content' => $request->content,
            'description' => $request->description,
            'name' => $request->name,
            'age' => $request->age,
            'from' => $request->from,
        ]);

        return new BiodataResource(true, 'Data Biodata Berhasil Diupdate!', $biodata);
    }

    public function destroy($id)
    {
        $biodata = Biodata::find($id);
        if (!$biodata) {
            return new BiodataResource(false, 'Data Biodata Tidak Ditemukan', null);
        }

        Storage::disk('public')->delete('biodatas/' . basename($biodata->image));
        $biodata->delete();

        return new BiodataResource(true, 'Data Biodata Berhasil Dihapus!', null);
    }
}
