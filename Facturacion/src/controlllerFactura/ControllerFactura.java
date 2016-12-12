/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlllerFactura;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import modelo.Client;
import modelo.Conexion;
import modelo.Producte;

/**
 *
 * @author 9199.joan23
 */
public class ControllerFactura {

    public ControllerFactura() {
    }

    public DefaultTableModel mostrarProducto() {
        DefaultTableModel muestra = null;

        //1. conectarme
        Conexion conectar = new Conexion();
        Connection cn = conectar.conec();

        String sql = "Select * From tbl_producte";
        Statement st = null;
        String vectorProducto[] = new String[4];
        String vectorProducto1[] = new String[4];
        vectorProducto1[0] = "pro_id";
        vectorProducto1[1] = "pro_nombre";
        vectorProducto1[2] = "pro_precio";
        vectorProducto1[3] = "pro_stock";
        
        muestra=new DefaultTableModel(null, vectorProducto1);
//String[] vectorProducto; De otra manera definir el vector

        try {

            st = cn.createStatement();

            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

                vectorProducto[0] = String.valueOf(rs.getInt("pro_id"));
                vectorProducto[1] = rs.getString("pro_nombre");
                vectorProducto[2] = String.valueOf(rs.getInt("pro_precio"));
                vectorProducto[3] = String.valueOf(rs.getInt("pro_stock"));
                muestra.addRow(vectorProducto);
            }
        } catch (Exception e) {
        }

        return muestra;
    }

    public void crearClinete(Client C) {
        //1. conectarme
        Conexion conectar = new Conexion();
        Connection cn = conectar.conec();

        try {
            CallableStatement clientenuevo = cn.prepareCall("{call spcrearCliente(?,?)}");

            clientenuevo.setString(1, "david");
            clientenuevo.setString(2, "65556565957");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Conexion erronea");
        }
    }

    public void addProducteClient(Producte p, Client c) {
        //1. conectarme
        Conexion conectar = new Conexion();
        Connection cn = conectar.conec();
        //creamos la primera consulta sql
        String sql1 = "INSERT INTO tbl_producte (pro_nombre, pro_precio ,pro_stock) VALUES (?,?,?)";

        //Creamos la segunda sentencia
        String sql2 = "INSERT INTO tbl_client (cli_nom, cli_nif) VALUES (?,?)";

        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        try {
            //solo hace una sentencia sql (false) hace dos sentencias (true)
            cn.setAutoCommit(false);

            pst1 = cn.prepareStatement(sql1);

            pst1.setString(1, p.getPro_nombre());
            pst1.setDouble(2, p.getPro_precio());
            pst1.setDouble(3, p.getPro_stok());

            pst2 = cn.prepareStatement(sql2);

            pst2.setString(1, c.getCli_nom());
            pst2.setString(2, c.getCli_nif());

            pst1.executeUpdate();
            pst2.executeUpdate();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Conexion erronea");
            try {
                cn.rollback();
            } catch (SQLException ex) {
            }
        }
    }

    public void addProducte(Producte p) {

        //1. conectarme
        Conexion conectar = new Conexion();
        Connection cn = conectar.conec();
        //Creo consulta con interrogantes
        String sql = "INSERT INTO tbl_producte (pro_nombre, pro_precio ,pro_stock) VALUES (?,?,?)";
        PreparedStatement pst = null;
        try {
            // Creamos el pst, para pasar los parametros a la consulta
            pst = cn.prepareStatement(sql);
            //montar tabla para insertar en la bd
            System.out.println("He llegado aqui");
            pst.setString(1, p.getPro_nombre());
            pst.setDouble(2, p.getPro_precio());
            pst.setDouble(3, p.getPro_stok());
            // ejecutamos la consulta del pst
            //pst.executeUpdate();

            //variable para comprobar que hace la conexion, ya que 'pst.executeUpdate();' devuelve 1 o 0. Falso o verdadero
            int n = pst.executeUpdate();
            System.out.println("He llegado aqui2");
            if (n != 0) {

                JOptionPane.showMessageDialog(null, "Se han insertado los datos correctamente");

            } else {
                JOptionPane.showMessageDialog(null, "No se han insertado los datos");

            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Conexion erronea");
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Conexion no cerrada");
            }

        }
    }

    public void addClient(Client c) {

        //1. conectarme
        Conexion conectar = new Conexion();
        Connection cn = conectar.conec();
        //Creo consulta con interrogantes
        String sql = "INSERT INTO tbl_client (cli_nom, cli_nif) VALUES (?,?)";
//String sql = "INSERT INTO tbl_alumno (alu_nom, alu_apellido1, alu_apellido2, alu_correo) VALUES ( 'Eric','Petit','Fernandez','eric@gmail.com')";  
        PreparedStatement pst = null;
        try {
            // Creamos el pst, para pasar los parametros a la consulta
            pst = cn.prepareStatement(sql);
            //montar tabla para insertar en la bd
            System.out.println("He llegado aqui");
            pst.setString(1, c.getCli_nom());
            pst.setString(2, c.getCli_nif());

            // ejecutamos la consulta del pst
            //pst.executeUpdate();
            //variable para comprobar que hace la conexion, ya que 'pst.executeUpdate();' devuelve 1 o 0. Falso o verdadero
            int n = pst.executeUpdate();
            System.out.println("He llegado aqui2");
            if (n != 0) {

                JOptionPane.showMessageDialog(null, "Se han insertado los datos correctamente");

            } else {
                JOptionPane.showMessageDialog(null, "No se han insertado los datos");

            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Conexion erronea");
        } finally {
            try {
                cn.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Conexion no cerrada");
            }
        }

    }

}
