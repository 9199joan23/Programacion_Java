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
public class Factura {
      private int fac_id;
    private double fac_import;
    //private double fac_data;

    public Factura(int fac_id, double fac_import) {
        this.fac_id = fac_id;
        this.fac_import = fac_import;
    }

    public Factura() {
    }

    public int getFac_id() {
        return fac_id;
    }

    public double getFac_import() {
        return fac_import;
    }

    public void setFac_id(int fac_id) {
        this.fac_id = fac_id;
    }

    public void setFac_import(double fac_import) {
        this.fac_import = fac_import;
    }
    
    
}
