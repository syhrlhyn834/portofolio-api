<?php

namespace App\Http\Controllers\Api\Web;

use App\Http\Controllers\Controller;
use App\Http\Resources\SosmedResource;
use App\Models\Sosmed;

class SosmedController extends Controller
{
    public function index()
    {
        $sosmeds = Sosmed::all();

        //return with Api Resource
        return new SosmedResource(true, 'List Data Sosmed', $sosmeds);
    }
}
