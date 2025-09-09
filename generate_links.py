import os
import openpyxl
import re

# === CONFIG ===
LOCAL_FOLDER = r"E:\FILE2\FILE2 IRC STORE\3D-Print-Products"   # path ke folder di komputer kamu
USERNAME = "irchamzah"                # username GitHub
REPO = "3D-Print-Products"            # nama repo
BRANCH = "main"                       # branch GitHub
OUTPUT_XLSX = "produk_links.xlsx"     # hasil Excel

# === HELPER FUNCTION ===
def natural_sort(l):
    """Urutkan list secara natural (1,2,3,10 bukan 1,10,2)"""
    convert = lambda text: int(text) if text.isdigit() else text.lower()
    alphanum_key = lambda key: [convert(c) for c in re.split('([0-9]+)', key)]
    return sorted(l, key=alphanum_key)

# === START ===
wb = openpyxl.Workbook()
ws = wb.active
ws.title = "Shopee Links"

# Header dengan kolom Nomor di kiri
headers = ["Nomor", "Nama Folder", "Foto Sampul", "Foto Produk 1", "Foto Produk 2",
           "Foto Produk 3", "Foto Produk 4", "Foto Produk 5", "Foto Produk 6",
           "Foto Produk 7", "Foto Produk 8"]
ws.append(headers)

# Ambil semua folder dan urutkan secara natural
folders = [f for f in os.listdir(LOCAL_FOLDER) if os.path.isdir(os.path.join(LOCAL_FOLDER, f))]
folders = natural_sort(folders)

# Loop folder
for idx, folder in enumerate(folders, start=1):
    folder_path = os.path.join(LOCAL_FOLDER, folder)
    row = [idx, folder]  # Kolom Nomor + Nama Folder
    for i in range(1, 9):  # maksimal 8 foto
        file_name = f"{i}.jpg"
        file_path = os.path.join(folder_path, file_name)
        if os.path.exists(file_path):
            link = f"https://raw.githubusercontent.com/{USERNAME}/{REPO}/refs/heads/{BRANCH}/{folder.replace(' ', '%20')}/{file_name}"
            row.append(link)
        else:
            row.append("")
    ws.append(row)

wb.save(OUTPUT_XLSX)
print(f"✅ Selesai! File tersimpan: {OUTPUT_XLSX}")
