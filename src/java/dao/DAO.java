 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.DHNK;
import entity.Donhang;
import entity.Loai;
import entity.Nguoi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
      public List<Donhang> getAllDonhang() {
        List<Donhang> list = new ArrayList<>();
        String query = "SELECT ct.idCT, hh.tenHH, kh.tenKH, tt.trangthai, ct.ngaytao\n" +
"FROM chitiet AS ct\n" +
"JOIN hanghoa AS hh ON ct.idHH = hh.idHH\n" +
"JOIN khachhang AS kh ON ct.idKH = kh.idKH\n" +
"JOIN trangthai AS tt ON hh.idTT = tt.idTT\n" +
"ORDER BY ct.ngaytao DESC;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Donhang (rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (SQLException e) {
        }
        return list;

}
      
            public List<Donhang> getDonhang(String sa) {
        List<Donhang> list = new ArrayList<>();
        String query = "SELECT ct.idCT, hh.tenHH, kh.tenKH, tt.trangthai, ct.ngaytao\n" +
"FROM chitiet AS ct\n" +
"JOIN hanghoa AS hh ON ct.idHH = hh.idHH\n" +
"JOIN khachhang AS kh ON ct.idKH = kh.idKH\n" +
"JOIN trangthai AS tt ON hh.idTT = tt.idTT\n" +
"where idCT like concat(\"%\",?,\"%\")\n" +
"ORDER BY ct.ngaytao DESC;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
             ps.setString(1, sa);
            rs = ps.executeQuery();
           
            while (rs.next()) {
                list.add(new Donhang (rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (SQLException e) {
        }
        return list;

}
      
      
       public List<Donhang> getAllDonhangDD() {
        List<Donhang> list = new ArrayList<>();
        String query = "select idCT, tenHH, tenLH, tenLC, cannang\n" +
"from chitiet, hanghoa, loaihang, loaichua\n" +
"where chitiet.idHH = hanghoa.idHH and hanghoa.idLH = loaihang.idLH and hanghoa.idLC = loaichua.idLC and hanghoa.idTT = \"DD\" ORDER BY ngaytao DESC;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Donhang (rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
       }
       
              public List<DHNK> getAllDonhangNK() {
        List<DHNK> list = new ArrayList<>();
        String query = "SELECT ct.idCT, tenHH, concat(tenLH,\"-\",tenLC), ngayNhap, tenKho, tenKhu\n" +
"FROM ctphieunhap ctpn\n" +
"INNER JOIN phieunhap pn ON ctpn.idPN = pn.idPN\n" +
"INNER JOIN chitiet ct ON ctpn.idCT = ct.idCT\n" +
"INNER JOIN hanghoa hh ON ct.idHH = hh.idHH\n" +
"INNER JOIN loaihang lh ON hh.idLH = lh.idLH\n" +
"INNER JOIN loaichua lc ON hh.idLC = lc.idLC\n" +
"INNER JOIN khu k ON ctpn.idkhu = k.idkhu\n" +
"INNER JOIN kho kh ON k.idkho = kh.idkho\n" +
"WHERE idTT = \"NK\"\n" +
"ORDER BY ngayNhap DESC;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DHNK (rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
       }
       
       public void insertHang(String loaiH, String loaiC, String name, String kg, String tt) {
        String query = "INSERT INTO `hanghoa` \n" +
"(idHH,idLH,idLC,tenHH,cannang,idTT,ghichu)\n" +
"values (?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "");
            ps.setString(2, loaiH);
            ps.setString(3, loaiC);
            ps.setString(4, name);
            ps.setString(5, kg);
            ps.setString(6, tt);
            ps.setString(7, "");
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
       
       public void insertKH(String name, String sdt, String cmnd, String email, String diachi) {
        String query = "INSERT INTO `khachhang` \n" +
"(idKH,tenKH,sdtKH,cmndKH,emailKH,diachiKH)\n" +
"VALUES ( ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "");
            ps.setString(2, name);
            ps.setString(3, sdt);
            ps.setString(4, cmnd);
            ps.setString(5, email);
            ps.setString(6, diachi);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
       
       public List<Loai> getLoaiH() {
        List<Loai> list = new ArrayList<>();
        String query = "select * from loaihang ORDER BY idLH ASC";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Loai (rs.getString(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;

}
        public List<Loai> getLoaiC() {
        List<Loai> list = new ArrayList<>();
        String query = "select * from loaichua";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Loai (rs.getString(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;

}
       
//           public Nguoi getKhachByID(String id) {
//        String query = "select khachhang.idKH, khachhang.tenKhachHang, khachhang.sdt, khachhang.cmnd, khachhang.email, khachhang.diachi\n" +
//"from khachhang, chitiet\n" +
//"where khachhang.idKH=chitiet.idKH and chitiet.idCT=?";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setString(1, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return new Nguoi(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getInt(3),
//                        rs.getInt(4),
//                        rs.getString(5),
//                        rs.getString(6));
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }
//           
           
           public void insertPN() {
        String query = "INSERT INTO phieunhap (idPN,ngaynhap, idNV)\n" +
"          VALUES (?,NOW(),?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "");
            ps.setString(2, "NV001");
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
           
             public void insertCTPN(String idCT, String idkhu) {
        String query = "update ctphieunhap set idCTPN = concat(?,?,day(now()),lpad(month(now()),2,0)), idCT = ? , idkhu = ? where idCT is null";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, idCT);
            ps.setString(2, idkhu);
            ps.setString(3, idCT);
            ps.setString(4, idkhu);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

                        public void insertPX() {
        String query = "INSERT INTO phieuxuat (idPX,ngayxuat, idNV)\n" +
"          VALUES ( ?, NOW(), ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "");
            ps.setString(2, "NV001");
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
                        
            public void insertCTPX(String idCT, String hinhthuc) {
        String query = "update ctphieuxuat set idCTPX = concat(?,?,day(now()),lpad(month(now()),2,0)), idCT = ? , idHT = ? where idCT is null";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, idCT);
            ps.setString(2, hinhthuc);
            ps.setString(3, idCT);
            ps.setString(4, hinhthuc);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
 
            
            public Nguoi getKHByID(String id) {
        List<Nguoi> list = new ArrayList<>();
        String query = "select khachhang.idKH, khachhang.tenKH, khachhang.sdtKH, khachhang.cmndKH, khachhang.emailKH, khachhang.diachiKH\n" +
"from khachhang, chitiet\n" +
"where khachhang.idKH = chitiet.idKH and chitiet.idCT = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return new Nguoi(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
            }
            
        public Donhang getHHByID(String id) {

        String query = "SELECT hanghoa.idHH, hanghoa.tenHH, concat(tenLH,\"-\",tenLC), trangthai, cannang\n" +
"FROM hanghoa\n" +
"JOIN chitiet ON hanghoa.idHH = chitiet.idHH\n" +
"JOIN loaihang ON hanghoa.idLH = loaihang.idLH\n" +
"JOIN loaichua ON hanghoa.idLC = loaichua.idLC\n" +
"JOIN trangthai ON hanghoa.idTT = trangthai.idTT\n" +
"WHERE chitiet.idCT = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return new Donhang(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
            }
                        
    public DHNK getPNByID(String id) {

        String query = "SELECT concat(pn.idPN,\"-\",right(ct.idctpn,6)), kho.tenKho, khu.tenkhu, pn.ngaynhap, nhanvien.tenNV\n" +
"FROM phieunhap as pn, kho, khu, nhanvien, ctphieunhap as ct, chitiet\n" +
"WHERE pn.idPN = ct.idPN\n" +
"    AND ct.idkhu = khu.idkhu\n" +
"    AND khu.idkho = kho.idkho\n" +
"    AND pn.idNV = nhanvien.idNV\n" +
"    AND ct.idCT = chitiet.idCT\n" +
"    AND chitiet.idCT = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return new DHNK(rs.getString(1),
                        rs.getString(5),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(2),
                rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
            }
    public Donhang getPXByID(String id) {

        String query = "SELECT concat(px.idPX,\"-\",right(ct.idctpx,6)), hinhthuc, px.ngayxuat, nhanvien.tenNV\n" +
"FROM phieuxuat as px, ctphieuxuat as ct, chitiet, nhanvien , hinhthuc\n" +
"WHERE px.idPX = ct.idPX\n" +
"    AND ct.idCT = chitiet.idCT\n" +
"    AND ct.idHT = hinhthuc.idHT\n" +
"    AND chitiet.idNV = nhanvien.idNV\n" +
"    AND chitiet.idCT = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
               return new Donhang (rs.getString(1),
                        rs.getString(4),
                        rs.getString(2),
                        rs.getString(4),
                        rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
            }
    
    public void deleteCT(String id) {
        String query = "delete from chitiet where idCT = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
  public void editKH(String id, String tenKH, String cmnd, String sdt,
            String email, String diachi) {
        String query = "update khachhang set tenkh = ?, cmndkh = ? ,  sdtkh = ? , emailkh = ? , diachikh = ?  where idKH = (select idKH from chitiet where idCT = ? )";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, tenKH);
            ps.setString(2, cmnd);
            ps.setString(3, sdt);
            ps.setString(4, email);
            ps.setString(5, diachi);
            ps.setString(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void editHH(String id, String tenHH, String cannang) {
        String query ="update hanghoa set tenhh = ? , cannang = ? where idHH = (select idHH from chitiet where idCT = ? );";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, tenHH);
            ps.setString(2, cannang);
            ps.setString(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
