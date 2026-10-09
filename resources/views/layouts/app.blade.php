<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('judul', 'Inventori')</title>
    <style>
        body { font-family: system-ui, sans-serif; margin: 0; background: #f7f7f9; color: #222; }
        header { background: #1f4e79; color: #fff; padding: 16px 24px; }
        main { max-width: 880px; margin: 24px auto; padding: 0 16px; }
        table { width: 100%; border-collapse: collapse; background: #fff; }
        th, td { border: 1px solid #e2e5ea; padding: 8px 12px; text-align: left; }
        th { background: #eef2f7; }
        a { color: #1f4e79; }
        .pesan { background: #e6f4ea; border: 1px solid #b7dfc2; padding: 10px 14px;
                 border-radius: 6px; margin-bottom: 12px; }
        .galat { background: #fdecea; border-color: #f5c2c0; }
    </style>
</head>
<body>
    <header><strong>Inventori — Data Master</strong></header>
    <main>
        @if (session('sukses'))
            <div class="pesan">{{ session('sukses') }}</div>
        @endif
        
        @if (session('galat'))
            <div class="pesan galat">{{ session('galat') }}</div>
        @endif
        @yield('konten')
    </main>
</body>
</html>