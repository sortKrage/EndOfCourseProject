/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Enumeration;
import java.util.Properties;
import javax.swing.DefaultListModel;
import javax.swing.ListModel;

/**
 *
 * @author sortkrage
 */
public class Fichero {

    Properties p;

    public Fichero() throws IOException {
        this.p = new Properties();
        p.load(new InputStreamReader(Fichero.class.getResourceAsStream("Sesion.properties")));
    }

    public String getPath(String name) {
        return String.valueOf(p.get(name));
    }

    public ListModel cargarLista() throws IOException {

        Enumeration<Object> keys = p.keys();
        DefaultListModel dlm = new DefaultListModel();

        while (keys.hasMoreElements()) {
            Object nextElement = keys.nextElement();
            dlm.addElement(nextElement);

        }

        return dlm;
    }

    public void aniadir(String name, String path) throws IOException {

        p.setProperty(name, path);
        p.store(new FileWriter("src/controlador/Sesion.properties"), "Propiedad añadida por el usuario");

    }

}
