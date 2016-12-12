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
public class Client {
    //atributos
     private int cli_id;
    private String cli_nom;
    private double cli_tlf;
    private String cli_nif;
//constructor
    public Client(int cli_id, String cli_nom, double cli_tlf, String cli_nif) {
        this.cli_id = cli_id;
        this.cli_nom = cli_nom;
        this.cli_tlf = cli_tlf;
        this.cli_nif = cli_nif;
    }

    public Client(String cli_nom, String cli_nif) {
        this.cli_nom = cli_nom;
        this.cli_nif = cli_nif;
    }

    public Client() {
    }
//Getters
    public int getCli_id() {
        return cli_id;
    }

    public String getCli_nom() {
        return cli_nom;
    }

    public double getCli_tlf() {
        return cli_tlf;
    }

    public String getCli_nif() {
        return cli_nif;
    }
//setters
    public void setCli_id(int cli_id) {
        this.cli_id = cli_id;
    }

    public void setCli_nom(String cli_nom) {
        this.cli_nom = cli_nom;
    }

    public void setCli_tlf(double cli_tlf) {
        this.cli_tlf = cli_tlf;
    }

    public void setCli_nif(String cli_nif) {
        this.cli_nif = cli_nif;
    }
  
    
}
