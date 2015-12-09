package transacoes;
import utils.*;
import data.*;
import java.util.*;

public class Item {

    public boolean incluir (ItemDO item) throws Exception{

        // validacao das regras de negocio
        if(isEmpty(item.getNome()) )  {
            return false;
        }

        // efetuando a transacao
        Transacao tr = new Transacao();
        try {
            
            tr.begin();
                ItemData item_data = new ItemData();
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

    public boolean atualizar(ItemDO item) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
                ItemData item_data = new ItemData();
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

    public ItemDO buscar(int idobj) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ItemData item_data = new ItemData();
	    ItemDO i = item_data.buscar(idobj, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar" + idobj);
            e.printStackTrace();
	}
	return null;
    } // buscar
    
    public ItemDO buscar(String nomeItem) throws Exception{
        Transacao tr = new Transacao();
	try{
            tr.beginReadOnly();
  	    ItemData item_data = new ItemData();
	    ItemDO i = item_data.buscar(nomeItem, tr);
            tr.commit();
            return i;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar" + nomeItem);
            e.printStackTrace();
	}
	return null;
    } // buscar

    public List<ItemDO> pesquisar(String nome) {
        if ( isEmpty(nome) )
        return null;

        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            ItemData item_data = new ItemData();
            List<ItemDO> list = item_data.pesquisarPorNome(nome, tr);
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

} // Item
