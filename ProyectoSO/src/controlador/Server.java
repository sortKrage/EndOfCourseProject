/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.BufferedOutputStream;
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
        client.connect("192.168.1.48");

    }

    public ListModel<String> cargarLista() throws IOException {

        Object[] list = client.listNames();

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

}
