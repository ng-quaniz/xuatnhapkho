/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ng782
 */
public class Nguoi {
    private int id;
    private String ten;
    private int sdt;
    private int cmnd;
    private String email;
    private String diachi;
    
    public Nguoi(){
    }

    public Nguoi(int id, String ten, int sdt, int cmnd, String email, String diachi) {
        this.id = id;
        this.ten = ten;
        this.sdt = sdt;
        this.cmnd = cmnd;
        this.email = email;
        this.diachi = diachi;
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

    public int getSdt() {
        return sdt;
    }

    public void setSdt(int sdt) {
        this.sdt = sdt;
    }

    public int getCmnd() {
        return cmnd;
    }

    public void setCmnd(int cmnd) {
        this.cmnd = cmnd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    @Override
    public String toString() {
        return "Nguoi{" + "id=" + id + ", ten=" + ten + ", sdt=" + sdt + ", cmnd=" + cmnd + ", email=" + email + ", diachi=" + diachi + '}';
    }
    
    
    
}
    
  

