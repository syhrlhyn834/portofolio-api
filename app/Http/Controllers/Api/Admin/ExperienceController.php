<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Experience;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\ExperienceResource;

class ExperienceController extends Controller
{
    public function index()
    {//get Experience
        $experiences = Experience::when(request()->q, function($experiences) {
            $experiences = $experiences->where('title', 'like', '%'. request()->q . '%');
        })->latest()->paginate(10);

        //return with Api Resource
        return new ExperienceResource(true, 'List Data Experience', $experiences);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'place' => 'required',
            'year' => 'required',
            'city' => 'required',
            'url' => 'nullable|url',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $experience = Experience::create([
            'title' => $request->title,
            'place' => $request->place,
            'year' => $request->year,
            'city' => $request->city,
            'url' => $request->url,
        ]);

        return new ExperienceResource(true, 'Data Experience Berhasil Disimpan!', $experience);
    }

    public function show($id)
    {
        $experience = Experience::find($id);
        if (!$experience) {
            return new ExperienceResource(false, 'Data Experience Tidak Ditemukan', null);
        }
        return new ExperienceResource(true, 'Detail Data Experience', $experience);
    }

    public function update(Request $request, $id)
    {
        $experience = Experience::find($id);
        if (!$experience) {
            return new ExperienceResource(false, 'Data Experience Tidak Ditemukan', null);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'place' => 'required',
            'year' => 'required',
            'city' => 'required',
            'url' => 'nullable|url',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $experience->update([
            'title' => $request->title,
            'place' => $request->place,
            'year' => $request->year,
            'city' => $request->city,
            'url' => $request->url,
        ]);

        return new ExperienceResource(true, 'Data Experience Berhasil Diupdate!', $experience);
    }

    public function destroy($id)
    {
        $experience = Experience::find($id);
        if (!$experience) {
            return new ExperienceResource(false, 'Data Experience Tidak Ditemukan', null);
        }

        $experience->delete();

        return new ExperienceResource(true, 'Data Experience Berhasil Dihapus!', null);
    }
}
