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
        String sql = "insert into ITEM_INVENTARIO (USUARIO_ID, ITEM_ID, id, estado, preco, tipo_transacao, preco_promo, limite_promo);"
                + " values (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(2, item.getItemId());
        ps.setInt(1, item.getUsuarioId());
        ps.setInt(3, item.getId());
        ps.setInt(4, item.getEstado());
        ps.setString(5, item.getPreco());
        ps.setInt(6, item.getTipoTransacao());
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
        String sql = "update ITEM_INVENTARIO set USUARIO_ID=?, ITEM_ID=?, ID=?, ESTADO=?, PRECO=?, TIPO_TRANSACAO=?;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, item.getUsuarioId());
        ps.setInt(2, item.getItemId());
        ps.setInt(3, item.getId());
        ps.setInt(4, item.getEstado());
        ps.setString(5, item.getPreco());
        ps.setInt(6, item.getTipoTransacao());
        int result = ps.executeUpdate();
    }
    
    public ItemInventarioDO buscarID(int id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from ITEM where ID=?;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        rs.next();
        ItemInventarioDO item = new ItemInventarioDO();
        item.setId(rs.getInt("USUARIO_ID"));
        item.setId(rs.getInt("ITEM_ID"));
        item.setId(rs.getInt("id"));
        item.setId(rs.getInt("estado"));
        item.setId(rs.getInt("preco"));
        item.setId(rs.getInt("tipo_transacao"));
        return item;
    }
    
    public List<ItemInventarioDO> pesquisaNome(String nome, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "select II.* from ITEM_INVENTARIO II, ITEM I where II.ITEM_ID = I.ID and I.NOME like  ?;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "%"+nome+"%");
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        List<ItemInventarioDO> itens = new ArrayList<ItemInventarioDO>();
        while (rs.next()) {
           ItemInventarioDO item = new ItemInventarioDO();
           item.setUsuarioId(rs.getInt("USUARIO_ID"));
           item.setItemId(rs.getInt("ITEM_ID"));
           item.setId(rs.getInt("id"));
           item.setEstado(rs.getInt("estado"));
           item.setPreco(rs.getString("preco"));
           item.setTipoTransacao(rs.getInt("tipo_transacao"));
           itens.add(item);
        }
        return itens;
    }
    
     public List<ItemInventarioDO> pesquisaIdUser(int id, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "select * from ITEM_INVENTARIO where USUARIO_ID = ?;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        List<ItemInventarioDO> itens = new ArrayList<ItemInventarioDO>();
        while (rs.next()) {
           ItemInventarioDO item = new ItemInventarioDO();
           item.setUsuarioId(rs.getInt("USUARIO_ID"));
           item.setItemId(rs.getInt("ITEM_ID"));
           item.setId(rs.getInt("id"));
           item.setEstado(rs.getInt("estado"));
           item.setPreco(rs.getString("preco"));
           item.setTipoTransacao(rs.getInt("tipo_transacao"));
           itens.add(item);
        }
        return itens;
    }
    
    public List<ItemInventarioDO> pesquisaTipo(int tipo, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "select II.* from ITEM_INVENTARIO II, ITEM I where II.ITEM_ID = I.ID and I.TIPO = ?;";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, tipo);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        List<ItemInventarioDO> itens = new ArrayList<ItemInventarioDO>();
        while (rs.next()) {
           ItemInventarioDO item = new ItemInventarioDO();
           item.setUsuarioId(rs.getInt("USUARIO_ID"));
           item.setItemId(rs.getInt("ITEM_ID"));
           item.setId(rs.getInt("id"));
           item.setEstado(rs.getInt("estado"));
           item.setPreco(rs.getString("preco"));
           item.setTipoTransacao(rs.getInt("tipo_transacao"));
           itens.add(item);
        }
        return itens;
    }
    
    public List<ItemInventarioDO> pesquisaProdutora(String prod, Transacao tr) throws Exception{
        Connection con = tr.obterConexao();
        String sql = "select II.* from ITEM_INVENTARIO II, ITEM I where II.ITEM_ID = I.ID and I.PRODUTORA like \"?\";";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, prod);
        ResultSet rs = ps.executeQuery();
        System.out.println("query executada");
        List<ItemInventarioDO> itens = new ArrayList<ItemInventarioDO>();
        while (rs.next()) {
           ItemInventarioDO item = new ItemInventarioDO();
           item.setUsuarioId(rs.getInt("USUARIO_ID"));
           item.setItemId(rs.getInt("ITEM_ID"));
           item.setId(rs.getInt("id"));
           item.setEstado(rs.getInt("estado"));
           item.setPreco(rs.getString("preco"));
           item.setTipoTransacao(rs.getInt("tipo_transacao"));
           itens.add(item);
        }
        return itens;
    }
    
}