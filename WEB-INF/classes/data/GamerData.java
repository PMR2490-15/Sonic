package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.awt.Image;

public class GamerData {

  public void incluir(GamerDO gamer, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into usuario (nome, cpf, email, telefone, cidade, foto, suspenso_ate, ativo ) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome());
     ps.setString(2, usuario.getCpf());
     int result = ps.executeUpdate();
  }
  
  public void alterarsenha(GamerDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into usuario (nome, senha) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome());
     ps.setString(2, usuario.getsenha());
     int result = ps.executeUpdate();
  }

  public void excluir(GamerDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from agenda where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
	 ps.setInt(1, usuario.getId());
     int result = ps.executeUpdate();
  } // excluir

  public void atualizar(GamerDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update usuario set nome=?, senha=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getNome());
     ps.setString(2, usuario.getsenha());
     ps.setInt(3, usuario.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public GamerDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     GamerDO usuario = new GamerDO();
     usuario.setId (rs.getInt("id"));
     usuario.setNome (rs.getString("nome"));
     usuario.setsenha(rs.getString("senha"));
     return usuario;
  } // buscar
  
  public GamerDO buscar(String nomeGamer, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from usuario where  username=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nomeGamer);
     ResultSet rs = ps.executeQuery();
     rs.next();
     GamerDO usuario = new GamerDO();
     usuario.setId (rs.getInt("id"));
     usuario.setNome (rs.getString("nome"));
     usuario.setsenha(rs.getString("senha"));
     return usuario;
  } // buscar

} // ContatoData