<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Education;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\EducationResource;

class EducationController extends Controller
{
    public function index()
    {
        $educations = Education::when(request()->q, function($educations) {
            $educations = $educations->where('title', 'like', '%'. request()->q . '%');
        })->latest()->paginate(5);

        //return with Api Resource
        return new EducationResource(true, 'List Data educations', $educations);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'place' => 'required',
            'year' => 'required',
            'city' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $education = Education::create([
            'title' => $request->title,
            'place' => $request->place,
            'year' => $request->year,
            'city' => $request->city,
        ]);

        return new EducationResource(true, 'Data Education Berhasil Disimpan!', $education);
    }

    public function show($id)
    {
        $education = Education::find($id);
        if (!$education) {
            return new EducationResource(false, 'Data Education Tidak Ditemukan', null);
        }
        return new EducationResource(true, 'Detail Data Education', $education);
    }

    public function update(Request $request, $id)
    {
        $education = Education::find($id);
        if (!$education) {
            return new EducationResource(false, 'Data Education Tidak Ditemukan', null);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'place' => 'required',
            'year' => 'required',
            'city' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $education->update([
            'title' => $request->title,
            'place' => $request->place,
            'year' => $request->year,
            'city' => $request->city,
        ]);

        return new EducationResource(true, 'Data Education Berhasil Diupdate!', $education);
    }

    public function destroy($id)
    {
        $education = Education::find($id);
        if (!$education) {
            return new EducationResource(false, 'Data Education Tidak Ditemukan', null);
        }

        $education->delete();

        return new EducationResource(true, 'Data Education Berhasil Dihapus!', null);
    }
}
