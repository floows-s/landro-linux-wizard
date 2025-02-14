<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Job extends Model {
    use hasFactory;
    protected $table = 'job_listings'; // Tells it to look for table job_listings, instead of jobs

    protected $fillable = ['title', 'salary']; // These property's are allowed to be mass filled, meaning they can be passed through and used with the create methode.


    public function employer() {
        return $this->belongsTo(Employer::class);
    }

    public function tags(){
        return $this->belongsToMany(Tag::class, foreignPivotKey: "job_listing_id");
    }
}
