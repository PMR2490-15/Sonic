/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author aluno
 */
public class TransacaoDO {
    
//Declaracao de variaveis
 
  private int _user_id1;
  private int _item_id1;

  private int _user_id2;
  private int _item_id2;
  
  private int _delta_dinheiro;
  
  private String _data;
  
  private boolean _fechada;
  
  

	
    
    
//Geters and Setters    

    public int getUser_id1() {
        return _user_id1;
    }

    public void setUser_id1(int _user_id1) {
        this._user_id1 = _user_id1;
    }

    public int getItem_id1() {
        return _item_id1;
    }

    public void setItem_id1(int _item_id1) {
        this._item_id1 = _item_id1;
    }

    public int getUser_id2() {
        return _user_id2;
    }

    public void setUser_id2(int _user_id2) {
        this._user_id2 = _user_id2;
    }

    public int getItem_id2() {
        return _item_id2;
    }

    public void setItem_id2(int _item_id2) {
        this._item_id2 = _item_id2;
    }

    public int getDelta_dinheiro() {
        return _delta_dinheiro;
    }

    public void setDelta_dinheiro(int _delta_dinheiro) {
        this._delta_dinheiro = _delta_dinheiro;
    }

    public String getData() {
        return _data;
    }

    public void setData(String _data) {
        this._data = _data;
    }

    public boolean isFechada() {
        return _fechada;
    }

    public void setFechada(boolean _fechada) {
        this._fechada = _fechada;
    }
   
    
}//Gamer


/*
    SQL de Criacao do Banco de Dados

CREATE TABLE TRANSACAO (
  IT_ID_1 INTEGER UNSIGNED NOT NULL,
  US_ID_1 INTEGER UNSIGNED NOT NULL,
  US_ID_2 INTEGER UNSIGNED NOT NULL,
  IT_ID_2 INTEGER UNSIGNED NOT NULL,
  DELTA_DINHEIRO INTEGER NOT NULL,
  DATA_2 DATETIME NULL,
  FECHADA BOOL NULL,
  PRIMARY KEY(IT_ID_1, US_ID_1),
  INDEX PROPOSTA_FKIndex1(US_ID_1, IT_ID_1, ITEM_INVENTARIO_ID),
  INDEX PROPOSTA_FKIndex2(US_ID_2)
);
    
*/