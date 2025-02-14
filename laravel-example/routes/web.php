<?php

use Illuminate\Support\Facades\Route;
use App\Models\Job;




Route::get('/', function () {
    return view('home');
});

Route::get('/jobs', function (){
    $jobs = Job::all(); //Job::with('employer')->get(); // Eager loading, to prevent n+1 problem (get all employers in one qeury)
    return view('jobs', ["jobs" => $jobs]);
});

Route::get('/jobs/{id}', function ($id){
    $job = Job::find($id);
    return view('job', ["job" => $job]);
});


Route::get('/contact', function () {
    return view('contact');
});


