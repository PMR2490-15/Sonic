<%-- 
    Secao deve conter a variavel "idItemInventario" para
    resgatar o item de inventario visualisado aqui!!!
--%>

<%@page import="data.ItemDO"%>
<%@page import="data.ItemInventarioDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Item" %>
<%@page import="transacoes.ItemInventario" %>
<%@page import="transacoes.Usuario" %>
<%@page import="transacoes.Gamer" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HttpSessionDemo - Anúncio</title>
    </head>
    <body>
<%
        // Nome do admin logado
        String nome = (String)(session.getAttribute("nomeUsuario"));
        // Item de inventario do anuncio
        int itemInvId = Integer.valueOf(session.getParameter("idItemInventario"));
        ItemInventario tn = new ItemInventario();
        Item tn2 = new Item();
        ItemInventarioDO itemInv = tn.buscar(itemInvId);
        ItemDO item = tn2.buscar(itemInv.getItemId());
        
        
        float preco = itemInv.getPreco();
        String estado;
        if(itemInv.getEstado() == 1)
            estado = "novo";
        else if(itemInv.getEstado() == 2)
            estado = "como novo";
        else
            estado = "usado";
%>
        <div style="background-image:url('images/spm2.jpg'); padding: 1px  ">
        <div id="poli">
            <h1>POLI GAMES</h1>
        </div>
<div id="left">
    <table border="1px"  style="none">
        <thead>
            <tr>
                <th align="center" class="conta">
                    <a href="./admin.jsp">Pagina Inicial</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=admin.jsp>
                <tr>
                    <td align="center">
                        <h3>Administrador <%= session.getAttribute("nomeUsuario") %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src="images/Venusaur.png"></td>
                </tr>
                <tr>
                    <table>
                        <tr>
                            <td><input type="text" name="usuario" /></td>
                        <td align="right"><img id="lupa" src="images/lupa.png"></td>
                        </tr>
                    </table>
                </tr>
                <tr>
                    <td align="right"> 
                        <input type="submit" name="enviar" value="Buscar Usuário"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                </tr>
                <tr>
                    <table>
                        <td><input type="text" name="usuario" /></td>
                        <td align="left"><img id="lupa" src="images/Super_Hammer.png"></td>
                    </table>
                </tr>
                <tr>
                    <td align="right"> 
                        <input type="submit" name="enviar" value="Banir Usuário"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</div>
<div>
        <div class="options">
            <a href="./insert.jsp">Cadastrar Item</a>
        </div> 
        <div class="options">
            <a href="./remove.jsp">Comunicados</a>
        </div>
        <div class="options"> 
            <a href="./insert.jsp">Editar Conta</a>
        </div> 
</div>  

                        <%--Centro--%>
        <div id="center">
            <h4 align="center"><%item.getNome();%></h4>
            <div id="gameFoto">
            </div>
            <div id="anuncio">
                <h5 align="center">Estado:
            </div>
        </div>
        
        <%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    </body>
</html>