/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author Giovanni
 */
public class UsuarioDO {
    
 private int _id;
    private String _nome_usuario;
    private String _senha;
    private int _tipo;

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getNome_Usuario() {
        return _nome_usuario;
    }

    public void setNome_Usuario(String _nome_usuario) {
        this._nome_usuario = _nome_usuario;
    }

     public String getsenha() {
        return _senha;
    }

    public void setsenha(String _senha) {
        this._senha = _senha;
    }

    public int getTipo() {
        return _tipo;
    }

    public void setTipo(int _tipo) {
        this._tipo = _tipo;
    }
    
}
