<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Cknow\Money\MoneyCast;

class Pemasukan extends Model
{
    use HasFactory;
    protected $table = 'pemasukan';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nominal',
        'tanggal',
        'kategori',
        'keterangan',
        'status'
    ];

    protected $appends = ['nama_kategori'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'nominal' => MoneyCast::class,
        'tanggal' => 'date:Y-m-d'
    ];

    /**
     * Ambil Nama kategori.
     *
     * @return string
     */
    public function getNamaKategoriAttribute()
    {
        switch ($this->kategori) {
            case 0:
                return "Gaji";
            case 1:
                return "Bonus";
            case 2:
                return "Tunai";
            case 3:
                return "Transfer";
            case 4:
                return "Special";

            default:
                return "Lain-lain";
        }
    }
}
