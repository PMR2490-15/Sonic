package transacoes;

import data.*;
import utils.*;
import java.util.*;

public class Loja {
    
    public boolean incluir (LojaDO Loja) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(Loja.getNome())) ) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         LojaData cdata = new LojaData();
         cdata.incluir(Loja, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + Loja.getNome());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(LojaDO Loja) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     LojaData cdata = new LojaData();
	     cdata.atualizar(Loja, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + Loja.getNome());
	   e.printStackTrace();
	 }
	 return false;
    } // atualizar

    public LojaDO buscar(int idobj) throws Exception{
        Transacao tr = new Transacao();
        try{
            tr.beginReadOnly();
            LojaData cdata = new LojaData();
            LojaDO c = cdata.buscar(idobj, tr);
            tr.commit();
            return c;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar id " + idobj);
            e.printStackTrace();
        }
        return null;
    } // buscar

    public List<LojaDO> pesquisar(String nome) {
        if ( isEmpty(nome) )
            return null;

        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            LojaData cdata = new LojaData();
            Vector v = cdata.pesquisarPorNome(nome, tr);
            tr.commit();
            return v;
        } catch(Exception e) {
            System.out.println("erro ao pesquisar " + nome);
            e.printStackTrace();
        }
        return null;
    } // pesquisar
  
    public boolean remover(LojaDO Loja) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
  	    LojaData cdata = new LojaData();
	    cdata.excluir(Loja, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao remover" + Loja.getNome());
            e.printStackTrace();
	}
	return false;
    } // remover

    private boolean isEmpty(String s) {
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
    return false;
    }

    public static void main(String[] args) {
        Loja c = new Loja();
        LojaDO Loja = new LojaDO();
        try {
	    Loja = c.buscar(6);
            System.out.println(Loja.getNome());
        } catch(Exception e) {
            e.printStackTrace();
        }
    } // main
}
