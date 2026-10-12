<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Employee extends Model
{
    protected $fillable = [
        'user_id',
        'first_name',
        'last_name',
        'gender',
        'birthday',
        'monthly_salary',
        'position',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
