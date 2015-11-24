/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ItemData {
    
  public void incluir(Classe_Item item, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into ITEM (NOME,TIPO,PRODUTORA,LANCAMENTO) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, item.getNome());
     ps.setInt(2, item.getTipo());
     ps.setString(3, item.getProdutora());
     ps.setString(4, item.getLancamento());
     
     int result = ps.executeUpdate();
  }

  public void excluir(Classe_Item item, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from ITEM where id = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, item.getId());
     int result = ps.executeUpdate();
  } // excluir

  public void atualizar(Classe_Item item, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ITEM set nome=?, tipo=?, produtora=?,lancamento=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, item.getNome());
     ps.setInt(2,item.getTipo());
     ps.setString(3, item.getProdutora());
     ps.setString(4, item.getLancamento());
     ps.setInt(5, item.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public Classe_Item buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from item where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Classe_Item item = new Classe_Item();
     item.setId (rs.getInt("id"));
     item.setNome (rs.getString("nome"));
     item.setTipo(rs.getInt("tipo"));
     item.setLancamento(rs.getString("lancamento"));
     item.setProdutora(rs.getString("produtora"));
     return item;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from item where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector Items = new Vector();
     while (rs.next()) {
        Classe_Item i = new Classe_Item();
        i.setId (rs.getInt("id"));
        i.setNome (rs.getString("nome"));
        System.out.println(" got " + i.getNome());
        i.setTipo(rs.getInt("tipo"));
        i.setLancamento(rs.getString("lancamento"));
        i.setProdutora(rs.getString("produtora"));
        Items.add(i);
     }
     return Items;
  } // pesquisarPorNome

} // ContatoData
