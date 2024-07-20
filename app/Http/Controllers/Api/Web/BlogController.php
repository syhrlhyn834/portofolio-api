<?php

namespace App\Http\Controllers\Api\Web;

use App\Models\Blog;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\BlogResource;
use Illuminate\Support\Facades\Validator;

class BlogController extends Controller
{
    /**
     * index
     *
     * @return void
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
     * show
     *
     * @param  mixed $slug
     * @return void
     */
    public function show($slug)
    {
        $blog = Blog::with('user', 'category')->where('slug', $slug)->first();

        if($blog) {
            //return with Api Resource
            return new BlogResource(true, 'Detail Data Blog', $blog);
        }

        //return with Api Resource
        return new BlogResource(true, 'Detail Data Blog Tidak Ditemukan!', null);

    }

    /**
     * blogHomepage
     *
     * @return void
     */
    public function blogHomepage()
    {
        $blogs = Blog::with('user', 'category')->take(5)->latest()->get();

        //return with Api Resource
        return new BlogResource(true, 'List Data Blog Homepage', $blogs);
    }

    public function blogSidebar()
    {
        $blogs = Blog::orderBy('title', 'ASC')->get();

        //return with Api Resource
        return new BlogResource(true, 'List Data Blog Sidebar', $blogs);
    }


    /**
     * storeImageBlog
     *
     * @param  mixed $request
     * @return void
     */
    public function storeImageBlog(Request $request)
    {
        //upload new image
        $image = $request->file('upload');
        $image->storeAs('public/blog_images', $image->hashName());

        return response()->json([
            'url' => asset('storage/blog_images/'.$image->hashName())
        ]);
    }

}
