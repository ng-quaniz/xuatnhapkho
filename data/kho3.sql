  create table nhanvien (
	  idNV char(5) not null ,
    tenNV nvarchar(100),
    sdtNV char(10),
	  cmndNV char(20),
    emailNV char(50),
    diachiNV nvarchar(100),
    primary key(idNV)
    );

  create table khachhang (
	  idKH  char(5) not null,
    tenKH nvarchar(100),
    sdtKH char(10),
	  cmndKH char(20),
    emailKH char(50),
    diachiKH nvarchar(100),
    primary key(idKH)
 );

   create table loaichua (
    idLC int not null AUTO_INCREMENT,
    tenLC nvarchar(100),
    giaThanh decimal,
    PRIMARY KEY (idLC)
);

  create table loaihang (
    idLH char(2),
    tenLH nvarchar(100),
    PRIMARY KEY (idLH)
);

  create table trangthai (
    idTT char(2) not null,
    trangthai nvarchar(100),
    PRIMARY KEY (idTT)
);

 create table hanghoa (
  idHH char(6) not null,
  idLC int,
  idLH char(2),
  tenHH nvarchar(100),
  cannang int,
  idTT char(2),
  ghichu nvarchar(100),
  PRIMARY KEY (idHH),
  FOREIGN KEY (idLC)
  REFERENCES loaichua(idLC)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (idLH)
  REFERENCES loaihang(idLH)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (idTT)
  REFERENCES trangthai(idTT)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

 create table chitiet (
	idCT char(11) not null,
  idHH char(6) not null,
  idKH char(5) null,
  idNV char(5),
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

   create table hinhthuc(
    idHT char(2) not null,
    hinhthuc nvarchar(100),
    PRIMARY KEY (idHT)
);

  create table phieunhap (
	  idPN char(5) not null ,
   ngaynhap datetime,
   idNV  char(5),
    primary key(idPN),
    FOREIGN KEY (idNV)
  REFERENCES nhanvien(idNV)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );
 
 
  create table ctphieunhap (
  idCTPN char(17) not null,
	idPN char(5) not null,
   idCT char(11)  null UNIQUE,
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
	idPX char(5) not null,
   ngayxuat datetime,
   idNV char(5),
    primary key(idPX),
    FOREIGN KEY (idNV)
  REFERENCES nhanvien(idNV)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 );
 

  create table ctphieuxuat (
  idCTPX char(17) not null,
	idPX char(5) not null,
  idCT char(11) null UNIQUE,
  idHT char(2) null,
    primary key(idCTPX),
    FOREIGN KEY (idPX)
  REFERENCES phieuxuat(idPX)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
     FOREIGN KEY (idCT)
       REFERENCES chitiet(idCT)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
       FOREIGN KEY (idHT)
       REFERENCES hinhthuc(idHT)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  
 );
 
      insert into nhanvien (idNV,tenNV,sdtNV,cmndNV,emailNV,diachiNV) 
  values ("","Nguyễn Hồng Quân", "0369743256","123456789","nh@gmail.com","Đà Nẵng"),
  ("","Trương Bảo Phúc", "0369743256","123456789","tp@gmail.com","Đà Nẵng"),
  ("","Lê Na", "0369743256","123456789","n@gmail.com","Đà Nẵng"),
  ("","Nguyễn Minh Lợi", "0369743256","123456789","nl@gmail.com","Đà Nẵng");


 
 insert into loaichua(tenLC,giaThanh) 
 values ("Container", 1000000),
 ("Thùng to", 50000),
 ("Thùng vừa", 25000),
  ("Palet", 200000)

  insert into loaihang(idLH, tenLH) 
  values ("TP", "Thực phẩm"),
  ("GD", "Đồ gia dụng"),
  ("DT", "Đồ điện tử"),
  ("TT", "Thời trang và phụ kiện"),
  ("VL", "Vật liệu"),
  ("CN", "Công nghiệp"),
  ("NN", "Nông nghiệp"),
  ("PT", "Phương tiện và phụ tùng"),
  ("TD", "Hàng tiêu dùng");

insert into trangthai (idTT,trangthai)
  values ("CD","Chưa duyệt"),
  ("DD","Đã duyệt"),
  ("NK","Nhập kho"),
    ("XK","Xuất kho");
    


insert into kho (tenKho)
values ("Ngoài trời A"),
("Trong nhà B"),
("Trong nhà C");


insert into khu (idkhu,tenkhu,idkho)
values ("AA","Khu AA",1),
("AB","Khu AB",1),
("AC","Khu AC",1),
("BA","Khu BA",2),
("BB","Khu BB",2),
("BC","Khu BC",2),
("CA","Khu CA",3),
("CB","Khu CB",3),
("CC","Khu CC",3);

insert into hinhthuc (idHT,hinhthuc)
values ("VC","Vận chuyển bộ"),
("NN","Nhận ngay");


    insert into khachhang (idKH,tenKH,sdtKH,cmndKH,emailKH,diachiKH)
  values ("","Nguyễn Hồng A", "0369743256","123456789","nhq@gmail.com","Đà Nẵng"),
  ("","Trương Bảo B", "0369743256","123456789","tbp@gmail.com","Đà Nẵng"),
  ("","Lê C", "0369743256","123456789","Đà Nẵng","ln@gmail.com"),
  ("","Nguyễn Minh D", "0369743256","123456789","nml@gmail.com","Đà Nẵng");
 
     insert into hanghoa (idHH,idLH,idLC,tenHH,cannang,idTT,ghichu)
values ("","DT","2","Máy tính",1000,"CD",""),
("","DT","1","Máy tính",1000,"CD",""),
("","VL","2","Xi măng",1000,"CD",""),
("","TP","2","Gạo",1000,"CD",""),
("","CN","3","Máy may",1000,"CD",""),
("","GD","3","Bàn",1000,"CD",""),
("","GD","2","Ghế",1000,"CD",""),
("","PT","1","Ô tô",1000,"CD",""),
("","NN","4","Phân bón",1000,"CD","")

