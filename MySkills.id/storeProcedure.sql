-- Gunakan data umkm;
USE umkm;

-- Tampilkan UMKM Jabar
SELECT * FROM umkm_jabar;

-- 1. Membuat stored procedure sederhana
DELIMITER $$
CREATE PROCEDURE getAllData()
BEGIN
	SELECT * FROM umkm_jabar;
END $$
DELIMITER ;

-- 2. Memanggil getAllData()
CALL getAllData();

-- 3. Cek Stored Procedure
SHOW PROCEDURE STATUS;

-- 4. Modifikasi (menghapus) Stored Procedure
DROP PROCEDURE getAllData;

-- 5. Membuat Stored Procedure dengan parameter
-- 5.1 PARAMETER IN
-- Contoh: Mendapatkan data hanya dari kabupaten karawang

DELIMITER //

CREATE PROCEDURE getDataUMKM (
    IN nama_kab VARCHAR(100)
)
BEGIN
    SELECT * 
    FROM umkm_jabar 
    WHERE nama_kabupaten_kota = nama_kab;
END //

DELIMITER ;

-- Gunakan Stored Procedure 'getDataUMKM'
CALL getDataUMKM("KABUPATEN KARAWANG");


-- 5.2 PARAMETER OUT
-- Variabel digunakan untuk menampung nilai yang digunakan oleh stored procedure
-- Contoh: Mendapatkan jumlah row yang ada di table umkm_jabar
DELIMITER //
CREATE PROCEDURE getTotalRow
(
	OUT jumlah_row INT
)
BEGIN 
	SELECT COUNT(*) INTO jumlah_row FROM umkm_jabar;
END //
DELIMITER ;

-- Call getTotalData()
CALL getTotalRow(@jumlah_row);

SELECT @jumlah_row;


-- Contoh 
SET @panjang = 100;

SELECT @panjang;


-- 5.3 PARAMETER INOUT
-- Mendapatkan jumlah row dengan kode kabupaten tertentu
DELIMITER $$
CREATE PROCEDURE getTotalRow2
(
	INOUT kode_kab INT
)
BEGIN 
	SELECT COUNT(*) INTO kode_kab FROM umkm_jabar WHERE kode_kabupaten_kota=kode_kab;
END $$
DELIMITER ;

SET @kode_kab_kota = 3201;

CALL getTotalRow2(@kode_kab_kota);

SELECT @kode_kab_kota;

-- 6. Loop (Pengulangan)
CREATE TABLE id_mahasiswa (id INT);

SELECT * FROM id_mahasiswa;
INSERT INTO id_mahasiswa VALUES (0);

DELIMITER $$
CREATE PROCEDURE buatIDMahasiswa()
BEGIN
	DECLARE Counter INT;
	SET Counter = 1;
    WHILE Counter <=10 DO
		INSERT INTO id_mahasiswa (id) VALUES (Counter);
		SET Counter = Counter + 1;
    END WHILE;
END $$
DELIMITER ;

CALL buatIDMahasiswa();

-- 7. Conditional Statement (IF THEN)
DELIMITER $$
CREATE PROCEDURE test
(
	IN bilangan INT,
    OUT hasil VARCHAR(100)
)
BEGIN 
	IF bilangan > 50 THEN SET hasil = "Lebih dari 50";
    ELSE SET hasil = "Kurang dari sama dengan 50";
    END IF;
END $$
DELIMITER ;

CALL test(100 , @hasil_test);

CALL test(50 , @hasil_test);

SELECT @hasil_test;


