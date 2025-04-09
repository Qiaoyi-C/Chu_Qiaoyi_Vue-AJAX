<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Feature extends Model
{
    public function console()
    {
        return $this->belongsTo(Console::class); 
    }
}
