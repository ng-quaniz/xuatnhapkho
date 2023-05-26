
-- 1 funtion idNV cuối

DELIMITER //

create FUNCTION maxid_NV()
RETURNS CHAR(3)
DETERMINISTIC
BEGIN
    DECLARE max_id CHAR(3);
    set max_id = (select max(right(idNV,3))  FROM nhanvien);
    RETURN max_id;
END;

//DELIMITER ;

-- 2 trigger idNV tự động

DELIMITER //

CREATE TRIGGER idNV
BEFORE INSERT ON nhanvien
FOR EACH ROW
BEGIN
    SET NEW.idNV = concat("NV",LPAD(maxid_NV()+1, 3,0));
END;

//DELIMITER ;

-- 3 funtion idKH cuối

DELIMITER //

create FUNCTION maxid_KH()
RETURNS CHAR(3)
DETERMINISTIC
BEGIN
    DECLARE max_id CHAR(3);
    set max_id = (select max(right(idKH,3))  FROM khachhang);
    RETURN max_id;
END;

//DELIMITER;

-- 4 trigger idKH tự động

DELIMITER //

CREATE TRIGGER idKH
BEFORE INSERT ON khachhang
FOR EACH ROW
BEGIN
    SET NEW.idKH = concat("KH",LPAD(maxid_KH()+1, 3,0));
END;

//DELIMITER ;

-- 5 funtion idHH mới

DELIMITER //

create FUNCTION maxid_HH( loai char(3))
RETURNS CHAR(3)
DETERMINISTIC
BEGIN
    DECLARE max_id CHAR(3);
    set max_id = lpad((select max(right(idHH,3)) from hanghoa
						where idHH like concat("%",loai,"%"))+1,3,0);
    RETURN max_id;
END;

//DELIMITER ;

-- 6 trigger idHH tự động

DELIMITER //

CREATE TRIGGER idHH
BEFORE INSERT ON hanghoa
FOR EACH ROW
BEGIN
	IF maxid_HH(concat(new.idLH,new.idLC)) is null THEN
		SET NEW.idHH = concat(new.idLH,new.idLC,"001");
    ELSE
		SET NEW.idHH = concat(new.idLH,new.idLC,maxid_HH(concat(new.idLH,new.idLC)));
	END IF;
END;

//DELIMITER ;

-- 7 trigger thêm vào chi tiết sau khi thêm hàng hóa

DELIMITER //
CREATE TRIGGER insert_chitiet 
AFTER INSERT ON hanghoa
FOR EACH ROW
BEGIN
    INSERT INTO chitiet (idCT, idHH, idKH, idNV, ngaytao)
    VALUES ("",NEW.idHH, NULL, 'NV001', NOW());
END//
DELIMITER ;

-- 8 trigger idCT tự động theo idHH

DELIMITER //

CREATE TRIGGER idCT_idHH
BEFORE INSERT ON chitiet
FOR EACH ROW
BEGIN
    SET NEW.idCT = new.idHH;
END;

//DELIMITER ;

-- 9 trigger update chi tiết sau khi thêm khachhang

DELIMITER //

CREATE TRIGGER insert_chitiet_KH 
AFTER INSERT ON khachhang
FOR EACH ROW
BEGIN
    update chitiet set idKH=NEW.idKH where idKH is NULL;
END//
DELIMITER ;

-- 10  trigger idCT tự động theo idKH

DELIMITER //

CREATE TRIGGER idCT_idKH
BEFORE UPDATE ON chitiet
FOR EACH ROW
BEGIN
    SET NEW.idCT = concat(old.idCT,new.idKH);
END;

//DELIMITER ;

-- 11 function idPN mới

DELIMITER //

create FUNCTION maxid_PN()
RETURNS CHAR(3)
DETERMINISTIC
BEGIN
    DECLARE max_id CHAR(3);
    set max_id = lpad((select max(right(idPN,3))  FROM phieunhap)+1,3,0);
    RETURN max_id;
END;

//DELIMITER ;

-- 12 trigger idPN tự động

DELIMITER //

CREATE TRIGGER idPN
BEFORE INSERT ON phieunhap
FOR EACH ROW
BEGIN
	IF (select idPN from phieunhap LIMIT 1) is null THEN
		SET NEW.idPN = "PN001";
    ELSE
		SET NEW.idPN = concat("PN",maxid_PN());
	END IF;
END;

//
DELIMITER ;

-- 13 trigger insert vào ctphieunhap sau khi thêm phiếu nhập

DELIMITER //

create TRIGGER insert_ctphieunhap
AFTER insert ON phieunhap
FOR EACH ROW
BEGIN
  INSERT INTO ctphieunhap (idCTPN,idPN, idCT, ghichu, idkhu) VALUES (concat(day(now()),month(now())),NEW.idPN, NULL, "", NULL);
END;
//
DELIMITER ;

-- 14 update trangthai sau khi update ct phiếu nhập

DELIMITER //

CREATE TRIGGER update_idTT
AFTER UPDATE ON ctphieunhap
FOR EACH ROW
BEGIN
  UPDATE hanghoa SET idTT = "NK" WHERE idHH = (SELECT idHH FROM chitiet WHERE idCT = NEW.idCT);
END;
//           

DELIMITER ;

-- 15 function idPX mới

DELIMITER //

create FUNCTION maxid_PX()
RETURNS CHAR(3)
DETERMINISTIC
BEGIN
    DECLARE max_id CHAR(3);
    set max_id = lpad((select max(right(idPX,3))  FROM phieuxuat)+1,3,0);
    RETURN max_id;
END;

//DELIMITER ;

-- 16 trigger idPN tự động

DELIMITER //

CREATE TRIGGER idPX
BEFORE INSERT ON phieuxuat
FOR EACH ROW
BEGIN
	IF (select idPX from phieuxuat LIMIT 1) is null THEN
		SET NEW.idPX = "PX001";
    ELSE
		SET NEW.idPX = concat("PX",maxid_PX());
	END IF;
END;

//
DELIMITER ;

-- 17 trigger insert vào ctphieuxuat sau khi thêm phiếu xuất

DELIMITER //

create TRIGGER insert_ctphieuxuat
AFTER insert ON phieuxuat
FOR EACH ROW
BEGIN
  INSERT INTO ctphieuxuat (idCTPX,idPX, idCT, idHT) VALUES (concat(day(now()),month(now())),NEW.idPX, NULL, NULL);
END;
//
DELIMITER ;

-- 18 update trangthai sau khi update ct phiếu xuất

DELIMITER //

CREATE TRIGGER update_idTT_XK
AFTER UPDATE ON ctphieuxuat
FOR EACH ROW
BEGIN
  UPDATE hanghoa SET idTT = "XK" WHERE idHH = (SELECT idHH FROM chitiet WHERE idCT = NEW.idCT);
END;
//      
DELIMITER ;




