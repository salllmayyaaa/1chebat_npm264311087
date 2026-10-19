CREATE TABLE area_parkir (
    id_area VARCHAR(10) PRIMARY KEY,
    nama_area VARCHAR(50) NOT NULL,
    status_area ENUM('tersedia', 'tidak tersedia') DEFAULT 'tersedia'
) ENGINE=InnoDB;

INSERT INTO area_parkir (id_area, nama_area, status_area) VALUES
('A001', 'Area Utara', 'tersedia'),
('A002', 'Area Barat', 'tersedia'),
('A003', 'Area Selatan', 'tidak tersedia');

CREATE TABLE kendaraan (
    id_kendaraan VARCHAR(10) PRIMARY KEY,
    nomor_polisi VARCHAR(50) NOT NULL,
    jenis_kendaraan ENUM('roda 2', 'roda 4') NOT NULL
) ENGINE=InnoDB;

INSERT INTO kendaraan (id_kendaraan, nomor_polisi, jenis_kendaraan) VALUES
('K001', 'AE 4567 B', 'roda 2'),
('K002', 'AE 9086 C', 'roda 4'),
('K003', 'AD 5678 BR', 'roda 2');

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

INSERT INTO transaksi (id_kendaraan, id_area, waktu_masuk, waktu_keluar, status_area_parkir) VALUES
('K001', 'A001', '2026-10-19 07:30:00', '2026-10-19 12:00:00', 'kosong'),
('K002', 'A002', '2026-10-19 08:00:00', '2026-10-19 15:30:00', 'kosong'),
('K003', 'A003', '2026-10-19 09:15:00', NULL, 'terisi');
