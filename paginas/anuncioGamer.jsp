<%-- 
    Secao deve conter a variavel "idItemInventario" para
    resgatar o item de inventario visualisado aqui!!!
--%>
<%@page import="data.ItemDO"%>
<%@page import="data.ItemInventarioDO"%>
<%@page import="data.GamerDO"%>
<%@page import="data.LojaDO"%>
<%@page import="data.UsuarioDO"%>
<%@page import="java.util.List"%>
<%@page import="transacoes.Item" %>
<%@page import="transacoes.ItemInventario" %>
<%@page import="transacoes.Usuario" %>
<%@page import="transacoes.Gamer" %>
<%@page import="transacoes.Loja" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HttpSessionDemo - Anúncio</title>
    </head>
    
<%
        // Nome do admin logado
        String nome = (String)(session.getAttribute("nomeUsuario"));
        // Item de inventario do anuncio
        int itemInvId = Integer.valueOf(request.getParameter("idItemInventario"));
        ItemInventario tnII = new ItemInventario();
        Item tnI = new Item();
        ItemInventarioDO itemInv = tnII.buscar(itemInvId);
        ItemDO item = tnI.buscar(itemInv.getItemId());
        GamerDO gamer;
        LojaDO loja;
        
        String nomeDono, estado, tipo, linkPerfil;
        Usuario tnU = new Usuario();
        UsuarioDO user = tnU.buscar(itemInv.getUsuarioId());
        if (user.getTipo() == 1) {
            Gamer tnG = new Gamer();
            gamer = tnG.buscar(user.getId());
            nomeDono = gamer.getNome();
            linkPerfil = "perfilGamer.jsp";
        }
        else {
            Loja tnL = new Loja();
            loja = tnL.buscar(user.getId());
            nomeDono = loja.getNome();
            linkPerfil = "perfilLoja.jsp";
        }
        
        if(itemInv.getTipoTransacao() == 1)
            tipo = "venda";
        else if(itemInv.getTipoTransacao() == 2)
            tipo = "troca";
        else
            tipo = "venda & troca";
        
        if(itemInv.getEstado() == 1)
            estado = "novo";
        else if(itemInv.getEstado() == 2)
            estado = "como novo";
        else
            estado = "usado";
%>
<%-- cabeçalho--%>
    <div id="poli">
        <h1>POLI GAMES</h1>
    </div>
    
<%-- Tabela do lado esquerdo --%>
<div id="left">
    <table border="1px"  style="none">
        <thead>
            <tr>
                <th align="center" class="conta">
                    <a href="./gamer.jsp">Minha Conta</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <form method="post" action=index.jsp>
                <tr>
                    <td align="center">
                        <h3>Bem vindo <%= nome %> !!</h3>
                    </td>
                </tr>
                <tr>
                    <td><img id="foto" src="images/Logo.png"></td>
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
                    <td align="left"> 
                        <input type="submit" name="enviar" value="Buscar Item"/>
                        <input type="hidden" name="campo_controle" />
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</div>
                    
<%-- Fim da tabela do lado esquerdo e inicio das opçoes no topo --%>
<div>
        <div class="options">
            <a href="./insert.jsp">Inventário</a>
        </div> 
        <div class="options">
            <a href="./update.jsp">Wishlist</a>
        </div>
        <div class="options">
            <a href="./remove.jsp">Comunicados</a>
        </div>
        <div class="options">
            <a href="./search.jsp">Histórico</a>
        </div>
        <div class="options"> 
            <a href="./insert.jsp">Editar Conta</a>
        </div> 
</div>  

<div id="center">
    <input type="hidden" name="idVisitado" value="<% user.getId(); %>" />
    <h4 align="center"><% item.getNome(); %></h4>
    <div id="gameFoto">
    </div>
    <div id="anuncio">
        <table border="px" style="none">
            <tr>
                <td align="left"><em>Preço:</em></td>
                <td align="right"><em>R$<% String.valueOf(itemInv.getPreco()); %>,00</em></td>
            </tr>
            <tr>
                <td align="left"><em>Estado:</em></td>
                <td align="right"><em><% estado.toString(); %></em></td>
            </tr>
            <tr>
                <td align="left">(atual) <em>Proprietário:</em></td>
                <td align="right"><em><a href="<% linkPerfil.toString(); %>"><% nomeDono.toString(); %><a/></em>
            </tr>
            <tr>
                <td align="left"><em>Disponível para:</em></td>
                <td align="right"><em><% tipo.toString(); %></em></td>
            </tr>
            <tr>
<%
                if(itemInv.getTipoTransacao() == 1){
%>
                    <td><input type="submit" name="action" value="Comprar!" /></td>
<%
                }
                else if(itemInv.getTipoTransacao() == 2){
%>
                    <td><input type="submit" name="action" value="Trocar!" /></td>
<%
                }
                else {
%>
                    <td><input type="submit" name="action" value="Comprar!" /></td>
                    <td><input type="submit" name="action" value="Trocar!" /></td>
<%
                }
                if(session.getAttribute("action").equals("Comprar!"))
                    pageContext.forward("confirmarCompra.jsp");
                else if(session.getAttribute("action").equals("Trocar!"))
                    pageContext.forward("cproporTroca.jsp");
%>
            </tr>
        </table>
    </div>
</div>
<%-- Rodape --%>
        <div id="footer">
            <p>PMR2490 - Sistemas de Informação
            <br>Escola Politécnida da USP</p>
        </div>
        </div>
    

