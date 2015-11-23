package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Comunicado {

  public boolean incluir (ComunicadoDO comunicado) throws Exception{

     // validacao das regras de negocio
     if ( comunicado.getIdrem() == 0  || comunicado.getIdDest() == 0 ) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         ComunicadoData cdata = new ComunicadoData();
         cdata.incluir(comunicado, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + comunicado.getComunicado() );
         e.printStackTrace();
     }
     return false;
  } // incluir

//  public ContatoDO buscar(int idobj) throws Exception{
//     Transacao tr = new Transacao();
//	 try{
//	   tr.beginReadOnly();
//  	     ContatoData cdata = new ContatoData();
//	     ContatoDO c = cdata.buscar(idobj, tr);
//	   tr.commit();
//	   return c;
//	 } catch (Exception e) {
//	   tr.rollback();
//	   System.out.println("erro ao buscar" + idobj);
//	   e.printStackTrace();
//	 }
//	 return null;
//  } // buscar

  public Vector pesquisarPorRemetente(int user_id) {
     if ( user_id == 0 )
        return null;

     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           ComunicadoData cdata = new ComunicadoData();
           Vector v = cdata.pesquisarPorRemetente(user_id, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar ");
         e.printStackTrace();
     }
     return null;
  } // pesquisar
  
  public Vector pesquisarPorDestinatario(int user_id) {
     if ( user_id == 0 )
        return null;

     Transacao tr = new Transacao();
     try {
	     tr.beginReadOnly();
           ComunicadoData cdata = new ComunicadoData();
           Vector v = cdata.pesquisarPorDestinatario(user_id, tr);
		 tr.commit();
		 return v;
     } catch(Exception e) {
         System.out.println("erro ao pesquisar ");
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

} // Contato