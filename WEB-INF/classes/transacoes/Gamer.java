package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Gamer {
    
    public boolean incluir (GamerDO gamer) throws Exception{
        
        // validacao das regras de negocio
        if(isEmpty(gamer.getNome()) )  {
            return false;
        }
        
        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                GamerData gamerData = new GamerData();
                gamerData.incluir(gamer, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir " + gamer.getNome());
            e.printStackTrace();
        }
        return false;
    } // incluir
    
    public boolean atualizar(GamerDO gamer) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
                GamerData gamer_data = new GamerData();
                gamer_data.atualizar(gamer, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao atualizar" + gamer.getNome());
            e.printStackTrace();
	}
	return false;
    } // atualizar
    
    public GamerDO buscar(int idobj) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    GamerData gamer_data = new GamerData();
	    GamerDO i = gamer_data.buscar(idobj, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar" + idobj);
            e.printStackTrace();
	}
	return null;
    } // buscar

    public List<GamerDO> pesquisar(String nome) {
        if ( isEmpty(nome) )
        return null;

        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            GamerData gamer_data = new GamerData();
            List<GamerDO> list = gamer_data.pesquisarPorNome(nome, tr);
            tr.commit();
            return list;
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
        ItemDO item = new ItemDO();
  
        try {
            item = i.buscar(2);
            System.out.println(item.getNome());
        } catch(Exception e) {
            e.printStackTrace();
        }
    } // main
}//Gamer


/*
    SQL de Criacao do Banco de Dados

  USUARIO_ID INTEGER UNSIGNED NOT NULL,
  NOME VARCHAR(45) NULL,
  CPF INTEGER UNSIGNED NULL,
  EMAIL VARCHAR(45) NULL,
  TELEFONE INTEGER UNSIGNED NULL,
  CIDADE VARCHAR(45) NULL,
  FOTO BLOB NULL,
  SUSPENSO_ATE DATE NULL,
  ATIVO BOOL NULL,
  PRIMARY KEY(USUARIO_ID),
  INDEX GAMER_FKIndex1(USUARIO_ID)
    
*/