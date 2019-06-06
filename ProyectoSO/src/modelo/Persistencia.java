/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author sortkrage
 */
public class Persistencia {

    Connection cn;

    public Persistencia() throws SQLException {
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

}
