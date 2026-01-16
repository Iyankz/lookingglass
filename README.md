# LookingGlass Auto Installer for Ubuntu 22.04

[![Author](https://img.shields.io/badge/Author-Iyankz-blue.svg)](https://github.com/Iyankz)
[![Platform](https://img.shields.io/badge/Platform-Ubuntu%2022.04-orange.svg)](https://ubuntu.com/)

Script ini dirancang untuk mempercepat proses instalasi **LookingGlass** (oleh telephone) pada server Ubuntu 22.04. Sangat cocok digunakan oleh Network Engineer atau ISP untuk memberikan fasilitas pengecekan jaringan (Ping, Traceroute, MTR) kepada pelanggan secara transparan.

## 🚀 Fitur Utama
- **Auto-Config Timezone:** Otomatis set ke `Asia/Jakarta`.
- **LAMP Stack:** Otomatis install Apache2, MariaDB, dan PHP versi terbaru yang kompatibel.
- **Database Management:** Terintegrasi dengan phpMyAdmin untuk pengelolaan database GUI.
- **Custom Patch:** Menggunakan file `ajax.php` yang sudah dioptimasi dari repository [Iyankz](https://github.com/Iyankz).
- **Interactive Setup:** Menjalankan `configure.sh` bawaan LookingGlass untuk pengaturan site.

## 📋 Prasyarat
- Server dengan OS **Ubuntu 22.04**.
- Akses **Root** atau user dengan hak akses **Sudo**.
- Koneksi Internet.

## 🛠️ Cara Instalasi

Kamu bisa menjalankan instalasi dengan satu perintah (One-Liner) atau dengan mengklon repository ini:

### Opsi 1: One-Liner (Fast Install)
```bash
wget -qO- [https://raw.githubusercontent.com/Iyankz/lookingglass/main/install.sh](https://raw.githubusercontent.com/Iyankz/lookingglass/main/install.sh) | sudo bash
```
### Opsi 2: Manual Clone
* Clone repository ini:
```bash

git clone [https://github.com/Iyankz/lookingglass.git](https://github.com/Iyankz/lookingglass.git)
cd lookingglass
```
* Berikan izin eksekusi pada script:
```bash
chmod +x install.sh
```
Jalankan script:
```bash
sudo ./install.sh
```

## 🖥️ Setelah Instalasi Selesai
Setelah script berhasil dijalankan, kamu dapat mengakses layanan melalui browser:

* LookingGlass: http://ip-server-kamu/
* phpMyAdmin: http://ip-server-kamu/phpmyadmin

## 📁 Struktur Direktori

* Web Root: /var/www/html/
* Konfigurasi LookingGlass: /var/www/html/LookingGlass/
* Patch File: /var/www/html/ajax.php

## ✍️ Kontribusi
Jika kamu menemukan bug atau ingin menambahkan fitur (seperti integrasi Telegram Bot atau custom theme), silakan kirim Pull Request atau buka Issue di repository ini.

Maintained by Iyankz Operations Manager at PT Proxi Jaringan Nusantara, PT Mitra Internet Indonesia, & PT Bentang Johar Awal.
