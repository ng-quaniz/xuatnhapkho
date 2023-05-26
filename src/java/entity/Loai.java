/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ng782
 */
public class Loai {
       private String idl;
       private String loai;
       
       Loai(){}

    public Loai(String idl, String loai) {
        this.idl = idl;
        this.loai = loai;
    }

    public String getIdl() {
        return idl;
    }

    public void setIdl(String idl) {
        this.idl = idl;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    @Override
    public String toString() {
        return "Loai{" + "idl=" + idl + ", loai=" + loai + '}';
    }
       
       
}
