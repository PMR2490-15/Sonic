/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.awt.Image;

/**
 *
 * @author aluno
 */
public class AdministradorData {
    
    public void incluir(AdministradorDO administrador, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Administrador (usuario_id, nome, cpf, email, telefone) values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, administrador.getUsuarioId());
     ps.setString(2, administrador.getNome());
     ps.setString(3, administrador.getCPF());
     ps.setString(4, administrador.getEmail());
     ps.setString(5, administrador.getTelefone());
     int result = ps.executeUpdate();
  }

  public void excluir(AdministradorDO administrador, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Administrador where usuario_id=?";
     PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, administrador.getUsuarioId());     
     int result = ps.executeUpdate();
  } // excluir

 

  public void atualizar(AdministradorDO administrador, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Administrador set nome=?, cpf=?, email=?, telefone=? where usuario_id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, administrador.getNome());
     ps.setString(2, administrador.getCPF());
     ps.setString(3, administrador.getEmail());
     ps.setString(4, administrador.getTelefone());
     ps.setInt(5, administrador.getUsuarioId());
     int result = ps.executeUpdate();
  } // atualizar

  public AdministradorDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Administrador where usuario_id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     AdministradorDO administrador = new AdministradorDO();
     administrador.setUsuarioId(rs.getInt("usuario_id"));
     administrador.setNome(rs.getString("nome"));
     administrador.setCPF(rs.getString("cpf"));
     administrador.setEmail(rs.getString("email"));
     administrador.setTelefone(rs.getString("telefone"));
     return administrador;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Administrador where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector administradors = new Vector();
     while (rs.next()) {
        AdministradorDO c = new AdministradorDO();
        c.setUsuarioId(rs.getInt("usuario_id"));
        c.setNome (rs.getString("nome"));
        System.out.println(" got " + c.getNome());
        c.setCPF(rs.getString("cpf"));
        c.setEmail(rs.getString("email"));
        c.setTelefone(rs.getString("telefone"));
        administradors.add(c);
     }
     return administradors;
  } // pesquisarPorNome

    
}
