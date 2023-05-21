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
        String query = "select idCT, tenHang , tenKhachHang, trangthai, ngaytao\n" +
"from chitiet as ct\n" +
"join hanghoa as hh on ct.idHH = hh.idHH\n" +
"join khachhang as kh on ct.idKH = kh.idKH\n" +
"join trangthai as tt on hh.idTT = tt.idTT\n" +
"order by idCT asc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Donhang (rs.getInt(1),
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
        String query = "select chitiet.idCT, hanghoa.tenHang, loaihanghoa.tenLoai, chitiet.ngaytao \n" +
"from chitiet, hanghoa, loaihanghoa where chitiet.idHH=hanghoa.idHH and hanghoa.idLoai=loaihanghoa.idLoai and hanghoa.idTT=\"DD\"\n"+
"order by idCT asc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Donhang (rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
       }
       
              public List<DHNK> getAllDonhangNK() {
        List<DHNK> list = new ArrayList<>();
        String query = "select ct.idCT, tenHang, tenLoai, ngayNhap, tenKho, tenKhu\n" +
"from ctphieunhap ctpn\n" +
"inner join phieunhap pn on ctpn.idPN = pn.idPN\n" +
"inner join chitiet ct on ctpn.idCT = ct.idCT\n" +
"inner join hanghoa hh on ct.idHH = hh.idHH\n" +
"inner join loaihanghoa lh on hh.idLoai = lh.idLoai\n" +
"inner join khu k on ctpn.idkhu = k.idkhu\n" +
"inner join kho kh on k.idkho = kh.idkho\n"+
"order by idCT asc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DHNK (rs.getInt(1),
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
       
       public void insertHang(String loai, String name, String kg, String tt, String gchu) {
        String query = "INSERT INTO `hanghoa` \n" +
"(`idLoai`, `tenHang`, `cannang`, `idTT`, `ghichu`)\n" +
"VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, loai);
            ps.setString(2, name);
            ps.setString(3, kg);
            ps.setString(4, tt);
            ps.setString(5, gchu);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
       
       public void insertKH(String name, String sdt, String cmnd, String email, String diachi) {
        String query = "INSERT INTO `khachhang` \n" +
"(`tenKhachHang`, `sdt`, `cmnd`, `email`, `diachi`)\n" +
"VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, sdt);
            ps.setString(3, cmnd);
            ps.setString(4, email);
            ps.setString(5, diachi);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
       
       public List<Loai> getLoai() {
        List<Loai> list = new ArrayList<>();
        String query = "select * from loaihanghoa";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Loai (rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;

}
       
           public Nguoi getKhachByID(String id) {
        String query = "select khachhang.idKH, khachhang.tenKhachHang, khachhang.sdt, khachhang.cmnd, khachhang.email, khachhang.diachi\n" +
"from khachhang, chitiet\n" +
"where khachhang.idKH=chitiet.idKH and chitiet.idCT=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Nguoi(rs.getInt(1),
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
           
           
           public void insertPN() {
        String query = "INSERT INTO kho.phieunhap (ngaynhap, idNV)\n" +
"          VALUES (NOW(), 1)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
           
             public void insertCTPN(int idCT, String ghichu, String idkhu) {
        String query = "UPDATE ctphieunhap SET idCT = ?, ghichu = ?, idkhu = ? WHERE idCT is NULL";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, idCT);
            ps.setString(2, ghichu);
            ps.setString(3, idkhu);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

 
}
