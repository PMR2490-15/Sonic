package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Usuario {

  public boolean incluir (UsuarioDO usuario) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(usuario.getNome_Usuario())) || ( isEmpty(usuario.getsenha())) ) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         UsuarioData cdata = new UsuarioData();
         cdata.incluir(usuario, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + usuario.getNome_Usuario());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(UsuarioDO usuario) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     UsuarioData cdata = new UsuarioData();
	     cdata.atualizar(usuario, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + usuario.getNome_Usuario());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
  public boolean remover(UsuarioDO usuario) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     UsuarioData cdata = new UsuarioData();
	     cdata.excluir(usuario, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao remover" + usuario.getNome_Usuario());
	   e.printStackTrace();
	 }
	 return false;
  } // remover

  public UsuarioDO buscar(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData cdata = new UsuarioData();
	     UsuarioDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  
  public UsuarioDO buscar(String nomeUsuario) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData cdata = new UsuarioData();
	     UsuarioDO c = cdata.buscar(nomeUsuario, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + nomeUsuario);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar
  
  public UsuarioDO alterarsenha(int idobj) throws Exception{
     Transacao tr = new Transacao();
	 try{
	   tr.beginReadOnly();
  	     UsuarioData cdata = new UsuarioData();
	     UsuarioDO c = cdata.buscar(idobj, tr);
	   tr.commit();
	   return c;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao buscar" + idobj);
	   e.printStackTrace();
	 }
	 return null;
  } // buscar

  private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }

  public static void main(String[] args) {
      Usuario c = new Usuario();
      UsuarioDO nome_usuario = new UsuarioDO();
      try {
	    nome_usuario = c.buscar(6);
		System.out.println(nome_usuario.getNome_Usuario());
      } catch(Exception e) {
          e.printStackTrace();
      }
  } // main
} // Contato