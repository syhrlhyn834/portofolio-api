<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\GalleryResource;
use App\Models\Gallery;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class GalleryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $galleries = Gallery::with('user', 'category')->when(request()->q, function($galleries) {
            $galleries = $galleries->where('title', 'like', '%'. request()->q . '%');
        })->latest()->paginate(5);

        //return with Api Resource
        return new GalleryResource(true, 'List Data Gallery', $galleries);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file'         => 'required|mimes:jpeg,jpg,png,webp,m4v,mp4,mov,asf,avi,wmv,m2ts,mkv',
            'title'         => 'required|unique:galleries',
            'category_id'   => 'required',
            'content'       => 'required',
            'description'   => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        //upload file
        $file = $request->file('file');
        $file->storeAs('public/galleries', $file->hashName());

        $gallery = Gallery::create([
            'file'       => $file->hashName(),
            'title'       => $request->title,
            'slug'        => Str::slug($request->title, '-'),
            'category_id' => $request->category_id,
            'user_id'     => auth()->guard('api')->user()->id,
            'content'     => $request->content,
            'description' => $request->description
        ]);

        $gallery->save();

        if($gallery) {
            //return success with Api Resource
            return new GalleryResource(true, 'Data gallery Berhasil Disimpan!', $gallery);
        }

        //return failed with Api Resource
        return new GalleryResource(false, 'Data gallery Gagal Disimpan!', null);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $gallery = Gallery::with('category')->whereId($id)->first();

        if($gallery) {
            //return success with Api Resource
            return new GalleryResource(true, 'Detail Data Gallery!', $gallery);
        }

        //return failed with Api Resource
        return new GalleryResource(false, 'Detail Data Gallery Tidak DItemukan!', null);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Gallery $gallery)
    {
        $validator = Validator::make($request->all(), [
            'title'         => 'required|unique:galleries,title,'.$gallery->id,
            'category_id'   => 'required',
            'content'       => 'required',
            'description'   => 'required',
            'file'  => 'nullable|mimes:jpeg,jpg,png,webp,m4v,mp4,mov,asf,avi,wmv,m2ts,mkv'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        //check file update
        if ($request->file('file')) {

            //remove old file
            Storage::disk('local')->delete('public/galleries/'.basename($gallery->file));

            //upload new file
            $file = $request->file('file');
            $file->storeAs('public/galleries', $file->hashName());

            $gallery->update([
                'file'       => $file->hashName(),
                'title'       => $request->title,
                'slug'        => Str::slug($request->title, '-'),
                'category_id' => $request->category_id,
                'user_id'     => auth()->guard('api')->user()->id,
                'content'     => $request->content,
                'description' => $request->description
            ]);

        }

        $gallery->update([
            'title'       => $request->title,
                'slug'        => Str::slug($request->title, '-'),
                'category_id' => $request->category_id,
                'user_id'     => auth()->guard('api')->user()->id,
                'content'     => $request->content,
                'description' => $request->description
        ]);

        $gallery->save();

        if($gallery) {
            //return success with Api Resource
            return new GalleryResource(true, 'Data Gallery Berhasil Diupdate!', $gallery);
        }

        //return failed with Api Resource
        return new GalleryResource(false, 'Data Gallery Gagal Disupdate!', null);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Gallery $gallery)
{
    try {
        // Remove file
        $fileDeleted = Storage::disk('local')->delete('public/galleries/' . basename($gallery->file));

        if (!$fileDeleted) {
            // Handle file deletion failure if necessary
            Log::error('Failed to delete file: ' . $gallery->file);
        }

        // Delete gallery record
        if ($gallery->delete()) {
            // Return success with Api Resource
            return new GalleryResource(true, 'Data Gallery Berhasil Dihapus!', null);
        } else {
            // Handle deletion failure if necessary
            Log::error('Failed to delete gallery record: ' . $gallery->id);
        }
    } catch (\Exception $e) {
        // Handle any exceptions that occurred
        Log::error('Exception occurred during deletion: ' . $e->getMessage());
        return new GalleryResource(false, 'Data Gallery Gagal Dihapus!', null);
    }

    // Default return if something goes wrong
    return new GalleryResource(false, 'Data Gallery Gagal Dihapus!', null);
}
}
