/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import controlador.Server;
import controlador.Usuario;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sortkrage
 */
public class Persistencia {

    Connection cn;
    Server s;

    public Persistencia() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            this.s = new Server();

        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IOException ex) {
            Logger.getLogger(Persistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.cn = DriverManager.getConnection("jdbc:mysql://localhost/EndOfCourse", "root", "");

    }

    public boolean credenciales(String usu, String pass) throws SQLException {
        boolean val = true;

        pass = getSHA(pass);

        PreparedStatement ps = cn.prepareStatement("SELECT Contrasenia FROM Usuario WHERE Nick = ? ");
        ps.setString(1, usu);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            if (!rs.getString("Contrasenia").equals(pass)) {

                val = false;

            }

        } else {

            val = false;

        }

        return val;
    }

    public static String getSHA(String input) {

        try {

            MessageDigest md = MessageDigest.getInstance("SHA-256");

            byte[] messageDigest = md.digest(input.getBytes());

            BigInteger no = new BigInteger(1, messageDigest);

            String hashtext = no.toString(16);

            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }

            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            System.out.println("Exception thrown"
                    + " for incorrect algorithm: " + e);

            return null;
        }
    }

    public Usuario getUsuario(Usuario usu) throws SQLException {
        Usuario u = new Usuario();

        PreparedStatement ps = cn.prepareStatement("SELECT *  FROM Usuario WHERE Nick = ?");
        ps.setString(1, usu.getNick());

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            u.setId(rs.getInt("ID"));
            u.setNick(usu.getNick());
            u.setNombre(rs.getString("Nombre"));
            u.setApellido(rs.getString("Apellido"));
            u.setPass(rs.getString("Contrasenia"));

        }

        return u;
    }

    public void cambiarPass(Usuario usu, String pass) throws SQLException {

        cn.setAutoCommit(false);

        PreparedStatement ps = cn.prepareStatement("UPDATE Usuario SET Contrasenia = ? WHERE ID = ?");
        ps.setString(1, getSHA(pass));
        ps.setInt(2, usu.getId());

        ps.executeUpdate();

        cn.commit();
        cn.setAutoCommit(true);
    }

    public void actualizarUsu(int id, Usuario nUsu) throws SQLException {

        cn.setAutoCommit(false);

        PreparedStatement ps = cn.prepareStatement("UPDATE Usuario SET Nick = ?,"
                + "Nombre = ?, Apellido = ? WHERE ID = ?");
        ps.setString(1, nUsu.getNick());
        ps.setString(2, nUsu.getNombre());
        ps.setString(3, nUsu.getApellido());
        ps.setInt(4, id);
        ps.executeUpdate();

        cn.commit();
        cn.setAutoCommit(true);

    }

    public boolean comprobarNick(String nick) throws SQLException {
        boolean existe = false;

        PreparedStatement ps = cn.prepareStatement("SELECT *  FROM Usuario WHERE Nick = ?");
        ps.setString(1, nick);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            existe = true;
        }

        return existe;
    }

    public void guardarUsu(Usuario u) throws SQLException {

        cn.setAutoCommit(false);

        PreparedStatement ps = cn.prepareStatement("INSERT INTO Usuario VALUES (?,?,?,?,NULL)");
        ps.setString(1, u.getNombre());
        ps.setString(2, u.getApellido());
        ps.setString(3, u.getNick());
        ps.setString(4, getSHA(u.getPass()));

        ps.executeUpdate();
        cn.commit();

        cn.setAutoCommit(true);

    }

}
