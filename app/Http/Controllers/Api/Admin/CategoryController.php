<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function index()
    {
        $searchQuery = request()->q;
        $type = request()->type; // mendapatkan type dari request

        $categories = Category::when($searchQuery, function($query) use ($searchQuery) {
            $query->where('name', 'like', '%' . $searchQuery . '%');
        })
        ->when($type, function($query) use ($type) {
            $query->where('type', $type);
        })
        ->latest()
        ->paginate(5);

        return new CategoryResource(true, 'List Data Categories', $categories);
    }

    public function store(Request $request)
    {
        // Generate slug from name
        $slug = Str::slug($request->name, '-');

        // validate the request
        $validator = Validator::make($request->all(), [
            'name' => [
                'required',
                function ($attribute, $value, $fail) use ($request) {
                    if (Category::where('name', $value)->where('type', $request->type)->exists()) {
                        $fail('The name has already been taken for the given type.');
                    }
                },
            ],
            'type' => 'required|in:blogs,galleries',
        ]);

        // Add a custom validation rule for the slug
        $validator->after(function ($validator) use ($slug, $request) {
            if (Category::where('slug', $slug)->where('type', $request->type)->exists()) {
                $validator->errors()->add('slug', 'The slug has already been taken for the given type.');
            }
        });

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // create category
        $category = Category::create([
            'name' => $request->name,
            'slug' => $slug,
            'type' => $request->type,
        ]);

        if ($category) {
            return new CategoryResource(true, 'Data Category Berhasil Disimpan!', $category);
        }

        return new CategoryResource(false, 'Data Category Gagal Disimpan!', null);
    }

    public function show($id)
    {
        $category = Category::find($id);

        if ($category) {
            return new CategoryResource(true, 'Detail Data Category!', $category);
        }

        return new CategoryResource(false, 'Detail Data Category Tidak Ditemukan!', null);
    }

    public function update(Request $request, Category $category)
    {
        // Generate slug from name
        $slug = Str::slug($request->name, '-');

        // validate the request
        $validator = Validator::make($request->all(), [
            'name' => [
                'required',
                function ($attribute, $value, $fail) use ($request, $category) {
                    if (Category::where('name', $value)->where('type', $request->type)->where('id', '!=', $category->id)->exists()) {
                        $fail('The name has already been taken for the given type.');
                    }
                },
            ],
            'type' => 'required|in:blogs,galleries',
        ]);

        // Add a custom validation rule for the slug
        $validator->after(function ($validator) use ($slug, $request, $category) {
            if (Category::where('slug', $slug)->where('type', $request->type)->where('id', '!=', $category->id)->exists()) {
                $validator->errors()->add('slug', 'The slug has already been taken for the given type.');
            }
        });

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // update category
        $category->update([
            'name' => $request->name,
            'slug' => $slug,
            'type' => $request->type,
        ]);

        if ($category) {
            return new CategoryResource(true, 'Data Category Berhasil Diupdate!', $category);
        }

        return new CategoryResource(false, 'Data Category Gagal Diupdate!', null);
    }

    public function destroy(Category $category)
    {
        if ($category->delete()) {
            return new CategoryResource(true, 'Data Category Berhasil Dihapus!', null);
        }

        return new CategoryResource(false, 'Data Category Gagal Dihapus!', null);
    }
}
