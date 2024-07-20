<?php

namespace App\Http\Controllers\Api\Web;

use App\Models\Gallery;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\GalleryResource;
use Illuminate\Support\Facades\Validator;

class GalleryController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $galleries = Gallery::with('user', 'category')->when(request()->q, function($galleries) {
            $galleries = $galleries->where('title', 'like', '%'. request()->q . '%');
        })->latest()->paginate(100);

        //return with Api Resource
        return new GalleryResource(true, 'List Data Gallery', $galleries);
    }

    /**
     * show
     *
     * @param  mixed $slug
     * @return void
     */
    public function show($slug)
    {
        $gallery = Gallery::with('user', 'category')->where('slug', $slug)->first();

        if($gallery) {
            //return with Api Resource
            return new GalleryResource(true, 'Detail Data gallery', $gallery);
        }

        //return with Api Resource
        return new GalleryResource(true, 'Detail Data Gallery Tidak Ditemukan!', null);

    }


    /**
     * storeImageGallery
     *
     * @param  mixed $request
     * @return void
     */
    public function storeImageGallery(Request $request)
    {
        //upload new image
        $image = $request->file('upload');
        $image->storeAs('public/gallery_images', $image->hashName());

        return response()->json([
            'url' => asset('storage/gallery_images/'.$image->hashName())
        ]);
    }

}
