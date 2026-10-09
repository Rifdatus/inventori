<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Satuan extends Model
{
    // nama tabel di db_inventori
    protected $table = 'satuan';

    // primary key
    protected $primaryKey = 'id_satuan';

    // tabel satuan tidak punya kolom created_at dan updated_at
    public $timestamps = false;

    // kolom yang boleh diisi lewat create() dan update()
    protected $fillable = ['nama_satuan', 'status'];
}