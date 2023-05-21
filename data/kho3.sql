  create table nhanvien (
	  idNV int not null AUTO_INCREMENT,
    tenNV nvarchar(100),
    sdt char(10),
	  cmnd char(20),
    email char(50),
    diachi nvarchar(100),
    primary key(idNV)
    );

  create table khachhang (
	  idKH int not null AUTO_INCREMENT,
    tenKhachHang nvarchar(100),
    sdt char(10),
	  cmnd char(20),
    email char(50),
    diachi nvarchar(100),
    primary key(idKH)
 );

  create table loaihanghoa (
    idLoai int not null AUTO_INCREMENT,
    tenLoai nvarchar(100),
    giaThanh decimal,
    PRIMARY KEY (idLoai)
);

  create table trangthai (
    idTT char(2) not null,
    trangthai nvarchar(100),
    PRIMARY KEY (idTT)
);

 create table hanghoa (
  idHH int not null AUTO_INCREMENT,
  idLoai int,
  tenHang nvarchar(100),
  cannang int,
  idTT char(2),
  ghichu nvarchar(100),
  PRIMARY KEY (idHH),
  FOREIGN KEY (idLoai)
  REFERENCES loaihanghoa(idLoai)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (idTT)
  REFERENCES trangthai(idTT)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
create table chitiet (
	idCT int not null AUTO_INCREMENT,
  idHH int not null,
  idKH int not null,
  idNV int,
  ngaytao datetime,
  PRIMARY KEY (idCT),
  FOREIGN KEY (idHH)
  REFERENCES hanghoa(idHH)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (idKH)
  REFERENCES khachhang(idKH)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (idNV)
  REFERENCES nhanvien(idNV)
  ON DELETE CASCADE
  ON UPDATE CASCADE

  );

  create table kho (
    idKho int NOT NULL AUTO_INCREMENT,
    tenKho nvarchar(100),
    PRIMARY KEY (idKho)
    
);

 create table khu (
  idkhu  CHAR(2) NOT NULL ,
  tenkhu nvarchar(100),
  idkho int,
  PRIMARY KEY (idKhu),
  FOREIGN KEY (idkho)
  REFERENCES kho(idkho)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
  
  create table phieunhap (
	  idPN int NOT NULL AUTO_INCREMENT,
   ngaynhap datetime,
   idNV int,
    primary key(idPN),
    FOREIGN KEY (idNV)
  REFERENCES nhanvien(idNV)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );
 
 
create table ctphieunhap (
  idCTPN int not null AUTO_INCREMENT,
	idPN int not null,
   idCT int null,
   ghichu nvarchar(100) null,
   idkhu char(2) null,
    primary key(idCTPN),
    FOREIGN KEY (idPN)
  REFERENCES phieunhap(idPN)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
     FOREIGN KEY (idCT)
  REFERENCES chitiet(idCT)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
      FOREIGN KEY (idkhu)
  REFERENCES khu(idkhu)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );    
  create table phieuxuat (
	idPX int NOT NULL AUTO_INCREMENT,
   ngayxuat datetime,
   idNV int NOT NULL,
    primary key(idPX),
    FOREIGN KEY (idNV)
  REFERENCES nhanvien(idNV)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );
 

create table ctphieuxuat (
  idCTPX int not null AUTO_INCREMENT,
	idPX int not null,
  idCT int  null,
  hinhthuc nvarchar(100) null,
    primary key(idCTPX),
    FOREIGN KEY (idPX)
  REFERENCES phieuxuat(idPX)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
     FOREIGN KEY (idCT)
       REFERENCES chitiet(idCT)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  
 );
 
 insert into nhanvien (tenNV,sdt,cmnd,email,diachi) 
 values ("Nguyễn Hồng Quân", "0369743256","123456789","nh@gmail.com","Đà Nẵng"),
 ("Trương Bảo Phúc", "0369743256","123456789","tp@gmail.com","Đà Nẵng"),
 ("Lê Na", "0369743256","123456789","n@gmail.com","Đà Nẵng"),
 ("Nguyễn Minh Lợi", "0369743256","123456789","nl@gmail.com","Đà Nẵng")
 
 
insert into khachhang (tenKhachHang,sdt,cmnd,email,diachi) 
 values ("Nguyễn Hồng A", "0369743256","123456789","nhq@gmail.com","Đà Nẵng"),
 ("Trương Bảo B", "0369743256","123456789","tbp@gmail.com","Đà Nẵng"),
 ("Lê C", "0369743256","123456789","Đà Nẵng","ln@gmail.com"),
 ("Nguyễn Minh D", "0369743256","123456789","nml@gmail.com","Đà Nẵng")
 
 
 insert into loaihanghoa (tenLoai,giaThanh) 
 values ("Container", 1000000),
 ("Thùng to", 50000),
 ("Thùng vừa", 25000),
  ("Palet", 200000)

insert into trangthai (idTT,trangthai)
  values ("CD","Chưa duyệt"),
  ("DD","Đã duyệt"),
  ("NK","Nhập kho"),
    ("XK","Xuất kho")
    
insert into hanghoa (idLoai,tenHang,cannang,idTT,ghichu)
values (1,"Máy tính",1000,"CD",""),
(2,"Đồ dùng",100,"CD",""),
(3,"Thực phẩm",50,"DD",""),
(4,"Độc dược",100,"DD",""),
(1,"Dược phẩm",1000,"DD",""),
(2,"Súng",100,"DD",""),
(3,"Hoa",50,"DD",""),
(4,"Xe",100,"DD",""),
(1,"Hàng hóa",1000,"NK",""),
(2,"Sách",100,"NK",""),
(3,"Bàn",50,"NK",""),
(4,"Ghế",100,"NK","")

insert into chitiet (idHH,idKH,idNV,ngaytao)
values (1,1,1,"2021-05-01 00:00:00"),
(2,2,2,"2021-05-01 00:00:00"),
(3,3,3,"2021-05-01 00:00:00"),
(4,4,4,"2021-05-01 00:00:00"),
(5,1,1,"2021-05-01 00:00:00"),
(6,2,2,"2021-05-01 00:00:00"),
(7,4,3,"2021-05-01 00:00:00"),
(8,3,4,"2021-05-01 00:00:00"),
(9,2,1,"2021-05-01 00:00:00"),
(10,1,2,"2021-05-01 00:00:00")


insert into kho (tenKho)
values ("Ngoài trời A"),
("Trong nhà B"),
("Trong nhà C")


insert into khu (idkhu,tenkhu,idkho)
values ("AA,Khu AA",1),
("AB,Khu AB",1),
("AC,Khu AC",1),
("BA,Khu BA",2),
("BB,Khu BB",2),
("BC,Khu BC",2),
("CA,Khu CA",3),
("CB,Khu CB",3),
("CC,Khu CC",3),




CREATE TRIGGER insert_chitiet 
AFTER INSERT ON hanghoa
FOR EACH ROW
BEGIN
  INSERT INTO chitiet (idHH, idKH, idNV, ngaytao)
  VALUES (NEW.idHH, NULL, 1, NOW());
END//
DELIMITER ;


DELIMITER //

CREATE TRIGGER insert_chitiet_KH 
AFTER INSERT ON khachhang
FOR EACH ROW
BEGIN
 update chitiet set idKH=NEW.idKH where idKH is NULL;
END//
DELIMITER ;


DELIMITER //

create TRIGGER insert_ctphieunhap
AFTER INSERT ON phieunhap
FOR EACH ROW
BEGIN
  INSERT INTO ctphieunhap (idPN, idCT, ghichu, idkhu) VALUES (NEW.idPN, NULL, "", NULL);
END;
//
DELIMITER ;


DELIMITER //

CREATE TRIGGER update_idTT
AFTER UPDATE ON ctphieunhap
FOR EACH ROW
BEGIN
  UPDATE hanghoa SET idTT = "NK" WHERE idHH = (SELECT idHH FROM chitiet WHERE idCT = NEW.idCT);
END;
//           

DELIMITER ;

select ct.idCT, tenHang, tenLoai, tenKho, tenKhu, ngayNhap
from ctphieunhap ctpn
inner join phieunhap pn on ctpn.idPN = pn.idPN
inner join chitiet ct on ctpn.idCT = ct.idCT
inner join hanghoa hh on ct.idHH = hh.idHH
inner join loaihanghoa lh on hh.idLoai = lh.idLoai
inner join khu k on ctpn.idkhu = k.idkhu
inner join kho kh on k.idkho = kh.idkho
where idTT = "NK"


