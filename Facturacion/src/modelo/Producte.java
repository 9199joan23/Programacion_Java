/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author 9199.joan23
 */
public class Producte {
    
      private int pro_id;
    private String pro_nombre;

    public int getPro_categoria() {
        return pro_categoria;
    }

    public void setPro_categoria(int pro_categoria) {
        this.pro_categoria = pro_categoria;
    }
    private double pro_precio;
     private int pro_stok;
     private int pro_categoria;

    public Producte() {
    }

    public Producte(String pro_nombre, double pro_precio, int pro_categoria) {
        this.pro_nombre = pro_nombre;
        this.pro_precio = pro_precio;
        this.pro_categoria = pro_categoria;
    }

    

    public Producte(int pro_id, String pro_nombre, double pro_precio, int pro_stok) {
        this.pro_id = pro_id;
        this.pro_nombre = pro_nombre;
        this.pro_precio = pro_precio;
        this.pro_stok = pro_stok;
    }

    public int getPro_id() {
        return pro_id;
    }

    public String getPro_nombre() {
        return pro_nombre;
    }

    public double getPro_precio() {
        return pro_precio;
    }

    public double getPro_stok() {
        return pro_stok;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public void setPro_nombre(String pro_nombre) {
        this.pro_nombre = pro_nombre;
    }

    public void setPro_precio(double pro_precio) {
        this.pro_precio = pro_precio;
    }

    public void setPro_stok(int pro_stok) {
        this.pro_stok = pro_stok;
    }
   
     
     
    
    
}
