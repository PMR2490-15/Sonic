/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author leonardo.monteiro
 */
public class Classe_Item {
    private int _id;
    private String _nome;
    private String _produtora;
    private int _tipo;
    private String _lancamento;

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getNome() {
        return _nome;
    }

    public void setNome(String _nome) {
        this._nome = _nome;
    }

    public int getTipo() {
        return _tipo;
    }

    public void setTipo(int _tipo) {
        this._tipo = _tipo;
    }

    public String getLancamento() {
        return _lancamento;
    }

    public void setLancamento(String _lancamento) {
        this._lancamento = _lancamento;
    }

    public String getProdutora() {
        return _produtora;
    }

    public void setProdutora(String _produtora) {
        this._produtora = _produtora;
    }
    
    
    
    
}
