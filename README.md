# Inventori — Frontend CUD (Tugas UTS Basis Data)

Aplikasi web sederhana untuk mengelola data master **satuan** pada database `db_inventori`.

**Nama:** Rifdatus Shidqiyya
**NIM:** 434251080
**Kelas:** TI-B5

## Fitur

- Daftar satuan (Read)
- Tambah satuan (Create), dengan validasi isian
- Ubah satuan (Update)
- Hapus satuan (Delete), ditolak otomatis bila satuan masih dipakai tabel `barang` (foreign key)

## Cara menjalankan

1. Buat database dari skrip SQL: jalankan `database/db_inventori.sql` di MySQL
   (lewat MySQL Workbench atau `mysql -u root -p < database/db_inventori.sql`).
2. Pasang dependensi:
```bash
   composer install
```
3. Salin file konfigurasi:
```bash
   copy .env.example .env
   php artisan key:generate
```
4. Buka `.env`, lalu atur koneksi database:
```env
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=db_inventori
   DB_USERNAME=root
   DB_PASSWORD=
```
5. Jalankan server:
```bash
   php artisan serve
```
6. Buka `http://127.0.0.1:8000/satuan`.

> Jangan menjalankan `php artisan migrate`. Struktur database dibuat dari skrip SQL,
> bukan dari migration.

## Struktur penting

| Berkas | Peran |
|---|---|
| `routes/web.php` | Router |
| `app/Http/Controllers/SatuanController.php` | Controller |
| `app/Models/Satuan.php` | Model |
| `resources/views/satuan/` | View (daftar, tambah, ubah) |
| `database/db_inventori.sql` | Skrip database (struktur dan data) |