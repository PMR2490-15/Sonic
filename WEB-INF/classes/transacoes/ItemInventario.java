/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class ItemInventario {
    public boolean incluir (ItemInventarioDO item) throws Exception{

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         ItemInventarioData item_data = new ItemInventarioData();
         item_data.incluir(item, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + item.getItemId());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(ItemInventarioDO item) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ItemInventarioData item_data = new ItemInventarioData();
	     item_data.atualizar(item, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + item.getItemId());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar

  public ItemInventarioDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     ItemInventarioData item_data = new ItemInventarioData();
	     ItemInventarioDO i = item_data.buscarID(idobj, tr);
	   tr.commit();
	   return i;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  public List pesquisar(String nome) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           ItemInventarioData item_data = new ItemInventarioData();
           List v = item_data.pesquisaNome(nome, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + nome);
         e.printStackTrace();
     }
     return null;
  } // pesquisar

  public List pesquisarUsuario(int idUser) {
     
     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           ItemInventarioData item_data = new ItemInventarioData();
           List v = item_data.pesquisaIdUser(idUser, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar " + idUser);
         e.printStackTrace();
     }
     return null;
  } // pesquisar por usuario 
  
  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      ItemInventario i = new ItemInventario();
      ItemInventarioDO item = new ItemInventarioDO();
  
      try {
            item = i.buscar(2);
		System.out.println(item.getItemId());
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main

} // Item
