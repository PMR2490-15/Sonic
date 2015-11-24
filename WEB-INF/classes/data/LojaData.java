/*
 * Data Loja
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

/**
 *
 * @author Soyama
 */
public class LojaData {

    public void incluir(LojaDO Loja, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Loja (USUARIO_ID, NOME, CNPJ, EMAIL, TELEFONE_1, TELEFONE_2, FOTO, URL, SUSPENSO_ATE, ATIVO) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Loja.getID());
        ps.setString(2, Loja.getNome());
        ps.setInt(3, Loja.getCNPJ());
        ps.setString(4, Loja.getEmail());
        ps.setInt(5, Loja.getTelefone_1());
        ps.setInt(6, Loja.getTelefone_2());
        ps.setString(7, Loja.getFoto());
        ps.setString(8, Loja.getURL());
        ps.setString(9, Loja.getSuspenso_ate());
        ps.setBoolean(10, Loja.getAtivo());
        int result = ps.executeUpdate();
    }

    public void excluir(LojaDO Loja, Transacao tr) throws Exception {
        excluir(Loja.getID(), tr);
    } // excluir

    public void excluir(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from Loja where USUARIO_ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        int result = ps.executeUpdate();
    } // excluir 

    public void atualizar(LojaDO Loja, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Loja set NOME=?, CNPJ=?, EMAIL=?, TELEFONE_1=?, TELEFONE_2=?, FOTO=?, URL=?, SUSPENSO_ATE=?, ATIVO=? where USUARIO_ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, Loja.getNome());
        ps.setInt(2, Loja.getCNPJ());
        ps.setString(3, Loja.getEmail());
        ps.setInt(4, Loja.getTelefone_1());
        ps.setInt(5, Loja.getTelefone_2());
        ps.setString(6, Loja.getFoto());
        ps.setString(7, Loja.getURL());
        ps.setString(8, Loja.getSuspenso_ate());
        ps.setBoolean(9, Loja.getAtivo());
        ps.setInt(10, Loja.getID());
        int result = ps.executeUpdate();
    } // atualizar

    public LojaDO buscar(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Loja where USUARIO_ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        rs.next();
        LojaDO loja = new LojaDO();
        loja.setID(rs.getInt("USUARIO_ID"));
        loja.setNome(rs.getString("NOME"));
        loja.setCNPJ(rs.getInt("CNPJ"));
        loja.setEmail(rs.getString("EMAIL"));
        loja.setTelefone_1(rs.getInt("TELEFONE_1"));
        loja.setTelefone_2(rs.getInt("TELEFONE_2"));
        loja.setFoto(rs.getString("FOTO"));
        loja.setURL(rs.getString("URL"));
        loja.setSuspenso_ate(rs.getString("SUSPENSO_ATE"));
        loja.setAtivo(rs.getBoolean("ATIVO"));
        return loja;
    } // buscar

    public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Loja where NOME like ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nome);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        Vector Lojas = new Vector();
        while (rs.next()) {
            LojaDO loja = new LojaDO();
            loja.setID(rs.getInt("USUARIO_ID"));
            loja.setNome(rs.getString("NOME"));
            loja.setCNPJ(rs.getInt("CNPJ"));
            loja.setEmail(rs.getString("EMAIL"));
            loja.setTelefone_1(rs.getInt("TELEFONE_1"));
            loja.setTelefone_2(rs.getInt("TELEFONE_2"));
            loja.setFoto(rs.getString("FOTO"));
            loja.setURL(rs.getString("URL"));
            loja.setSuspenso_ate(rs.getString("SUSPENSO_ATE"));
            loja.setAtivo(rs.getBoolean("ATIVO"));
            Lojas.add(loja);
        }
        return Lojas;
    } // pesquisarPorNome

}
