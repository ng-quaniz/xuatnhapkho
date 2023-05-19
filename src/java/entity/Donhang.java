/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ng782
 */
public class Donhang {
    private int id;
    private String ten;
    private String loai;
    private String trangthai;
    private String ngaytao;

    
    
    
   public Donhang(){}

    public Donhang(int id, String ten, String loai, String trangthai, String ngaytao) {
        this.id = id;
        this.ten = ten;
        this.loai = loai;
        this.trangthai = trangthai;
        this.ngaytao = ngaytao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public String getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(String ngaytao) {
        this.ngaytao = ngaytao;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Donhang{");
        sb.append("id=").append(id);
        sb.append(", ten=").append(ten);
        sb.append(", loai=").append(loai);
        sb.append(", trangthai=").append(trangthai);
        sb.append(", ngaytao=").append(ngaytao);
        sb.append('}');
        return sb.toString();
    }

  
   
}
