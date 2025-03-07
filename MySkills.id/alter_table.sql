-- Buat database Universitas
CREATE DATABASE universitas;

-- Gunakan Database Universitas
USE universitas;

-- Buat Table
CREATE TABLE dosen(
	id_dosen VARCHAR(50),
    nama_dosen VARCHAR(100),
    program_studi VARCHAR(100)
);

-- Definis Table
DESCRIBE dosen;

-- Hapus table
DROP TABLE dosen;

-- Buat primary key pada table dosen
CREATE TABLE dosen(
	id_dosen VARCHAR(50),
    nama_dosen VARCHAR(100),
    program_studi VARCHAR(100),
    PRIMARY KEY(id_dosen)
);

-- Cara lain untuk buat primary key pada table dosen
CREATE TABLE dosen(
	id_dosen VARCHAR(50) PRIMARY KEY,
    nama_dosen VARCHAR(100),
    program_studi VARCHAR(100)
);

-- Buat Table Mahasiswa
CREATE TABLE mahasiswa(
	id_mahasiswa VARCHAR(50),
    nama_mahasiswa VARCHAR(100),
    program_studi VARCHAR(100),
    id_dosen_wali VARCHAR(50),
    FOREIGN KEY(id_dosen_wali) REFERENCES dosen(id_dosen)
);

-- Describe mahasiswa
DESCRIBE mahasiswa;

-- Demo part 2
-- ATambah data di table dosen

INSERT INTO dosen (id_dosen, nama_dosen, program_studi) 
VALUES 
    ("A1001", "Mali, Ph.d", "Teknik Industri"),
    ("A1002", "Dr. Margaretha", "Matematika"),
    ("A1003", "Adi, S.E., MBA", "Manajemen"),
    ("A1004", "dr. Nadia Sp.A", "Kedokteran");

-- TAMPILKAN DATA DOSEN
SELECT * FROM dosen;

-- ALTER TABLE
-- 1. Tambahkan Kolom
ALTER TABLE dosen ADD golongan_darah VARCHAR(3);

-- 2. Menghapus Kolom Pada Table
ALTER TABLE dosen DROP COLUMN golongan_darah;

-- 3. Mengubah Nama Kolom
ALTER TABLE dosen CHANGE COLUMN id_dosen nomor_induk_dosen VARCHAR(50);

-- 4. Mengubah tipe data kolom pada table dosen
ALTER TABLE dosen MODIFY COLUMN nama_dosen VARCHAR(200);



