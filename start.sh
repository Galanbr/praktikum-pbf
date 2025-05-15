#!/bin/bash

echo "🚀 Menyalakan semua container..."

# Build dan run container secara detached
docker-compose up -d --build

echo "⏳ Menunggu container frontend siap..."

# Tunggu Laravel frontend siap
until docker exec frontend_laravel_su ls /var/www/html > /dev/null 2>&1; do
  sleep 1
done

echo "✅ Container frontend aktif. Setup Laravel..."

# Setup Laravel
docker exec frontend_laravel_su php artisan key:generate

echo "⏳ Menunggu database MySQL siap..."

# Tunggu sampai MySQL ready (port 3306 terbuka)
until docker exec mysql_container mysqladmin ping -h "localhost" --silent; do
  sleep 1
done

echo "📦 Import database kelompok_4.sql..."

# Import file SQL ke MySQL
docker exec -i mysql_container mysql -u root -proot kelompok_4 < ./kelompok_4.sql

echo "✅ Database berhasil dimigrasi."
echo "🌐 Frontend Laravel siap diakses di http://localhost:8000"
echo "🌐 Backend CodeIgniter siap diakses di http://localhost:8080"
