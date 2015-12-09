package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class UsuarioData {

  public void incluir(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into usuario (username, senha, tipo, pergunta, resposta) values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome_Usuario());
     ps.setString(2, usuario.getSenha());
     ps.setInt(3, usuario.getTipo());
     ps.setString(4, usuario.getPergunta());
     ps.setString(5, usuario.getResposta());
     int result = ps.executeUpdate();
  }
  
  public void alterarsenha(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into usuario (username, senha) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome_Usuario());
     ps.setString(2, usuario.getSenha());
     int result = ps.executeUpdate();
  }

  public void excluir(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from usuario where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
	 ps.setInt(1, usuario.getId());
     int result = ps.executeUpdate();
  } // excluir

  public void atualizar(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update usuario set username=?, senha=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome_Usuario());
     ps.setString(2, usuario.getSenha());
     ps.setInt(3, usuario.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public UsuarioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setId (rs.getInt("id"));
     usuario.setNome_Usuario (rs.getString("username"));
     usuario.setSenha(rs.getString("senha"));
     usuario.setTipo(rs.getInt("tipo"));
     return usuario;
  } // buscar
  
  public UsuarioDO buscar(String nomeUsuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where username=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nomeUsuario);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setId(rs.getInt("id"));
     usuario.setNome_Usuario(rs.getString("username"));
     usuario.setSenha(rs.getString("senha"));
     usuario.setTipo(rs.getInt("tipo"));
     usuario.setPergunta(rs.getString("pergunta"));
     usuario.setResposta(rs.getString("resposta"));
     return usuario;
  } // buscar

} // ContatoData