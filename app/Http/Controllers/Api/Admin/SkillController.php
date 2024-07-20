<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Skill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\SkillResource;

class SkillController extends Controller
{
    public function index()
    {
        $skills = Skill::when(request()->q, function($skills) {
            $skills = $skills->where('description', 'like', '%'. request()->q . '%');
        })->latest()->paginate(5);

        //return with Api Resource
        return new SkillResource(true, 'List Data Skills', $skills);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'description' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png,webp,svg',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $image = $request->file('image');
        $image->storeAs('public/skills', $image->hashName());

        $skill = Skill::create([
            'description' => $request->description,
            'image' => $image->hashName(),
        ]);

        return new SkillResource(true, 'Data Skill Berhasil Disimpan!', $skill);
    }

    public function show($id)
    {
        $skill = Skill::find($id);
        if (!$skill) {
            return new SkillResource(false, 'Data Skill Tidak Ditemukan', null);
        }
        return new SkillResource(true, 'Detail Data Skill', $skill);
    }

    public function update(Request $request, $id)
{
    $skill = Skill::find($id);
    if (!$skill) {
        return new SkillResource(false, 'Data Skill Tidak Ditemukan', null);
    }

    $validator = Validator::make($request->all(), [
        'description' => 'required',
        'image' => 'nullable|image|mimes:jpeg,jpg,png,webp,svg',
    ]);

    if ($validator->fails()) {
        return response()->json($validator->errors(), 422);
    }

    // Only handle the image if it is present in the request
    if ($request->hasFile('image')) {
        // Delete old image
        Storage::disk('public')->delete('skills/' . basename($skill->image));

        // Store the new image
        $image = $request->file('image');
        $image->storeAs('public/skills', $image->hashName());

        // Update the image path in the model
        $skill->image = $image->hashName();
    }

    // Update other fields
    $skill->description = $request->description;
    $skill->save(); // Save the model after updates

    return new SkillResource(true, 'Data Skill Berhasil Diupdate!', $skill);
}


    public function destroy($id)
    {
        $skill = Skill::find($id);
        if (!$skill) {
            return new SkillResource(false, 'Data Skill Tidak Ditemukan', null);
        }

        Storage::disk('public')->delete('skills/' . basename($skill->image));
        $skill->delete();

        return new SkillResource(true, 'Data Skill Berhasil Dihapus!', null);
    }
}
