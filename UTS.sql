--- 1. Kartu RFID
CREATE TABLE kartu_rfid (
    id_kartu INT AUTO_INCREMENT PRIMARY KEY,
    id_kendaraan VARCHAR(10) NOT NULL,
    uid_rfid VARCHAR(20) NOT NULL UNIQUE,
    status_kartu ENUM('aktif', 'nonaktif') DEFAULT 'aktif',
    tanggal_terbit DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tanggal_nonaktif DATETIME,
    FOREIGN KEY (id_kendaraan) REFERENCES kendaraan(id_kendaraan)
) ENGINE=InnoDB;

--- 2. Laporan
CREATE TABLE laporan_kartu (
    id_laporan INT AUTO_INCREMENT PRIMARY KEY,
    id_kartu INT NOT NULL,
    jenis_laporan ENUM('hilang', 'rusak') NOT NULL,
    tanggal_lapor DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    keterangan VARCHAR(255),
    status_verifikasi ENUM('menunggu', 'terverifikasi', 'ditolak') DEFAULT 'menunggu',
    tanggal_verifikasi DATETIME,
    id_verifikator VARCHAR(10),
    id_kartu_pengganti INT UNIQUE,
    FOREIGN KEY (id_kartu) REFERENCES kartu_rfid(id_kartu),
    FOREIGN KEY (id_kartu_pengganti) REFERENCES kartu_rfid(id_kartu)
) ENGINE=InnoDB;

INSERT INTO kartu_rfid (id_kendaraan, uid_rfid, status_kartu)
SELECT id_kendaraan, uid_rfid, 'aktif' FROM kendaraan;

ALTER TABLE kendaraan DROP INDEX uq_kendaraan_rfid, DROP COLUMN uid_rfid;

--- 3. Nonaktif Kartu
CREATE TRIGGER trg_laporan_nonaktifkan_kartu
AFTER UPDATE ON laporan_kartu
FOR EACH ROW
    UPDATE kartu_rfid
    SET status_kartu = 'nonaktif',
        tanggal_nonaktif = NEW.tanggal_verifikasi
    WHERE id_kartu = NEW.id_kartu
      AND status_kartu = 'aktif'
      AND NEW.status_verifikasi = 'terverifikasi'
      AND OLD.status_verifikasi <> 'terverifikasi';
