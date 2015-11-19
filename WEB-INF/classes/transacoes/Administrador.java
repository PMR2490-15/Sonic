package transacoes;

import data.*;
import utils.*;
import java.util.*;

public class Administrador
{
    public boolean incluir (AdministradorDO administrador) throws Exception
    {
        if (isEmpty(administrador.getNome()))
            return false;
        
        Transacao tr = new Transacao();
        try {
            tr.begin();
            AdministradorData adata = new AdministradorData();
            adata.incluir(administrador, tr);
            tr.commit();
            return true;
        } catch(Exception e){
            tr.rollback();
            System.out.println("erro ao incluir " + administrador.getNome());
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean atualizar(AdministradorDO administrador) throws Exception
    {
        Transacao tr = new Transacao();
        try{
	// inserir validacoes de regras de negocio
            tr.begin();
  	    AdministradorData adata = new AdministradorData();
	    adata.atualizar(administrador, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao atualizar" + administrador.getNome());
            e.printStackTrace();
	}
	return false;
    }
    
    public AdministradorDO buscar(int idobj) throws Exception{
        Transacao tr = new Transacao();
        try{
            tr.beginReadOnly();
            AdministradorData adata = new AdministradorData();
            AdministradorDO a = adata.buscar(idobj, tr);
            tr.commit();
            return a;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar id " + idobj);
            e.printStackTrace();
        }
        return null;
    } // buscar
    
    public List<AdministradorDO> pesquisar(String nome) {
        if ( isEmpty(nome) )
            return null;

        Transacao tr = new Transacao();
        try {
	    tr.beginReadOnly();
            AdministradorData adata = new AdministradorData();
            List<AdministradorDO> list = adata.pesquisarPorNome(nome, tr);
            tr.commit();
            return list;
        } catch(Exception e) {
            System.out.println("erro ao pesquisar " + nome);
            e.printStackTrace();
        }
        return null;
    } // pesquisar
    
    public boolean remover(AdministradorDO admin) throws Exception {
        Transacao tr = new Transacao();
	try{
            // inserir validacoes de regras de negocio
            tr.begin();
  	    AdministradorData adata = new AdministradorData();
	    adata.excluir(admin, tr);
            tr.commit();
            return true;
	} catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao remover" + admin.getNome());
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
        Administrador a = new Administrador();
        AdministradorDO admin = new AdministradorDO();
        try {
	    admin = a.buscar(6);
            System.out.println(admin.getNome());
        } catch(Exception e) {
            e.printStackTrace();
        }
    } // main
}
