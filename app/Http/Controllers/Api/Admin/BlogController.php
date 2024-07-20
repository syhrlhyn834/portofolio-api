<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Blog;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\BlogResource;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blogs = Blog::with('user', 'category')->when(request()->q, function($blogs) {
            $blogs = $blogs->where('title', 'like', '%'. request()->q . '%');
        })->latest()->paginate(5);

        //return with Api Resource
        return new BlogResource(true, 'List Data Blogs', $blogs);
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
            'image'         => 'required|image|mimes:jpeg,jpg,png,webp',
            'title'         => 'required|unique:blogs',
            'category_id'   => 'required',
            'content'       => 'required',
            'description'   => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        //upload image
        $image = $request->file('image');
        $image->storeAs('public/blogs', $image->hashName());

        $blog = Blog::create([
            'image'       => $image->hashName(),
            'title'       => $request->title,
            'slug'        => Str::slug($request->title, '-'),
            'category_id' => $request->category_id,
            'user_id'     => auth()->guard('api')->user()->id,
            'content'     => $request->content,
            'description' => $request->description
        ]);

        $blog->save();

        if($blog) {
            //return success with Api Resource
            return new BlogResource(true, 'Data Blog Berhasil Disimpan!', $blog);
        }

        //return failed with Api Resource
        return new BlogResource(false, 'Data Blog Gagal Disimpan!', null);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $blog = Blog::with('category')->whereId($id)->first();

        if($blog) {
            //return success with Api Resource
            return new BlogResource(true, 'Detail Data Blog!', $blog);
        }

        //return failed with Api Resource
        return new BlogResource(false, 'Detail Data Blog Tidak DItemukan!', null);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Blog $blog)
    {
        $validator = Validator::make($request->all(), [
            'title'         => 'required|unique:blogs,title,'.$blog->id,
            'category_id'   => 'required',
            'content'       => 'required',
            'description'   => 'required',
            'image'  => 'nullable|image|mimes:jpeg,jpg,png,webp'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        //check image update
        if ($request->file('image')) {

            //remove old image
            Storage::disk('local')->delete('public/blogs/'.basename($blog->image));

            //upload new image
            $image = $request->file('image');
            $image->storeAs('public/blogs', $image->hashName());

            $blog->update([
                'image'       => $image->hashName(),
                'title'       => $request->title,
                'slug'        => Str::slug($request->title, '-'),
                'category_id' => $request->category_id,
                'user_id'     => auth()->guard('api')->user()->id,
                'content'     => $request->content,
                'description' => $request->description
            ]);

        }

        $blog->update([
            'title'       => $request->title,
                'slug'        => Str::slug($request->title, '-'),
                'category_id' => $request->category_id,
                'user_id'     => auth()->guard('api')->user()->id,
                'content'     => $request->content,
                'description' => $request->description
        ]);

        $blog->save();

        if($blog) {
            //return success with Api Resource
            return new BlogResource(true, 'Data Blog Berhasil Diupdate!', $blog);
        }

        //return failed with Api Resource
        return new BlogResource(false, 'Data Blog Gagal Disupdate!', null);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Blog $blog)
    {
        //remove image
        Storage::disk('local')->delete('public/blogs/'.basename($blog->image));

        if($blog->delete()) {
            //return success with Api Resource
            return new BlogResource(true, 'Data Blog Berhasil Dihapus!', null);
        }

        //return failed with Api Resource
        return new BlogResource(false, 'Data Blog Gagal Dihapus!', null);
    }
}
