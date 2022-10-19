USE db_rental_bus;
DELIMITER $$
CREATE TRIGGER `updateStatus` AFTER INSERT ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Jalan'
WHERE id = NEW.idkendaraan;
UPDATE sopir SET status = 'Jalan'
WHERE id = NEW.idsopir;
END $$