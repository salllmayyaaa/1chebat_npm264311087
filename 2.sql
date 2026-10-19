-----INSERT TABEL INDUK 1-----
INSERT INTO area_parkir (id_area, nama_area, status_area) VALUES
('A001', 'Area Utara', 'tersedia'),
('A002', 'Area Barat', 'tersedia'),
('A003', 'Area Selatan', 'tidak tersedia');

-----INSERT TABEL INDUK 2-----
INSERT INTO kendaraan (id_kendaraan, nomor_polisi, jenis_kendaraan) VALUES
('K001', 'AE 4567 B', 'roda 2'),
('K002', 'AE 9086 C', 'roda 4'),
('K003', 'AD 5678 BR', 'roda 2');

-----INSERT TABEL ANAK-----
INSERT INTO transaksi (id_kendaraan, id_area, waktu_masuk, waktu_keluar, status_area_parkir) VALUES
('K001', 'A001', '2026-10-19 07:30:00', '2026-10-19 12:00:00', 'kosong'),
('K002', 'A002', '2026-10-19 08:00:00', '2026-10-19 15:30:00', 'kosong'),
('K003', 'A003', '2026-10-19 09:15:00', NULL, 'terisi');

------2. READ-----
SELECT * FROM area_parkir;

------3. UPDATE-----
PDATE transaksi
SET waktu_keluar = '2026-10-19 16:45:00',
    status_area_parkir = 'kosong'
WHERE id_transaksi = 3;

------4. EDELETE------
DELETE FROM transaksi
WHERE id_transaksi = 3;
