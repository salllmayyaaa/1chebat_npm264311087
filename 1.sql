-----1. CREATE TABLE INDUK 1-----
CREATE TABLE area_parkir (
    id_area VARCHAR(10) PRIMARY KEY,
    nama_area VARCHAR(50) NOT NULL,
    status_area ENUM('tersedia', 'tidak tersedia') DEFAULT 'tersedia'
) ENGINE=InnoDB;

-----2. CREATE TABLE INDUK 2-----
CREATE TABLE kendaraan (
    id_kendaraan VARCHAR(10) PRIMARY KEY,
    nomor_polisi VARCHAR(50) NOT NULL,
    jenis_kendaraan ENUM('roda 2', 'roda 4') NOT NULL
) ENGINE=InnoDB;

-----3. CREATE TABLE ANAK-----
CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_kendaraan VARCHAR(10) NOT NULL,
    id_area VARCHAR(10) NOT NULL,
    waktu_masuk DATETIME NOT NULL,
    waktu_keluar DATETIME,
    status_area_parkir ENUM('kosong', 'terisi') DEFAULT 'kosong',
    FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan),
    FOREIGN KEY (id_area) REFERENCES area_parkir(id_area)
) ENGINE=InnoDB;


