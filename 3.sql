SELECT a.nama_area,
       COUNT(t.id_transaksi) AS total_transaksi
FROM transaksi t
JOIN area_parkir a ON t.id_area = a.id_area
WHERE t.waktu_keluar IS NOT NULL
GROUP BY a.nama_area;
