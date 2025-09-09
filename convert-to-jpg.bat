@echo off
echo Mengonversi semua file PNG/JPEG menjadi JPG...
echo Folder target: %cd%

REM Loop melalui semua file PNG dan JPEG (abaikan JPG karena sudah benar)
for /r %%f in (*.png *.jpeg) do (
    echo Mengonversi "%%f"...
    ffmpeg -y -i "%%f" "%%~dpnf.jpg"
    if exist "%%~dpnf.jpg" (
        echo Menghapus "%%f"...
        del "%%f"
    )
)

echo Selesai!
pause
