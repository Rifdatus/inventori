<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Models\Satuan;
use App\Http\Controllers\SatuanController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/tes-db', function () {
    $jumlah = DB::table('satuan')->count();
    return "Koneksi berhasil. Jumlah satuan: {$jumlah}";
});

Route::get('/tes-model', function () {
    return Satuan::all();
});

Route::get('/satuan', [SatuanController::class, 'index'])->name('satuan.index');
Route::get('/satuan/tambah', [SatuanController::class, 'create'])->name('satuan.create');
Route::post('/satuan', [SatuanController::class, 'store'])->name('satuan.store');
Route::get('/satuan/{id}/edit', [SatuanController::class, 'edit'])->name('satuan.edit')->whereNumber('id');
Route::put('/satuan/{id}', [SatuanController::class, 'update'])->name('satuan.update')->whereNumber('id');
Route::delete('/satuan/{id}', [SatuanController::class, 'destroy'])->name('satuan.destroy')->whereNumber('id');