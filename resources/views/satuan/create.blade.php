@extends('layouts.app')

@section('judul', 'Tambah Satuan')

@section('konten')
    <h1>Tambah Satuan</h1>

    @if ($errors->any())
        <ul style="color: #b00020;">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    @endif

    <form action="{{ route('satuan.store') }}" method="POST">
        @csrf

        <p>
            <label>Nama Satuan</label><br>
            <input type="text" name="nama_satuan" value="{{ old('nama_satuan') }}" required>
        </p>

        <p>
            <label>Status</label><br>
            <select name="status">
                <option value="1" @selected(old('status', '1') == '1')>Aktif</option>
                <option value="0" @selected(old('status') === '0')>Tidak aktif</option>
            </select>
        </p>

        <button type="submit">Simpan</button>
        <a href="{{ route('satuan.index') }}">Batal</a>
    </form>
@endsection