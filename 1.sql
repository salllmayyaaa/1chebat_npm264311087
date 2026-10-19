CREATE TABLE area_parkir_yaya (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    nama_area VARCHAR(50) NOT NULL,
    status_area ENUM('tersedia', 'tidak tersedia') DEFAULT 'tersedia'
) ENGINE=InnoDB;

INSERT INTO area_parkir_yaya (nama_area, status_area) VALUES
('Area Utara', 'tersedia'),
('Area Barat', 'tersedia'),
('Area Selatan', 'tidak tersedia');

CREATE TABLE kendaraan (
    id_kendaraan INT AUTO_INCREMENT PRIMARY KEY,
    nomor_polisi VARCHAR(50) NOT NULL,
    jenis_kendaraan ENUM('roda 2', 'roda 4') NOT NULL
) ENGINE=InnoDB;

INSERT INTO kendaraan (nomor_polisi, jenis_kendaraan) VALUES
('AE 4567 B', 'roda 2'),
('AE 9086 C', 'roda 4'),
('AD 5678 BR', 'roda 2');

CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_kendaraan INT NOT NULL,
    id_area INT NOT NULL,
    waktu_masuk DATETIME NOT NULL,
    waktu_keluar DATETIME,
    status_area_parkir ENUM('kosong', 'terisi') DEFAULT 'kosong',
    FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan),
    FOREIGN KEY (id_area) REFERENCES area_parkir_yaya(id_area)
) ENGINE=InnoDB;

INSERT INTO transaksi (id_kendaraan, id_area, waktu_masuk, waktu_keluar, status_area_parkir) VALUES
(1, 1, '2026-10-19 07:30:00', '2026-10-19 12:00:00', 'kosong'),
(2, 2, '2026-10-19 08:00:00', '2026-10-19 15:30:00', 'kosong'),
(3, 1, '2026-10-19 09:15:00', NULL, 'terisi');
