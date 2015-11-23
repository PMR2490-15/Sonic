/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;
import java.sql.*;
import java.util.*;
import utils.Transacao;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Juliana
 */
public class ComunicadoData {
    
     public void incluir(ComunicadoDO comunicado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into COMUNICADO (ID_REMETENTE, ID_DESTINATARIO, MENSAGEM,DATA_2) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, comunicado.getIdrem());
     ps.setInt(2, comunicado.getIdDest());
     ps.setString(3, comunicado.getComunicado());
     ps.setDate(4, formataData(comunicado.getData()) );
     int result = ps.executeUpdate();
  }

  public void excluir(ContatoDO contato, Transacao tr) throws Exception {
     excluir(contato.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
  } // excluir 

  public void atualizar(ContatoDO contato, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Agenda set nome=?, telefone=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, contato.getNome());
     ps.setString(2, contato.getTelefone());
	 ps.setInt(3, contato.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public ContatoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Agenda where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ContatoDO contato = new ContatoDO();
     contato.setId (rs.getInt("id"));
     contato.setNome (rs.getString("nome"));
     contato.setTelefone(rs.getString("telefone"));
     return contato;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Agenda where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector contatos = new Vector();
     while (rs.next()) {
        ContatoDO c = new ContatoDO();
        c.setId (rs.getInt("id"));
        c.setNome (rs.getString("nome"));
        System.out.println(" got " + c.getNome());
        c.setTelefone(rs.getString("telefone"));
        contatos.add(c);
     }
     return contatos;
  } // pesquisarPorNome
  
  // BAN: alterações a partir daqui
  public Vector pesquisarPorRemetente(int user_id, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from COMUNICADO where ID_REMETENTE = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, user_id);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector contatos = new Vector();
     while (rs.next()) {
        ComunicadoDO c = new ComunicadoDO();
        c.setIdrem(rs.getInt("ID_REMETENTE"));
        c.setIdDest(rs.getInt("ID_DESTINATARIO"));
        c.setComunicado(rs.getString("MENSAGEM"));
        c.setData(rs.getString("DATA_2"));
        contatos.add(c);
     }
     return contatos;
  } // pesquisarPorRemetente
  
  public Vector pesquisarPorDestinatario(int user_id, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from COMUNICADO where ID_DESTINATARIO = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, user_id);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector contatos = new Vector();
     while (rs.next()) {
        ComunicadoDO c = new ComunicadoDO();
        c.setIdrem(rs.getInt("ID_REMETENTE"));
        c.setIdDest(rs.getInt("ID_DESTINATARIO"));
        c.setComunicado(rs.getString("MENSAGEM"));
        c.setData(rs.getString("DATA_2"));
        contatos.add(c);
     }
     return contatos;
  } // pesquisarPorDestinatario
  
  public static java.sql.Date formataData(String data) throws Exception {   
        if (data == null || data.equals(""))  
            return null;  
          
        java.sql.Date date = null;  
        try {  
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
            date = new java.sql.Date( ((java.util.Date)formatter.parse(data)).getTime() );  
        } catch (Exception e) {              
            throw e;
        }  
        return date;  
    }
    
}
