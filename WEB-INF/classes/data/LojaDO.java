/*
 * MODEL_LOJA
 */
package data;

import java.util.*;

public class LojaDO {
    private int ID;
    private String Nome;
    private String CNPJ;
    private String Email;
    private String Telefone_1;
    private String Telefone_2;
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
    
    public String getCNPJ(){
        return CNPJ;
    }
    
    public String getEmail(){
        return Email;
    }
    
    public String getTelefone_1(){
        return Telefone_1;
    }
    
    public String getTelefone_2(){
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
    public void setID(int _ID){
        ID = _ID;
    }
    
    public void setNome(String _Nome){
        Nome = _Nome;
    }
    
    public void setCNPJ(String _CNPJ){
        CNPJ = _CNPJ;
    }
    
    public void setEmail(String _Email){
        Email = _Email;
    }
    
    public void setTelefone_1(String _Telefone_1){
        Telefone_1 = _Telefone_1;
    }
    
    public void setTelefone_2(String _Telefone_2){
        Telefone_2 = _Telefone_2;
    }
    
   public void setFoto(String _Foto){
        Foto = _Foto;
    }
    
    public void setURL(String _URL){
        URL = _URL;
    }
    
    public void setSuspenso_ate(String _Suspenso_ate){
        Suspenso_ate = _Suspenso_ate;
    }
     
    public void setAtivo(boolean _Ativo){
        Ativo = _Ativo;
    }
}