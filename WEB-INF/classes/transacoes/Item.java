/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;
import utils.*;
import data.*;
import java.util.*;

public class Item {

  public boolean incluir (Classe_Item item) throws Exception{

     // validacao das regras de negocio
     if(isEmpty(item.getNome()) )  {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         Classe_Item_Data item_data = new Classe_Item_Data();
         item_data.incluir(item, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + item.getNome());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(Classe_Item item) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     Classe_Item_Data item_data = new Classe_Item_Data();
	     item_data.atualizar(item, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + item.getNome());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public Classe_Item buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     Classe_Item_Data item_data = new Classe_Item_Data();
	     Classe_Item i = item_data.buscar(idobj, tr);
	   tr.commit();
	   return i;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  public Vector pesquisar(String nome) {
     if ( isEmpty(nome) )
        return null;

     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           Classe_Item_Data item_data = new Classe_Item_Data();
           Vector v = item_data.pesquisarPorNome(nome, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nome);
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      Item i = new Item();
      Classe_Item item = new Classe_Item();
  
      try {
            item = i.buscar(2);
		System.out.println(item.getNome());
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main


} // Item
