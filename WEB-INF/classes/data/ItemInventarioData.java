package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

/**
 *
 * @author lurosset
 */
public class ItemInventarioData {
    
    public void incluir(ItemInventarioDO item, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into ITEM_INVENTARIO (usid, itid, id, estado, preco, tipo_transacao, preco_promo, limite_promo)"
                + " values (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(2, item.getItemId());
        ps.setInt(1, item.getUsuarioId());
        ps.setInt(3, item.getId());
        ps.setInt(4, item.getEstado());
        ps.setInt(5, item.getPreco());
        ps.setInt(6, item.getTipoTransacao());
        ps.setInt(7, item.getPrecoPromo());
        ps.setInt(8, item.getLimitePromo());
        int result = ps.executeUpdate();
    }
    
    public void excluir(ItemInventarioDO item, Transacao tr) throws Exception {
        excluir(item.getId(), tr);
    }
    
    public void excluir(int id, Transacao tr) throws Exception {
        // 1-Passar por todos os itemInventario com esse ID e exclui-los tambem
        // 2-Apagar este item
    }
    
    public void atualizar(ItemInventarioDO item, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update ITEM_INVENTARIO set USID=?, ITID=?, ID=?, ESTADO=?, PRECO=?, TIPO_TRANSACAO=?, PRECO_PROMO=?, LIMITE_PROMO=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, item.getUsuarioId());
        ps.setInt(2, item.getItemId());
        ps.setInt(3, item.getId());
        ps.setInt(4, item.getEstado());
        ps.setInt(5, item.getPreco());
        ps.setInt(6, item.getTipoTransacao());
        ps.setInt(7, item.getPrecoPromo());
        ps.setInt(8, item.getLimitePromo());
        int result = ps.executeUpdate();
    }
    
    public ItemInventarioDO buscarID(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from ITEM where ID=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.next();
        ItemInventarioDO item = new ItemInventarioDO();
        item.setId(rs.getInt("usid"));
        item.setId(rs.getInt("itid"));
        item.setId(rs.getInt("id"));
        item.setId(rs.getInt("estado"));
        item.setId(rs.getInt("preco"));
        item.setId(rs.getInt("tipo_transacao"));
        item.setId(rs.getInt("preco_promo"));
        item.setId(rs.getInt("limite_promo"));
        return item;
    }
    
    public Vector pesquisaNome(String nome, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "QUERY PRA PEGAR OS ITEM_INVENTARIO COM O NOME CERTO ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nome);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        Vector itens = new Vector();
        while (rs.next()) {
           ItemInventarioDO item = new ItemInventarioDO();
           item.setUsuarioId(rs.getInt("usid"));
           item.setItemId(rs.getInt("itid"));
           item.setId(rs.getInt("id"));
           item.setEstado(rs.getInt("estado"));
           item.setPreco(rs.getInt("preco"));
           item.setTipoTransacao(rs.getInt("tipo_transacao"));
           item.setPrecoPromo(rs.getInt("preco_promo"));
           item.setLimitePromo(rs.getInt("limite_promo"));
           itens.add(item);
        }
        return itens;
    }
    
    public Vector pesquisaTipo(int tipo, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "COLOCAR AQUI A QUERY ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, tipo);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        Vector itens = new Vector();
        while (rs.next()) {
           ItemInventarioDO item = new ItemInventarioDO();
           item.setUsuarioId(rs.getInt("usid"));
           item.setItemId(rs.getInt("itid"));
           item.setId(rs.getInt("id"));
           item.setEstado(rs.getInt("estado"));
           item.setPreco(rs.getInt("preco"));
           item.setTipoTransacao(rs.getInt("tipo_transacao"));
           item.setPrecoPromo(rs.getInt("preco_promo"));
           item.setLimitePromo(rs.getInt("limite_promo"));
           itens.add(item);
        }
        return itens;
    }
    
    public Vector pesquisaProdutora(String prod, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "IDEM ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, prod);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        Vector itens = new Vector();
        while (rs.next()) {
           ItemInventarioDO item = new ItemInventarioDO();
           item.setUsuarioId(rs.getInt("usid"));
           item.setItemId(rs.getInt("itid"));
           item.setId(rs.getInt("id"));
           item.setEstado(rs.getInt("estado"));
           item.setPreco(rs.getInt("preco"));
           item.setTipoTransacao(rs.getInt("tipo_transacao"));
           item.setPrecoPromo(rs.getInt("preco_promo"));
           item.setLimitePromo(rs.getInt("limite_promo"));
           itens.add(item);
        }
        return itens;
    }
    
}