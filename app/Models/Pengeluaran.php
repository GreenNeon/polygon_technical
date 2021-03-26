<?php

namespace App\Models;

use Cknow\Money\MoneyCast;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengeluaran extends Model
{
    use HasFactory;
    protected $table = 'pengeluaran';
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
            case 5:
                return "Listrik";
            case 6:
                return "Makanan";
            case 7:
                return "Anak";
            case 8:
                return "Hobi";
            case 9:
                return "Transportasi";

            default:
                return "Lain-lain";
        }
    }
}
