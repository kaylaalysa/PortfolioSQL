CREATE DATABASE sdm;


-- Buat Tabel
CREATE TABLE Karyawan (
	nik VARCHAR(16),
    nama_karyawan VARCHAR(200),
    level_jabatan INTEGER,
    tanggal_lahir DATE
);

-- Gunakan Database sdm
use sdm;

-- Menambahkan data ke tabel karyawan
INSERT INTO Karyawan VALUES (
	"A01",
    "Andi",
    1,
    "1997-09-08"
);

-- Menampilkan data dari Karyawan
SELECT *  FROM Karyawan;

INSERT INTO Karyawan (nik, nama_karyawan, level_jabatan, tanggal_lahir)
VALUES (
	"A02",
    "Fulan",
    2,
    "1997-01-08"
);

INSERT INTO Karyawan (nik, nama_karyawan, level_jabatan, tanggal_lahir)
VALUES (
	"A03",
    "Kayla",
    3,
    "2001-06-06"
);




