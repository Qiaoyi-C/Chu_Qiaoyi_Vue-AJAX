<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Console;


class ConsoleController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function getFeatures() {
         $authors = Feature::all();
         return response()->json($features);
     }
    
}
