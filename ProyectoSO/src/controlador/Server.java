/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;
import javax.swing.ListModel;
import org.apache.commons.net.ftp.FTPClient;

/**
 *
 * @author sortkrage
 */
public class Server {

    FTPClient client;

    public Server() throws IOException {
        this.client = new FTPClient();
        client.connect("192.168.1.48", 21);
        client.login("anonymous", "");
        System.out.println(client.getReplyString());

    }

    public ListModel<String> cargarLista() throws IOException {

        Object[] list = client.listNames();

        if (list == null) {

            JOptionPane.showMessageDialog(null, "OHOHOH");

        }

        DefaultListModel dlm = new DefaultListModel();

        for (Object object : list) {

            dlm.addElement(object);

        }

        return dlm;
    }

    public boolean download(String name, String path) throws IOException {

        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + "/" + name));

        return client.retrieveFile(name, bos);
    }

    public boolean crearRegistro(String nick) throws FileNotFoundException, IOException {

        File f = new File("prop/" + nick + ".properties");

        f.createNewFile();

        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));

        return client.storeFile(nick, bis);
    }

}
