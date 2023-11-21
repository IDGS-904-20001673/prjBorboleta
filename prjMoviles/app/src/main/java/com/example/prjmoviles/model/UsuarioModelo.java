package com.example.prjmoviles.model;

public class UsuarioModelo {
    /**
     * @return the nombre
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the nombre to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**

     * @return the contrasena
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     * @param contrasena the contrasena to set
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }


    public String getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(String usuario_id) {
        this.usuario_id = usuario_id;
    }

    private String usuario_id;
    private String usuario;
    private String contrasena;
}


