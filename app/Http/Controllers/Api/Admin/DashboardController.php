<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Category;
use App\Models\Gallery;
use App\Models\Inbox;
use App\Models\Skill;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
   /**
     * index
     *
     * @return void
     */
    public function index()
    {
        $blogs      = Blog::count();
        $galleries   = Gallery::count();
        $categories = Category::count();
        $users      = User::count();
        $inboxes = Inbox::count();
        $skills = Skill::count();

        return response()->json([
            'success' => true,
            'message' => 'List Count Data Table',
            'data' => [
                'blogs'      => $blogs,
                'galleries'   => $galleries,
                'categories' => $categories,
                'users'      => $users,
                'inboxes'    => $inboxes,
                'skills'     => $skills
            ],
        ], 200);
    }
}
