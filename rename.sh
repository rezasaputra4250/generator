#!/bin/bash

# Direktori tempat file Anda berada
DIR="./"  # Ganti dengan direktori tempat file Anda

# Nama file yang tidak ingin diubah
EXCLUDE_FILE="rename_files.sh"

# Loop untuk semua file di direktori tersebut
for file in "$DIR"*; do
  if [[ -f "$file" && "$(basename -- "$file")" != "$EXCLUDE_FILE" ]]; then
    # Mengambil nama file tanpa ekstensi
    filename=$(basename -- "$file")
    # Mengganti spasi dengan tanda hubung (-) dan mengubah menjadi lowercase (kebab-case)
    new_name=$(echo "$filename" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    # Menambahkan ekstensi .html
    new_name="${new_name}.html"
    # Rename file
    mv "$file" "$DIR$new_name"
    echo "File '$filename' diubah menjadi '$new_name'"
  fi
done
