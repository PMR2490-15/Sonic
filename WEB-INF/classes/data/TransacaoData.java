/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import utils.Transacao;

/**
 *
 * @author aluno
 */
public class TransacaoData {

    public void incluir(TransacaoDO Transacao, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Transacao (IT_ID_1, US_ID_1, US_ID_2, IT_ID_2, DELTA_DINHEIRO, DETA_2, FECHADA) values (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Transacao.getItem_id1() );
        ps.setInt(2, Transacao.getUser_id2() );
        ps.setInt(3, Transacao.getUser_id2() );
        ps.setInt(4, Transacao.getItem_id2() );
        ps.setInt(5, Transacao.getDelta_dinheiro() );
        ps.setString(6, Transacao.getData() );
        ps.setBoolean(7, Transacao.isFechada() );
        int result = ps.executeUpdate();
    }

    public void excluir(TransacaoDO Transacao, Transacao tr) throws Exception {
        excluir(Transacao.getUser_id1(), Transacao.getItem_id1(), tr);
    } // excluir

    public void excluir(int user_id, int item_id, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "delete from TRANSACAO where IT_ID_1=? AND US_ID_1=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        ps.setInt(2, item_id);
        int result = ps.executeUpdate();
    } // excluir 

    public void atualizar(TransacaoDO Transacao, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update into Transacao (IT_ID_1, US_ID_1, US_ID_2, IT_ID_2, DELTA_DINHEIRO, DETA_2, FECHADA) values (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, Transacao.getItem_id1() );
        ps.setInt(2, Transacao.getUser_id2() );
        ps.setInt(3, Transacao.getUser_id2() );
        ps.setInt(4, Transacao.getItem_id2() );
        ps.setInt(5, Transacao.getDelta_dinheiro() );
        ps.setString(6, Transacao.getData() );
        ps.setBoolean(7, Transacao.isFechada() );
        int result = ps.executeUpdate();
    } // atualizar

}
