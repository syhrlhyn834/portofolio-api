<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'name', 'slug', 'type'
    ];
/**
     * blogs
     *
     * @return void
     */
    public function blogs()
    {
        return $this->hasMany(Blog::class);
    }
    /**
     * galleries
     *
     * @return void
     */
    public function galleries()
    {
        return $this->hasMany(Gallery::class);
    }
}
