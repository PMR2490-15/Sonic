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
    private String _pergunta;
    private String _resposta;

    public int getId() {
        return _id;
    }

    public void setId(int id) {
        _id = id;
    }

    public String getNome_Usuario() {
        return _nome_usuario;
    }

    public void setNome_Usuario(String nome_usuario) {
        _nome_usuario = nome_usuario;
    }

     public String getSenha() {
        return _senha;
    }

    public void setSenha(String senha) {
        _senha = senha;
    }

    public int getTipo() {
        return _tipo;
    }

    public void setTipo(int tipo) {
        _tipo = tipo;
    }
    
    public String getPergunta() {
        return _pergunta;
    }
    
    public void setPergunta(String pergunta) {
        _pergunta = pergunta;
    }
    
    public String getResposta() {
        return _resposta;
    }
    
    public void setResposta(String resposta) {
        _resposta = resposta;
    }
}
