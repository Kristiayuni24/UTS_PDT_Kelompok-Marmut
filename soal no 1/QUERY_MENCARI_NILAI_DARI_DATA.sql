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

-- ================MENCARI RATA-RATA =============================
-- mnghitung rata-rata dari data penjualan di setiap transaksi
SELECT
	ROUND(AVG(`ship_qty`),0) AS rata2_jumlah_jual,
	ROUND(AVG(`total_rupiah`),2) AS rata2_total_rupiah
FROM `data_master`;

-- harga jual rata2 
SELECT
	ROUND(AVG(`sell_price`),2) AS rata2_harga_jual
FROM `data_master`;

-- =====================MENCARI NILAI MEDIAN DARI JUMLAH PENGIRIMAN, HARGA JUAL, DAN TOTAL_RUPIAH============================
-- MEDIAN DARI JUMLAH TERJUAL/JUMLAH PENGIRIMAN
SELECT AVG(median) AS median_ship_qty
FROM (
    SELECT ship_qty AS median
    FROM (
        SELECT ship_qty, @rownum:=@rownum+1 AS `row_number`, @total_rows:=@total_rows+1 AS `total_rows`
        FROM data_master, (SELECT @rownum:=0, @total_rows:=0) AS init
        ORDER BY ship_qty
    ) AS ranked
    WHERE row_number >= @total_rows/2 AND row_number <= (@total_rows+1)/2
) AS median_values;

-- MEDIAN DARI HARGA JUAL
SELECT AVG(median) AS median_sell_price
FROM (
    SELECT sell_price AS median
    FROM (
        SELECT sell_price, @rownum:=@rownum+1 AS `row_number`, @total_rows:=@total_rows+1 AS `total_rows`
        FROM data_master, (SELECT @rownum:=0, @total_rows:=0) AS init
        ORDER BY sell_price
    ) AS ranked
    WHERE row_number >= @total_rows/2 AND row_number <= (@total_rows+1)/2
) AS median_values;

-- MEDIAN DARI NILAI TOTAL_RUPIAH TERJUAL 
SELECT AVG(median) AS median_total_rupiah
FROM (
    SELECT total_rupiah AS median
    FROM (
        SELECT total_rupiah, @rownum:=@rownum+1 AS `row_number`, @total_rows:=@total_rows+1 AS `total_rows`
        FROM data_master, (SELECT @rownum:=0, @total_rows:=0) AS init
        ORDER BY total_rupiah
    ) AS ranked
    WHERE row_number >= @total_rows/2 AND row_number <= (@total_rows+1)/2
) AS median_values;

SELECT
	part,
	`part_name`,
	COUNT(part) AS jumlah_trx
FROM `data_master`
WHERE part = "1LBH35500000" OR part = "5TLE74650000"
GROUP BY part;





