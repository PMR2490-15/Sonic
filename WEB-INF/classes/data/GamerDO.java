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
public class GamerDO {
    
    private int _usuario_id;
    private String _nome;
    private String _cpf;
    private String _email;
    private String _telefone;
    private String _cidade;
    private String _foto;
    private String _suspenso_ate;
    private String _ativo;

    public int getUsuario_Id() {
        return _usuario_id;
    }

    public void setUsuario_Id(int _usuario_id) {
        this._usuario_id = _usuario_id;
    }

    public String getNome() {
        return _nome;
    }

    public void setNome(String _nome) {
        this._nome = _nome;
    }

     public String getCpf() {
        return _cpf;
    }

    public void setCpf(String _cpf) {
        this._cpf = _cpf;
    }

    public String getEmail() {
        return _email;
    }

    public void setEmail(String _email) {
        this._email = _email;
    }
    
     public String getTelefone() {
        return _telefone;
    }

    public void setTelefone(String _telefone) {
        this._telefone = _telefone;
    }
    
     public String getCidade() {
        return _cidade;
    }

    public void setCidade(String _cidade) {
        this._cidade = _cidade;
    }
    
     public String getFoto() {
        return _foto;
    }

    public void setFoto(String _foto) {
        this._foto = _foto;
    }
    
     public String getSuspenso_ate() {
        return _suspenso_ate;
    }

    public void setSuspenso_ate(String _suspenso_ate) {
        this._suspenso_ate = _suspenso_ate;
    }
    
     public String getAtivo() {
        return _ativo;
    }

    public void setAtivo(String _ativo) {
        this._ativo = _ativo;
    }
    
}
