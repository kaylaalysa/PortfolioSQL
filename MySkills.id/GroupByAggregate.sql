-- Menggunakan database umkm jabar
USE umkm;

-- Lihat kembali isi
SELECT * FROM umkm_jabar;

-- 1. Berapa jumlah baris dari table umkm jabar?
SELECT COUNT(*) AS jumlah_baris FROM umkm_jabar;

-- 2. Berapa jumlah umkm di KABUPATEN BEKASI pada tahun 2017
SELECT SUM(jumlah_umkm) AS jumlah_umkm FROM umkm_jabar WHERE nama_kabupaten_kota='KABUPATEN BEKASI' AND tahun= 2017;

-- 3. Bagaimana tren jumlah umkm di kabupaten karawang dari tahun 2017 s.d 2021?
SELECT tahun, SUM(jumlah_umkm) AS jumlah_umkm_kab_karawang FROM umkm_jabar WHERE nama_kabupaten_kota='KABUPATEN KARAWANG' AND tahun>=2017 AND tahun<=2021 GROUP BY tahun;

-- 4. Berapa jumlah rata setiap kategori usaha per kabupaten/kota di tahun 2021?-- 
SELECT nama_kabupaten_kota, kategori_usaha, AVG(jumlah_umkm) AS rerata_umkm FROM umkm_jabar WHERE tahun=2021 GROUP BY nama_kabupaten_kota, kategori_usaha;

-- 5. nilai min dan max dari jumlah_umkm
SELECT MIN(jumlah_umkm) , MAX(jumlah_umkm) FROM umkm_jabar;

-- 6. kab/kota apa yang memiliki jumlah umkm kurang dari 100.000 pada tahun 2020
SELECT nama_kabupaten_kota, SUM(jumlah_umkm) AS total FROM umkm_jabar  WHERE tahun=2020 GROUP BY nama_kabupaten_kota HAVING total<100000;