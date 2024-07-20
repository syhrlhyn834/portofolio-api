<?php

namespace App\Http\Controllers\Api\Web;

use App\Http\Controllers\Controller;
use App\Http\Resources\BiodataResource;
use App\Models\Biodata;
use Illuminate\Http\Request;

class BiodataController extends Controller
{
    public function index()
    {
        $biodatas = Biodata::all();

        //return with Api Resource
        return new BiodataResource(true, 'Data Biodata', $biodatas);
    }
}
