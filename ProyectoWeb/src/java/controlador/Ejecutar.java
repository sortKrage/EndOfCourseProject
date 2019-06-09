/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sortkrage
 */
public class Ejecutar {

    String path;
    private ProcessBuilder pb;

    public Ejecutar(String path) throws IOException {
        this.path = path;

    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void launch() throws IOException {

        pb = new ProcessBuilder(path);
        pb.start();

    }

}
