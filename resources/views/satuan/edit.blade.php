@extends('layouts.app')

@section('judul', 'Ubah Satuan')

@section('konten')
    <h1>Ubah Satuan</h1>

    @if ($errors->any())
        <ul style="color: #b00020;">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    @endif

    <form action="{{ route('satuan.update', $satuan->id_satuan) }}" method="POST">
        @csrf
        @method('PUT')

        <p>
            <label>Nama Satuan</label><br>
            <input type="text" name="nama_satuan"
                   value="{{ old('nama_satuan', $satuan->nama_satuan) }}" required>
        </p>

        <p>
            <label>Status</label><br>
            <select name="status">
                <option value="1" @selected((string) old('status', $satuan->status) === '1')>Aktif</option>
                <option value="0" @selected((string) old('status', $satuan->status) === '0')>Tidak aktif</option>
            </select>
        </p>

        <button type="submit">Simpan Perubahan</button>
        <a href="{{ route('satuan.index') }}">Batal</a>
    </form>
@endsection