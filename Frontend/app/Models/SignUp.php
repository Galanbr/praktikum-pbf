<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SignUp extends Model
{
    use HasFactory;

    protected $table = 'tb_signup';
    protected $primaryKey = 'nip';
    public $timesatamps = false;

    protected $fillable = [
        'nip',
        'nama_lengkap',
        'tahun_masuk',
        'email',
        'username',
        'pass',
    ];
}
