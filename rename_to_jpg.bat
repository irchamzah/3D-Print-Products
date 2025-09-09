@echo off
echo Mengubah semua file *_temp.jpg menjadi *.jpg di folder ini dan subfolder...

for /r %%f in (*_temp.jpg) do (
    set "fullpath=%%f"
    setlocal enabledelayedexpansion
    set "filename=%%~nf"
    set "newname=!filename:_temp=!.jpg"
    ren "%%f" "!newname!"
    endlocal
)

echo Selesai! Semua file _temp.jpg sudah diubah menjadi .jpg
pause
