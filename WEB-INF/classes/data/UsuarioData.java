package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class UsuarioData {

  public void incluir(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into usuario (nome, senha) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome_Usuario());
     ps.setString(2, usuario.getSenha());
     int result = ps.executeUpdate();
  }
  
  public void alterarsenha(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into usuario (nome, senha) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome_Usuario());
     ps.setString(2, usuario.getSenha());
     int result = ps.executeUpdate();
  }

  public void excluir(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from agenda where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
	 ps.setInt(1, usuario.getId());
     int result = ps.executeUpdate();
  } // excluir

  public void atualizar(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update usuario set nome=?, senha=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome_Usuario());
     ps.setString(2, usuario.getSenha());
     ps.setInt(3, usuario.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public UsuarioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setId (rs.getInt("id"));
     usuario.setNome_Usuario (rs.getString("nome"));
     usuario.setSenha(rs.getString("senha"));
     return usuario;
  } // buscar
  
  public UsuarioDO buscar(String nomeUsuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where  nome=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nomeUsuario);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setId (rs.getInt("id"));
     usuario.setNome_Usuario (rs.getString("nome"));
     usuario.setSenha(rs.getString("senha"));
     return usuario;
  } // buscar

} // ContatoData