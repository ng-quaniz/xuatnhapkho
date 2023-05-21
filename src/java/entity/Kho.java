/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ng782
 */
public class Kho {
    private String kho;
    private String khu;

    public Kho(){}

    public Kho(String kho, String khu) {
        this.kho = kho;
        this.khu = khu;
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
        return "Kho{" + "kho=" + kho + ", khu=" + khu + '}';
    }
    
    
}
