@echo off
echo Mengubah semua .JPG menjadi .JPG_temp di folder ini dan subfolder...
for /r %%f in (*.JPG) do (
    ren "%%f" "%%~nf_temp%%~xf"
)
echo Selesai. Sekarang commit & push perubahan ke GitHub.
pause
