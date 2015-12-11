/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Historico {
    public boolean incluir (TransacaoDO item) throws Exception{

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         TransacaoData item_data = new TransacaoData();
         item_data.incluir(item, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + item.getUser_id1());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(TransacaoDO item) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     TransacaoData item_data = new TransacaoData();
	     item_data.atualizar(item, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + item.getUser_id1());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

 

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  

} // Item
