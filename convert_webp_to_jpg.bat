@echo off
echo Mengonversi semua file WebP menjadi JPG dan menghapus file WebP asli...
echo Folder target: %cd%

REM Loop melalui semua file .webp di folder ini dan subfolder
for /r %%f in (*.webp) do (
    echo Mengonversi "%%f"...
    ffmpeg -y -i "%%f" "%%~dpnf.jpg"
    if exist "%%~dpnf.jpg" (
        echo Menghapus "%%f"...
        del "%%f"
    )
)

echo Selesai!
pause
