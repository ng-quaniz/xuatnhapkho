/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


public class Hang {
    private int id;
    private String ten;
    private int loai;
    private int cannang;
    
    Hang(){}

    public Hang(int id, String ten, int loai, int cannang) {
        this.id = id;
        this.ten = ten;
        this.loai = loai;
        this.cannang = cannang;
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

    public int getLoai() {
        return loai;
    }

    public void setLoai(int loai) {
        this.loai = loai;
    }

    public int getCannang() {
        return cannang;
    }

    public void setCannang(int cannang) {
        this.cannang = cannang;
    }

    @Override
    public String toString() {
        return "Hang{" + "id=" + id + ", ten=" + ten + ", loai=" + loai + ", cannang=" + cannang + '}';
    }
    
    
}
