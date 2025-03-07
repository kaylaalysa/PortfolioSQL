
-- Membuat database dengan nama umkm
CREATE DATABASE umkm;

-- Import Data

-- Check
USE umkm;
SELECT * FROM umkm.umkm_jabar;

SELECT * FROM umkm_jabar;

-- 1. Tunjukkan data umkm di kota bandung

SELECT * FROM umkm_jabar WHERE nama_kabupaten_kota="KOTA BANDUNG";

-- 2. Tunjukkan UMKM dari tahun 2019 dan disusun berdasarkan kategori usaha dan tahun
SELECT * FROM umkm_jabar WHERE tahun >= 2019 ORDER BY kategori_usaha, tahun;

-- 3. Sama seperti soal ke-2 tapi dibatasi hanya 10
SELECT * FROM umkm_jabar WHERE tahun>= 2019 ORDER by kategori_usaha, tahun LIMIT 10;

-- 4. kategori apa saja (unique)
SELECT DISTINCT kategori_usaha FROM umkm_jabar;

-- 5. Tunjukkan seluruh kategori usaha MAKANAN / FASHION
SELECT * FROM umkm_jabar WHERE kategori_usaha="MAKANAN" OR kategori_usaha="FASHION";

SELECT * FROM umkm_jabar WHERE kategori_usaha IN ("MAKANAN", "FASHION");

-- 6. Tunjukkan Seluruh usaha dengan kategori FASHION di kabupaten karawang
SELECT * FROM umkm_jabar WHERE kategori_usaha="FASHION" AND nama_kabupaten_kota="KABUPATEN KARAWANG";


-- 7. TUNJUKKAN SELURUH USAHA SELAIN KULINER
SELECT * FROM umkm_jabar WHERE NOT kategori_usaha="KULINER";

-- 8. TUNJUKKAN SELURUH USAHA SELAIN KULINER, MAKANAN, MINUMAN
SELECT * FROM umkm_jabar WHERE kategori_usaha NOT IN("MAKANAN", "KULINER", "MINUMAN");

-- 9. Dari tahun 2018 s.d 2020, bagaimana tren jumlah umkm di kabupaten tasikmalaya untuk kategori usaha batik?
SELECT nama_kabupaten_kota, kategori_usaha, jumlah_umkm, satuan, tahun FROM umkm_jabar WHERE tahun <= 2020 AND tahun >=2018 AND nama_kabupaten_kota="KABUPATEN TASIKMALAYA" AND kategori_usaha="BATIK";

-- 10. Di antara KOTA BANDUNG, KABUPATEN BANDUNG, dan KABUPATEN BANDUNG BARAT
-- dimanakan umkm kuliner terpusat pada tahun 2021
SELECT * FROM umkm_jabar WHERE nama_kabupaten_kota IN("KOTA BANDUNG", "KABUPATEN BANDUNG", "KABUPATEN BANDUNG BARAT")
AND tahun=2021 AND kategori_usaha="KULINER";

SELECT * FROM umkm_jabar WHERE nama_kabupaten_kota LIKE "%BANDUNG%" AND tahun=2021 AND kategori_usaha="KULINER";

-- 11. Kabupaten mana yang di kode_kabupaten_kota ada angka 7 di digit ke 3?
SELECT DISTINCT kode_kabupaten_kota, nama_kabupaten_kota FROM umkm_jabar WHERE kode_kabupaten_kota LIKE "__7%";
