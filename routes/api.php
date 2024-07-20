<?php

use Illuminate\Support\Facades\Route;

//group route with prefix "admin"
Route::prefix('admin')->group(function () {

    //route login
    Route::post('/login', [App\Http\Controllers\Api\Admin\LoginController::class, 'index']);

    //group route with middleware "auth"
    Route::group(['middleware' => 'auth:api'], function() {

        //data user
        Route::get('/user', [App\Http\Controllers\Api\Admin\LoginController::class, 'getUser']);

        //refresh token JWT
        Route::get('/refresh', [App\Http\Controllers\Api\Admin\LoginController::class, 'refreshToken']);

        //logout
        Route::post('/logout', [App\Http\Controllers\Api\Admin\LoginController::class, 'logout']);

        //User
        Route::apiResource('/users', App\Http\Controllers\Api\Admin\UserController::class);

        //Category
        Route::apiResource('/categories', App\Http\Controllers\Api\Admin\CategoryController::class);

        //Footer
        Route::apiResource('/footers', App\Http\Controllers\Api\Admin\FooterController::class);

        //Sosmed
        Route::apiResource('/sosmeds', App\Http\Controllers\Api\Admin\SosmedController::class);

        //Header
        Route::apiResource('/headers', App\Http\Controllers\Api\Admin\HeaderController::class);

        //Gallery
        Route::apiResource('/galleries', App\Http\Controllers\Api\Admin\GalleryController::class);

        //Blog
        Route::apiResource('/blogs', App\Http\Controllers\Api\Admin\BlogController::class);

        //Biodata
        Route::apiResource('/biodatas', App\Http\Controllers\Api\Admin\BiodataController::class);

        //Contact
        Route::apiResource('/contact', App\Http\Controllers\Api\Admin\ContactController::class);

        //Education
        Route::apiResource('/educations', App\Http\Controllers\Api\Admin\EducationController::class);

        //Experience
        Route::apiResource('/experiences', App\Http\Controllers\Api\Admin\ExperienceController::class);

        //Inboxes
        Route::apiResource('/inboxes', App\Http\Controllers\Api\Admin\InboxController::class);

        //Skill
        Route::apiResource('/skills', App\Http\Controllers\Api\Admin\SkillController::class);

        Route::get('/dashboard', [App\Http\Controllers\Api\Admin\DashboardController::class, 'index']);

        Route::put('/inboxes/{id}/read', [App\Http\Controllers\Api\Admin\InboxController::class, 'markAsRead']);




    });
});

    //group route with prefix "web"
    Route::prefix('web')->group(function () {

       //index categories
Route::get('/categories', [App\Http\Controllers\Api\Web\CategoryController::class, 'index']);

//show category
Route::get('/categories/{slug}', [App\Http\Controllers\Api\Web\CategoryController::class, 'show']);

//categories sidebar
Route::get('/categorySidebar', [App\Http\Controllers\Api\Web\CategoryController::class, 'categorySidebar']);

//index blogs
Route::get('/blogs', [App\Http\Controllers\Api\Web\BlogController::class, 'index']);

//show blogs
Route::get('/blogs/{slug}', [App\Http\Controllers\Api\Web\BlogController::class, 'show']);

//blogs homepage
Route::get('/blogHomepage', [App\Http\Controllers\Api\Web\BlogController::class, 'blogHomepage']);

//blogs homepage
Route::get('/blogSidebar', [App\Http\Controllers\Api\Web\BlogController::class, 'blogSidebar']);


//store image
Route::post('/blogs/storeImage', [App\Http\Controllers\Api\Web\BlogController::class, 'storeImageBlog']);

//index galleries
Route::get('/galleries', [App\Http\Controllers\Api\Web\GalleryController::class, 'index']);

//show galleries
Route::get('/galleries/{slug}', [App\Http\Controllers\Api\Web\GalleryController::class, 'show']);


//store image
Route::post('/galleries/storeImage', [App\Http\Controllers\Api\Web\GalleryController::class, 'storeImageGallery']);

//index headers
Route::get('/headers', [App\Http\Controllers\Api\Web\HeaderController::class, 'index']);

//index footers
Route::get('/footers', [App\Http\Controllers\Api\Web\FooterController::class, 'index']);

//index sosmeds
Route::get('/sosmeds', [App\Http\Controllers\Api\Web\SosmedController::class, 'index']);

//index biodatas
Route::get('/biodatas', [App\Http\Controllers\Api\Web\BiodataController::class, 'index']);

//index contact
Route::get('/contact', [App\Http\Controllers\Api\Web\ContactController::class, 'index']);

//index Experience
Route::get('/experiences', [App\Http\Controllers\Api\Web\ExperienceController::class, 'index']);

//index education
Route::get('/educations', [App\Http\Controllers\Api\Web\EducationController::class, 'index']);

//index skill
Route::get('/skills', [App\Http\Controllers\Api\Web\SkillController::class, 'index']);

//Index Inboxes
Route::post('/inboxes/storeInbox', [App\Http\Controllers\Api\Web\InboxController::class, 'storeInboxInboxes']);


    });
