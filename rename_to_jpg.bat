@echo off
echo Mengubah semua .JPG_temp menjadi .jpg di folder ini dan subfolder...
for /r %%f in (*.JPG_temp) do (
    ren "%%f" "%%~nf.jpg"
)
echo Selesai! Sekarang commit & push perubahan final ke GitHub.
pause
