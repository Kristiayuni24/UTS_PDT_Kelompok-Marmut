-- import data ke mysql
-- ================MENCARI TOTAL JUMLAH =============================
-- menghitung jumlah data terjual per item barang
SELECT
	`part`,
	`part_name`,
	SUM(`ship_qty`) AS total_jumlah_terjual,
	SUM(`total_rupiah`) AS total_rupiah_per_part
FROM `data_master`
	GROUP BY part;
	
-- menghitung total jumlah barang terjual dan pendapatan dari semua transaksi.
SELECT
	SUM(`ship_qty`) AS total_jumlah_terjual,
	SUM(`total_rupiah`) AS total_rupiah_seluruh
FROM `data_master`;
