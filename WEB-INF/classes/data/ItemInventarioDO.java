package data;

import java.sql.Connection;

/**
 *
 * @author lurosset
 */
public class ItemInventarioDO {
    private int _usuarioId;
    private int _itemId;
    private int _id;
    private int _estado;
    private int _preco;
    private int _tipoTransacao;
    private int _precoPromo;
    private int _limitePromo;
//    private BLOB? _foto;
    
    public int getUsuarioId() {
        return _usuarioId;
    }
    public void setUsuarioId(int id) {
        _usuarioId = id;
    }
    
    public int getItemId() {
        return _itemId;
    }
    public void setItemId(int id) {
        _itemId = id;
    }
    
    public int getId() {
        return _id;
    }
    public void setId(int id) {
        _id = id;
    }
    
    public int getId() {
        return _id;
    }
    public void setId(int id) {
        _id = id;
    }
    
    public int getEstado() {
        return _estado;
    }
    public void setEstado(int estado) {
        _estado = estado;
    }
    
    public int getPreco() {
        return _preco;
    }
    public void setPreco(int preco) {
        _preco = preco;
    }
    
    public int getTipoTransacao() {
        return _tipoTransacao;
    }
    public void setTipoTransacao(int tipo) {
        _tipoTransacao = tipo;
    }
    
    public int getPrecoPromo() {
        return _precoPromo;
    }
    public void setPrecoPromo(int preco) {
        _precoPromo = preco;
    }
    
    public int getLimitePromo() {
        return _limitePromo;
    }
    public void setLimitePromo(int limite) {
        _limitePromo = limite;
    }
    
    /*
    public BLOB? getFoto() {
        return _foto;
    }
    public void setFoto(BLOB? foto) {
        _foto = foto;
    }
    */
}
