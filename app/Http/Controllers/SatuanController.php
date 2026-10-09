<?php

namespace App\Http\Controllers;

use App\Models\Satuan;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Database\QueryException;

class SatuanController extends Controller
{
    /* Menampilkan seluruh satuan. */
    public function index(): View
    {
        $satuan = Satuan::all();

        return view('satuan.index', ['satuan' => $satuan]);
    }

    /* Menampilkan form tambah satuan. */
    public function create(): View
    {
        return view('satuan.create');
    }

    /* Memvalidasi dan menyimpan satuan baru. */
    public function store(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'nama_satuan' => 'required|string|max:45',
            'status'      => 'required|in:0,1',
        ]);

        Satuan::create($data);

        return redirect()->route('satuan.index')
            ->with('sukses', 'Satuan berhasil ditambahkan.');
    }

        /** Menampilkan form ubah satuan. */
    public function edit(int $id): View
    {
        $satuan = Satuan::findOrFail($id);

        return view('satuan.edit', ['satuan' => $satuan]);
    }

    /** Memvalidasi dan menyimpan perubahan satuan. */
    public function update(Request $request, int $id): RedirectResponse
    {
        $satuan = Satuan::findOrFail($id);

        $data = $request->validate([
            'nama_satuan' => 'required|string|max:45',
            'status'      => 'required|in:0,1',
        ]);

        $satuan->update($data);

        return redirect()->route('satuan.index')
            ->with('sukses', 'Satuan berhasil diubah.');
    }

        /** Menghapus satuan. */
    public function destroy(int $id): RedirectResponse
    {
        $satuan = Satuan::findOrFail($id);

        try {
            $satuan->delete();
        } catch (QueryException $e) {
            // gagal, biasanya karena satuan masih dipakai tabel barang (foreign key)
            return redirect()->route('satuan.index')
                ->with('galat', 'Satuan tidak dapat dihapus karena masih dipakai oleh data barang.');
        }

        return redirect()->route('satuan.index')
            ->with('sukses', 'Satuan berhasil dihapus.');
    }
}