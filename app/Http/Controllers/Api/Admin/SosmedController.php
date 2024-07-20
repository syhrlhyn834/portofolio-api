<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\SosmedResource;
use App\Models\Sosmed;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SosmedController extends Controller
{
    public function index()
    {
        $query = Sosmed::query();

        // Filter by name or username
        if (request()->has('q')) {
            $query->where(function($query) {
                $query->where('name', 'like', '%' . request()->q . '%')
                      ->orWhere('username', 'like', '%' . request()->q . '%');
            });
        }

        $sosmeds = $query->latest()->paginate(5);

        // Return with Api Resource
        return new SosmedResource(true, 'List Data Sosmed', $sosmeds);
    }


    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'logo'    => 'required',
            'name'     => 'required|unique:sosmeds',
            'url'      => 'required|url',
            'username' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }


        $sosmed = Sosmed::create([
            'logo'    => $request->logo,
            'name'     => $request->name,
            'url'      => $request->url,
            'username' => $request->username
        ]);

        return new SosmedResource(true, 'Data Sosmed Berhasil Disimpan!', $sosmed);
    }

    public function show($id)
    {
        $sosmed = Sosmed::find($id);
        if (!$sosmed) {
            return new SosmedResource(false, 'Data Sosmed Tidak Ditemukan', null);
        }
        return new SosmedResource(true, 'Detail Data Sosmed', $sosmed);
    }

    public function update(Request $request, $id)
    {
        $sosmed = Sosmed::find($id);
        if (!$sosmed) {
            return new SosmedResource(false, 'Data Sosmed Tidak Ditemukan', null);
        }

        $validator = Validator::make($request->all(), [
            'logo'    => 'required',
            'name'     => 'required|unique:sosmeds,name,' . $sosmed->id,
            'url'      => 'required|url',
            'username' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $sosmed->update([
            'logo'     => $request->logo,
            'name'     => $request->name,
            'url'      => $request->url,
            'username' => $request->username
        ]);

        return new SosmedResource(true, 'Data Sosmed Berhasil Diupdate!', $sosmed);
    }

    public function destroy($id)
{
    $sosmed = Sosmed::find($id);
    if (!$sosmed) {
        return new SosmedResource(false, 'Data Sosmed Tidak Ditemukan', null);
    }

    $sosmed->delete(); // Menghapus data dari database

    return new SosmedResource(true, 'Data Sosmed Berhasil Dihapus!', null);
}

}
