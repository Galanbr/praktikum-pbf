# 🚀 Laravel & CodeIgniter Deployment with Docker

Repositori ini berisi setup project Laravel (frontend) dan CodeIgniter (backend) yang terintegrasi menggunakan Docker serta shell script untuk automasi.

## 📦 Struktur Folder
```
.
├── backend/                 
│   └── .env.example         
├── frontend/                
│   └── .env.example         
├── .env.docker              
├── Dockerfile.backend       
├── Dockerfile.frontend      
├── docker-compose.yml       
├── start.sh                 
└── kelompok_4.sql           
```

## 🧰 Prasyarat
Pastikan sudah install:
- [Docker](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/downloads)

## 📥 Clone Repository
```bash
git clone https://github.com/Galanbr/praktikum-pbf.git
cd nama-repo
```

## 📄 Environment
File `.env` tidak disertakan dalam repo ini demi keamanan.

Untuk menjalankan proyek secara lokal, rename file `.env.example` menjadi `.env`:

## 🚀 Menjalankan Proyek
Jalankan perintah berikut untuk build dan menjalankan seluruh service secara otomatis:
```bash
docker compose up --build
```

## 🌐 Akses Aplikasi
- **Frontend (Laravel)**: [http://localhost:8000](http://localhost:8000)
- **Backend (CodeIgniter)**: [http://localhost:8080](http://localhost:8080)

## ⚙️ Konfigurasi Database
Sesuaikan environment di `.env.docker` jika diperlukan.

Contoh:
```
DB_HOST=db
DB_PORT=3306
DB_DATABASE=kelompok_4
DB_USERNAME=root
DB_PASSWORD=root
```

Jika ingin import SQL:
```bash
docker exec -i nama_container_mysql mysql -u root -p < kelompok_4.sql
```

## 🔄 Update & Rebuild
Jika ada perubahan kode:
```bash
docker compose down
docker compose up --build

```

## 🛑 Stop Service
```bash
docker-compose down
```
