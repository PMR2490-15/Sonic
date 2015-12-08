package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class GamerData {
    
    public void incluir(GamerDO gamer, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into GAMER (USUARIO_ID,NOME,CPF,EMAIL,TELEFONE,"
                + "CIDADE,SUSPENSO_ATE,ATIVO,) values (?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, gamer.getUsuario_Id());
        ps.setString(2, gamer.getNome());
        ps.setString(3, gamer.getCpf());
        ps.setString(4, gamer.getEmail());
        ps.setString(5, gamer.getTelefone());
        ps.setString(6, gamer.getCidade());
        ps.setString(7, gamer.getSuspenso_ate());
        ps.setString(8, gamer.getAtivo());
     
        int result = ps.executeUpdate();
    }

    public void excluir(GamerDO gamer, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from Gamer where USUARIO_ID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, gamer.getUsuario_Id());
        int result = ps.executeUpdate();
    } // excluir

    public void atualizar(GamerDO gamer, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update GAMER set nome=?, cpf=?, email=?, telefone=?, "
                + "cidade=?, foto=? , suspenso_ate=? , ativo=? where usuario_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, gamer.getNome());
        ps.setString(2, gamer.getCpf());
        ps.setString(3, gamer.getEmail());
        ps.setString(4, gamer.getTelefone());
        ps.setString(5, gamer.getCidade());
        ps.setString(6, gamer.getFoto());
        ps.setString(7, gamer.getSuspenso_ate());
        ps.setString(8, gamer.getAtivo());
        ps.setInt(9, gamer.getUsuario_Id());
        int result = ps.executeUpdate();
    } // atualizar

    public GamerDO buscar(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from gamer where usuario_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        rs.next();
        GamerDO gamer = new GamerDO();
        gamer.setUsuario_Id (rs.getInt("usuario_id"));
        gamer.setNome(rs.getString("nome"));
        gamer.setCpf(rs.getString("cpf"));
        gamer.setEmail(rs.getString("email"));
        gamer.setTelefone(rs.getString("telefone"));
        gamer.setCidade(rs.getString("cidade"));
        gamer.setFoto(rs.getString("foto"));
        gamer.setSuspenso_ate(rs.getString("suspenso_ate"));
        gamer.setAtivo(rs.getString("ativo"));
        return gamer;
    } // buscar

    public List<GamerDO> pesquisarPorNome(String nome, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from gamer where nome like ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nome);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        List<GamerDO> Items = new ArrayList<GamerDO>();
        while (rs.next()) {
            GamerDO i = new GamerDO();
            i.setUsuario_Id (rs.getInt("usuario_id"));
            i.setNome (rs.getString("nome"));
            System.out.println(" got " + i.getNome());
            i.setCpf("cpf");
            i.setEmail("email");
            i.setTelefone("telefone");
            i.setCidade("cidade");
            i.setSuspenso_ate("suspenso_ate");
            i.setAtivo("ativo");
            Items.add(i);
        }
        return Items;
    } // pesquisarPorNome

} // ContatoData
