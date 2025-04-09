<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Console extends Model
{
    public function features() {
        return $this->hasMany(Feature::class, 'console_id');
    }
}
