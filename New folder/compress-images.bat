@echo off
echo Mengompres semua file JPG, JPEG, PNG menjadi lebih kecil...
echo Folder target: %cd%

REM Loop melalui semua file JPG, JPEG, PNG di folder ini dan subfolder
for /r %%f in (*.jpg *.jpeg *.png) do (
    echo Mengompres "%%f"...
    
    REM Kompres menjadi JPG dengan kualitas 85% (bisa diubah antara 70-85)
    ffmpeg -y -i "%%f" -qscale:v 3 "%%~dpnf_compressed.jpg"
    
    if exist "%%~dpnf_compressed.jpg" (
        REM Hapus file asli
        del "%%f"
        REM Ganti nama file compressed menjadi nama asli
        ren "%%~dpnf_compressed.jpg" "%%~nxf"
    )
)

echo Selesai!
pause
