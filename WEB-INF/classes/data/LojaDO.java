/*
 * MODEL_LOJA
 */
package data;

import java.util.*;

public class LojaDO {
    private int ID;
    private String Nome;
    private int CNPJ;
    private String Email;
    private int Telefone_1;
    private int Telefone_2;
    private String Foto;
    private String URL;
    private String Suspenso_ate;
    private boolean Ativo;
    
    // Gets
    public int getID(){
        return ID;
    }
    
    public String getNome(){
        return Nome;
    }
    
    public int getCNPJ(){
        return CNPJ;
    }
    
    public String getEmail(){
        return Email;
    }
    
    public int getTelefone_1(){
        return Telefone_1;
    }
    
    public int getTelefone_2(){
        return Telefone_2;
    }
    
    public String getFoto(){
        return Foto;
    }
    
    public String getURL(){
        return URL;
    }
    
     public String getSuspenso_ate(){
        return Suspenso_ate;
    }
     
    public boolean getAtivo(){
        return Ativo;
    }
    
    // Sets
    void setID(int _ID){
        ID = _ID;
    }
    
    void setNome(String _Nome){
        Nome = _Nome;
    }
    
    void setCNPJ(int _CNPJ){
        CNPJ = _CNPJ;
    }
    
    void setEmail(String _Email){
        Email = _Email;
    }
    
    void setTelefone_1(int _Telefone_1){
        Telefone_1 = _Telefone_1;
    }
    
    void setTelefone_2(int _Telefone_2){
        Telefone_2 = _Telefone_2;
    }
    
   void setFoto(String _Foto){
        Foto = _Foto;
    }
    
    void setURL(String _URL){
        URL = _URL;
    }
    
    void setSuspenso_ate(String _Suspenso_ate){
        Suspenso_ate = _Suspenso_ate;
    }
     
    void setAtivo(boolean _Ativo){
        Ativo = _Ativo;
    }
}