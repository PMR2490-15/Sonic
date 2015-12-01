package data;

public class ItemDO {
    private int    _id;
    private String _nome;
    private int    _tipo;
    private String _produtora;
    private String _lancamento;
    //    private BLOB? _foto;
    
    public int getId() {
        return _id;
    }
    public void setId(int id) {
        _id = id;
    }
    
    public String getNome() {
        return _nome;
    }
    public void setNome(String nome) {
        _nome = nome;
    }
    
    public int getTipo() {
        return _tipo;
    }
    public void setTipo(int tipo) {
        _tipo = tipo;
    }
    
    public String getProdutora() {
        return _produtora;
    }
    public void setProdutora(String produtora) {
        _produtora = produtora;
    }
    
    public String getLancamento() {
        return _lancamento;
    }
    public void setLancamento(String lancamento) {
        _lancamento = lancamento;
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