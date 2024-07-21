<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Header extends Model
{
    use HasFactory;

    protected $fillable = [
        'title', 'name', 'image', 'image2'
    ];

    /**
     * Get the image attribute.
     *
     * @return \Illuminate\Database\Eloquent\Casts\Attribute
     */
    protected function image(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $this->makeHttpsUrl($value),
        );
    }

    /**
     * Get the image2 attribute.
     *
     * @return \Illuminate\Database\Eloquent\Casts\Attribute
     */
    protected function image2(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $this->makeHttpsUrl($value),
        );
    }

    /**
     * Make the URL use HTTPS.
     *
     * @param  string  $value
     * @return string
     */
    protected function makeHttpsUrl($value): string
    {
        $url = url('/storage/headers/' . $value);
        return str_replace('http://', 'https://', $url);
    }
}
