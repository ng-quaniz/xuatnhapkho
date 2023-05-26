/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ng782
 */
public class DHNK {
    private String id;
    private String ten;
    private String loai;
    private String ngaytao;
    private String kho;
    private String khu;
    
    public DHNK(){}

    public DHNK(String id, String ten, String loai, String ngaytao, String kho, String khu) {
        this.id = id;
        this.ten = ten;
        this.loai = loai;
        this.ngaytao = ngaytao;
        this.kho = kho;
        this.khu = khu;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public String getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(String ngaytao) {
        this.ngaytao = ngaytao;
    }

    public String getKho() {
        return kho;
    }

    public void setKho(String kho) {
        this.kho = kho;
    }

    public String getKhu() {
        return khu;
    }

    public void setKhu(String khu) {
        this.khu = khu;
    }

    @Override
    public String toString() {
        return "DHNK{" + "id=" + id + ", ten=" + ten + ", loai=" + loai + ", ngaytao=" + ngaytao + ", kho=" + kho + ", khu=" + khu + '}';
    }
    
    

}
