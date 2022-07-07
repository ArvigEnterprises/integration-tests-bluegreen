<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ZipController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api') -> except('index','show');
    }

    /**
     * Show the application dashboard.
     *
     *
     */
    public function index()
    {
        dd("Please Specify Zip Code");
    }

    public function show($zip_code)
    {
        $url = "http://".config('workshop.fake_api')."/api/zip/$zip_code";
        $info = file_get_contents($url);
        return response()->json($info);
    }
}
