@extends('layouts.app')

@section('judul', 'Data Satuan')

@section('konten')
    <h1>Data Satuan</h1>

    <p><a href="{{ route('satuan.create') }}">+ Tambah Satuan</a></p>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama Satuan</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($satuan as $item)
                <tr>
                    <td>{{ $item->id_satuan }}</td>
                    <td>{{ $item->nama_satuan }}</td>
                    <td>{{ $item->status == 1 ? 'Aktif' : 'Tidak aktif' }}</td>
                    <td>
                        <a href="{{ route('satuan.edit', $item->id_satuan) }}">Ubah</a>

                        <form action="{{ route('satuan.destroy', $item->id_satuan) }}"
                              method="POST" style="display:inline"
                              onsubmit="return confirm('Hapus satuan ini?')">
                            @csrf
                            @method('DELETE')
                            <button type="submit">Hapus</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="4">Belum ada data satuan.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
@endsection